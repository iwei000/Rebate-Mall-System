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

namespace app\index\controller;

use library\Controller;
use think\Db;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends Controller
{

    /**
     * @description：首页
     * @date: 2020/5/13 0013
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        if(getInfo("pc_open")) $this->fetch();
        if(check_wap()) $this->fetch();
    }

    /**
     * Describe:定时结算任务
     * DateTime: 2020/5/14 22:22
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function item_crontab()
    {
        $now = time();
        $invest_list = Db::name("LcInvestList")->where("UNIX_TIMESTAMP(time1) <= $now AND status = '0'")->select();
        if (empty($invest_list)) exit('暂无返息计划');
        foreach ($invest_list as $k => $v) {
            $max = Db::name("LcInvestList")->field('id')->where(['uid' => $v['uid'], 'iid' => $v['iid']])->order('num desc')->find();
            $is_last = false;
            if ($v['id'] == $max['id']) $is_last = true;
            $data = array('time2' => date('Y-m-d H:i:s'), 'pay2' => $v['pay1'], 'status' => 1);
            if (Db::name("LcInvestList")->where(['id' => $v['id']])->update($data)) {
                if ($v['pay1'] > 0) {
                    if ($is_last) {
                        $discount_money = Db::name('LcInvest')->where(['id' => $v['iid']])->value('discount');
                        if ($discount_money > 0) $v['pay1'] = $v['pay1'] - $discount_money;
                        if ($v['pay1'] <= 0) $v['pay1'] = 0;
                        Db::name('LcInvest')->where(['id' => $v['iid']])->update(['status' => 1, 'time2' => date("Y-m-d H:i:s")]);
                    }
                    addFinance($v['uid'], $v['pay1'], 1, $v['title'] . ' 第' . $v['num'] . '期收益' . $v['pay1'] . '元');
                    setNumber('LcUser', 'money', $v['pay1'], 1, "id = {$v['uid']}");
                    setNumber('LcUser', 'income', $v['money1'], 1, "id = {$v['uid']}");
                    sendSms(getUserPhone($v['uid']), '18003', $v['pay1']);
                }
            }
        }
    }

    /**
     * Describe:支付宝APP支付回调
     * DateTime: 2020/12/07 2:07
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function alipay_notify(){
        $data = $this->request->param();
        $out_trade_no = $data['out_trade_no'];
        $trade_status =  $data['trade_status'];
        if ($trade_status == 'TRADE_FINISHED' || $trade_status == 'TRADE_SUCCESS') {
            require_once env("root_path") . "/vendor/alipayapp/aop/AopClient.php";
            $aop = new \AopClient();
            $aop->alipayrsaPublicKey = getInfo('alipay_public_key');
            $sign_check = $aop->rsaCheckV2($data, NULL, "RSA2");
            $recharge = Db::name("LcRecharge")->where(['orderid'=>$out_trade_no])->find();
            if($recharge&&$recharge['status'] == 0){
                $money = $recharge['money'];
                $uid = $recharge['uid'];
                $type = $recharge['type'];
                addFinance($uid, $money,1, $type . '入款' . $money . '元');
                setNumber('LcUser', 'money', $money, 1, "id = $uid");
                sendSms(getUserPhone($uid), '18005', $money);
                $tid = Db::name('LcUser')->where('id', $uid)->value('top');
                if($tid) setRechargeRebate($tid, $money);
                $res = Db::name("LcRecharge")->where(['orderid'=>$out_trade_no])->update(['status' => '1','time2' => date('Y-m-d H:i:s')]);
                if($res) echo 'success';
            }elseif ($recharge['status'] == 1){
                echo 'success';
            }else {
                echo 'fail';
            }
        }else {
            echo "fail";
        }
    }


    public function item_auto_sale(){
        $item = Db::name("LcItem")->field("id,auto")->where("auto > 0")->select();
        if($item){
            foreach ($item as $v){
                setNumber('LcItem', 'sales_base', $v['auto'], 1, "id = {$v['id']}");
            }
        }
    }
}
