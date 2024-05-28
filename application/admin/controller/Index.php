<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2019 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://demo.thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/ThinkAdmin
// | github 代码仓库：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\admin\controller;

use library\Controller;
use library\service\AdminService;
use library\service\MenuService;
use library\tools\Data;
use think\Console;
use think\Db;
use think\exception\HttpResponseException;

/**
 * 系统公共操作
 * Class Index
 * @package app\admin\controller
 */
class Index extends Controller
{

    /**
     * 显示后台首页
     * @throws \ReflectionException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $this->title = '系统管理后台';
        $auth = AdminService::instance()->apply(true);
        if(!$auth->isLogin()) $this->redirect('@admin/login');
        $this->menus = MenuService::instance()->getTree();
        if (empty($this->menus) && !$auth->isLogin()) {
            $this->redirect('@admin/login');
        } else {
            $this->fetch();
        }
    }

    /**
     * Describe:查询充值提现记录
     * DateTime: 2020/5/15 0:54
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function check(){
        $auth = AdminService::instance()->apply(true);
        if($auth->isLogin()){
            $cash_count = Db::name("LcCash")->where(['status'=>0,'warn'=>0])->count();
            $recharge_count = Db::name("LcRecharge")->where(['status'=>0,'warn'=>0])->count();
            if($cash_count>0&&$recharge_count>0){
                $this->success("您有{$cash_count}条新的提现记录和{$recharge_count}条新的充值记录，请查看！",['url'=>'/static/mp3/cztx.mp3']);
            }
            if($cash_count>0&&$recharge_count==0){
                $this->success("您有{$cash_count}条新的提现记录，请查看！",['url'=>'/static/mp3/tx.mp3']);
            }
            if ($cash_count == 0 && 0 < $recharge_count){
                $this->success("您有{$recharge_count}条新的充值记录，请查看！",['url'=>'/static/mp3/cz.mp3']);
            }
            $this->error("暂无记录");
        }
        $this->error("请先登录");
    }

    /**
     * Describe:忽略提醒
     * DateTime: 2020/5/15 0:56
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function system_ignore(){
        $auth = AdminService::instance()->apply(true);
        if($auth->isLogin()){
            Db::name("LcCash")->where(['warn'=>0])->update(['warn'=>1]);
            Db::name("LcRecharge")->where(['warn'=>0])->update(['warn'=>1]);
            $this->success("操作成功");
        }
        $this->error("请先登录");
    }

    /**
     * 后台环境信息
     */
    public function main()
    {
        /*$this->think_ver = \think\App::VERSION;
        $this->mysql_ver = Db::query('select version() as ver')[0]['ver'];*/
        $this->invest_count = Db::name('LcInvest')->count();
        $this->user_count = Db::name('LcUser')->count();
        $this->recharge_sum = Db::name('LcRecharge')->where("status = 1")->sum('money');
        $this->cash_sum = Db::name('LcCash')->where("status = 1")->sum('money');
        $table = $this->finance_report();
        $this->month = $table['month'];
        $this->last_month = $table['last_month'];
        $this->day = $table['day'];
        $this->fetch();
    }

    private function finance_report(){
        $firstDate = strtotime(date('Y-m-01 00:00:00', strtotime(date("Y-m-d"))));
        $lastDate = strtotime(date('Y-m-01 23:59:59', strtotime(date("Y-m-d")))." +1 month -1 day");
        $month['recharge'] = Db::name('LcRecharge')->where("UNIX_TIMESTAMP(time) BETWEEN $firstDate AND $lastDate AND status = 1")->sum('money');
        $month['cash'] = Db::name('LcCash')->where("UNIX_TIMESTAMP(time) BETWEEN $firstDate AND $lastDate AND status = 1")->sum('money');
        $month['invest_list'] = Db::name('LcInvestList')->where("UNIX_TIMESTAMP(time2) BETWEEN $firstDate AND $lastDate AND status = 1")->sum('pay1');
        $month['invest'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $firstDate AND $lastDate")->count();
        $month['invest_sum'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $firstDate AND $lastDate")->sum('money');

        $lastMonthFirstDate = strtotime(date('Y-m-01 00:00:00', strtotime(date("Y-m-d")))." -1 month");
        $lastMonthLastDate = strtotime(date('Y-m-01 23:59:59', strtotime(date("Y-m-d")))." -1 day");
        $lastMonth['recharge'] = Db::name('LcRecharge')->where("UNIX_TIMESTAMP(time) BETWEEN $lastMonthFirstDate AND $lastMonthLastDate AND status = 1")->sum('money');
        $lastMonth['cash'] = Db::name('LcCash')->where("UNIX_TIMESTAMP(time) BETWEEN $lastMonthFirstDate AND $lastMonthLastDate AND status = 1")->sum('money');
        $lastMonth['invest_list'] = Db::name('LcInvestList')->where("UNIX_TIMESTAMP(time2) BETWEEN $lastMonthFirstDate AND $lastMonthLastDate AND status = 1")->sum('pay1');
        $lastMonth['invest'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $lastMonthFirstDate AND $lastMonthLastDate")->count();
        $lastMonth['invest_sum'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $lastMonthFirstDate AND $lastMonthLastDate")->sum('money');

        $monthDays = $this->getMonthDays();
        foreach($monthDays as $k=>$v){
            $first = strtotime($v);
            $last = $first+86400-1;
            $day[$k]['date'] = $v;
            $day[$k]['recharge'] = Db::name('LcRecharge')->where("UNIX_TIMESTAMP(time) BETWEEN $first AND $last AND status = 1")->sum('money');
            $day[$k]['cash'] = Db::name('LcCash')->where("UNIX_TIMESTAMP(time) BETWEEN $first AND $last AND status = 1")->sum('money');
            $day[$k]['invest_list'] = Db::name('LcInvestList')->where("UNIX_TIMESTAMP(time2) BETWEEN $first AND $last AND status = 1")->sum('pay1');
            $day[$k]['new_user'] = Db::name('LcUser')->where("UNIX_TIMESTAMP(time) BETWEEN $first AND $last")->count();
            $day[$k]['invest'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $first AND $last")->count();
            $day[$k]['invest_sum'] = Db::name('LcInvest')->where("UNIX_TIMESTAMP(time) BETWEEN $first AND $last")->sum('money');
            $day[$k]['expire'] = Db::name('LcInvestList')->where("UNIX_TIMESTAMP(time1) BETWEEN $first AND $last")->sum('money2');
            $day[$k]['interest'] = Db::name('LcInvestList')->where("UNIX_TIMESTAMP(time1) BETWEEN $first AND $last")->sum('money1');
        }
        return array('day' => $day,'month' => $month,'last_month'=>$lastMonth);
    }

    /**
     * 获取当前月已过日期
     * @return array
     */
    private function getMonthDays()
    {
        $monthDays = [];
        $firstDay = date('Y-m-01', time());
        $i = 0;
        $now_day = date('d');
        $lastDay = date('Y-m-d', strtotime("$firstDay +1 month -1 day"));
        while (date('Y-m-d', strtotime("$firstDay +$i days")) <= $lastDay) {
            // if($i>=$now_day) break;
            $monthDays[] = date('Y-m-d', strtotime("$firstDay +$i days"));
            $i++;
        }
        return $monthDays;
    }

    /**
     * 修改密码
     * @login true
     * @param integer $id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function pass($id)
    {
        $this->applyCsrfToken();
        if (intval($id) !== intval(session('user.id'))) {
            $this->error('只能修改当前用户的密码！');
        }
        if (!AdminService::instance()->isLogin()) {
            $this->error('需要登录才能操作哦！');
        }
        if ($this->request->isGet()) {
            $this->verify = true;
            $this->_form('SystemUser', 'admin@user/pass', 'id', [], ['id' => $id]);
        } else {
            $data = $this->_input([
                'password'    => $this->request->post('password'),
                'repassword'  => $this->request->post('repassword'),
                'oldpassword' => $this->request->post('oldpassword'),
            ], [
                'oldpassword' => 'require',
                'password'    => 'require|min:4',
                'repassword'  => 'require|confirm:password',
            ], [
                'oldpassword.require' => '旧密码不能为空！',
                'password.require'    => '登录密码不能为空！',
                'password.min'        => '登录密码长度不能少于4位有效字符！',
                'repassword.require'  => '重复密码不能为空！',
                'repassword.confirm'  => '重复密码与登录密码不匹配，请重新输入！',
            ]);
            $user = Db::name('SystemUser')->where(['id' => $id])->find();
            if (md5($data['oldpassword']) !== $user['password']) {
                $this->error('旧密码验证失败，请重新输入！');
            }
            if (Data::save('SystemUser', ['id' => $user['id'], 'password' => md5($data['password'])])) {
                $this->success('密码修改成功，下次请使用新密码登录！', '');
            } else {
                $this->error('密码修改失败，请稍候再试！');
            }
        }
    }

    /**
     * 修改用户资料
     * @login true
     * @param integer $id 会员ID
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function info($id = 0)
    {
        if (!AdminService::instance()->isLogin()) {
            $this->error('需要登录才能操作哦！');
        }
        $this->applyCsrfToken();
        if (intval($id) === intval(session('user.id'))) {
            $this->_form('SystemUser', 'admin@user/form', 'id', [], ['id' => $id]);
        } else {
            $this->error('只能修改登录用户的资料！');
        }
    }

    /**
     * 清理运行缓存
     * @auth true
     */
    public function clearRuntime()
    {
        try {
            Console::call('clear');
            Console::call('xclean:session');
            $this->success('清理运行缓存成功！');
        } catch (HttpResponseException $exception) {
            throw $exception;
        } catch (\Exception $e) {
            $this->error("清理运行缓存失败，{$e->getMessage()}");
        }
    }

    /**
     * 压缩发布系统
     * @auth true
     */
    public function buildOptimize()
    {
        try {
            Console::call('optimize:route');
            Console::call('optimize:schema');
            Console::call('optimize:autoload');
            Console::call('optimize:config');
            $this->success('压缩发布成功！');
        } catch (HttpResponseException $exception) {
            throw $exception;
        } catch (\Exception $e) {
            $this->error("压缩发布失败，{$e->getMessage()}");
        }
    }

}
