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

namespace app\api\controller;

use library\Controller;
use Endroid\QrCode\QrCode;
use think\Db;
use library\File;
use think\facade\Session;
use library\tools\Data;
use think\Image;

/**
 * 首页
 * Class Index
 * @package app\index\controller
 */
class Index extends Controller
{
    public function webconfig()
    {
        $info = Db::name('LcInfo')->find(1);

        $data = array(
            'ad' => array(
                'activity_status' => $info['activity_status'],
                'activity_img' => $info['activity_img'],
                'url' => $info['activity_url'],
            ),
            "title" => $info['webname'],
            "web_name" => $info['webname'],
            "name" => $info['company'],
            "phone" => $info['tel'],
            "address" => $info['address'],
            "notice" => $info['notice'],
            "kefu_link" => $info['service'],
            "app_link" => $info['app'],
            "kefu_wx" => $info['wechat'],
            "kefu_qq" => $info['qq'],
            "kefu_tel" => $info['tel'],
            "ipcc_no" => $info['icp'],
            "is_maintain" => "N",
            "version" => "v1.2",
            "logo" => $info['tel'],
            "user_contract_name" => "用户协议",
            "user_contract_link" => "/art/12",
            "user_contract_ys_name" => "隐私协议",
            "user_contract_ys_link" => "/art/13",
            "sms_verify" => smsStatus('18001')
        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：发送短信验证码
     * @date: 2020/6/2 0002
     */
    public function register_code()
    {
        if ($this->request->isPost()) {
            $phone = $this->request->param('mobile');
            if (!$phone) $this->error("请输入手机号");
            if (Db::name('LcUser')->where(['phone' => $phone])->find()) $this->error('该账号已注册！');
            $sms_time = Db::name("LcSmsList")->where("phone = '$phone'")->order("id desc")->value('time');
            if ($sms_time && (strtotime($sms_time) + 300) > time()) $this->error("验证码五分钟内有效，请勿重复发送");
            $rand_code = rand(1000, 9999);
            Session::set('regSmsCode', $rand_code);
            $data = sendSms($phone, '18001', $rand_code);
            if ($data['code'] == '000') $this->success("操作成功");
            $this->error($data['msg']);
        }
    }

    /**
     * @description：发送忘记密码验证
     * @date: 2020/6/2 0002
     */
    public function forgetpwd_code()
    {
        if ($this->request->isPost()) {
            $phone = $this->request->param('mobile');
            if (!$phone) $this->error("请输入手机号");
            if (!Db::name('LcUser')->where(['phone' => $phone])->find()) $this->error('手机号不存在！');
            $sms_time = Db::name("LcSmsList")->where("phone = '$phone'")->order("id desc")->value('time');
            if ($sms_time && (strtotime($sms_time) + 300) > time()) $this->error("验证码五分钟内有效，请勿重复发送");
            $rand_code = rand(1000, 9999);
            Session::set('forgetSmsCode', $rand_code);
            $data = sendSms($phone, '18004', $rand_code);
            if ($data['code'] == '000') $this->success("操作成功");
            $this->error($data['msg']);
        }
    }

    /**
     * @description：忘记密码
     * @date: 2020/6/2 0002
     */
    public function forgetpwd()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if (!isMobile($data['mobile'])) $this->error('请输入正确的手机号');
            if (smsStatus('18004')) {
                if (!$data['code']) $this->error('请输入验证码');
                $sms_code = Db::name("LcSmsList")->where("phone = '{$data['mobile']}'")->order("id desc")->value('ip');
                if ($data['code'] != $sms_code) $this->error("验证码不正确");
            }
            $user = Db::name('LcUser')->where(['phone' => $data['mobile']])->find();
            if (!$user) $this->error('手机号不存在！');
            if (strlen($data['password']) < 6 || 16 < strlen($data['password'])) $this->error('请输入6-16位密码！');
            if ($user['mwpassword'] == $data['password']) $this->error("新密码与旧密码一致");
            $re = Db::name('LcUser')->where(['id' => $user['id']])->update(['password' => md5($data['password']), 'mwpassword' => $data['password']]);
            if ($re) $this->success("密码修改成功！");
            $this->error("未知错误");
        }
    }

    /**
     * Describe:首页初始化
     * DateTime: 2020/5/17 1:08
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function int()
    {
        $banner = Db::name('LcSlide')->where(['show' => 1])->order('sort asc,id desc')->select();

        $cats = Db::name('LcItemClass')->where(['pid' => 0])->order('sort asc,id desc')->limit(10)->select();

        $high_sales_items = Db::name('LcItem')->where(['status' => 1,'index_type'=>2])->where("stock > 0")->orderRaw("RAND()")->limit(10)->select();

        $recommend = Db::name('LcItem')->where(['status' => 1,'index_type'=>1])->where("stock > 0")->orderRaw("RAND()")->limit(8)->select();

        $member_items = Db::name('LcItem')->where(['status' => 1, 'is_special' => 1,'index_type'=>3])->where("stock > 0")->orderRaw("RAND()")->limit(3)->select();

        $new_lottery = Db::name('LcItem')->where(['status' => 1, 'num' => 1,'index_type'=>4])->where("stock > 0")->orderRaw("RAND()")->limit(2)->select();
        $new_lottery_images = array();
        foreach ($new_lottery as $v) {
            $new_lottery_images[] = $v['img'];
        }
        $info = Db::name('LcInfo')->field("activity1_status,activity1_url,activity1_img,fuli1,fuli2,fuli3,fuli4")->find(1);
        $data = array(
            'banner' => $banner,
            'activity' => array(
                'show_activity' => $info['activity1_status'],
                'image' => $info['activity1_img'],
                'link' => $info['activity1_url'],
                'fuli1' => $info['fuli1'],
                'fuli2' => $info['fuli2'],
                'fuli3' => $info['fuli3'],
                'fuli4' => $info['fuli4'],
            ),
            'cats' => $cats,
            'high_sales_items' => array(
                'list' => $high_sales_items,
                'show_high_sales_items' => true
            ),
            'member_items' => array(
                'list' => $member_items,
                'show_member_items' => true
            ),
            'new_lottery' => array(
                'data' => array(
                    'images' => $new_lottery_images
                ),
                'show_new_lottery' => true,
            ),
            'recommend' => array(
                'list' => $recommend,
                'show_recommend' => true,
            ),
            'seckill' => array(
                'data' => false,
                'show_seckill' => false
            ),

        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：热卖
     * @date: 2020/9/4 0004
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function hot_sales()
    {
        $data = Db::name('LcItem')->where(['status' => 1,'index_type'=>2])->where("stock > 0")->orderRaw("RAND()")->limit(10)->select();
        $this->success("操作成功", $data);
    }

    /**
     * @description：新人专享
     * @date: 2020/8/14 0014
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function new_user()
    {
        $page = $this->request->param('page');
        $member_news = Db::name('LcItem')->where(['status' => 1, 'num' => 1,'index_type'=>4])->where("stock > 0")->order('sort asc,id desc')->page($page)->select();
        $member_news_count = Db::name('LcItem')->where(['status' => 1, 'num' => 1,'index_type'=>4])->where("stock > 0")->count();
        $data = array(
            'list' => $member_news,
            'page' => $page,
            'totalCount' => $member_news_count,
        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：会员专享
     * @date: 2020/8/14 0014
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function member()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name("LcUser")->find($uid);
        $rate = Db::name('LcUserMember')->where("id = {$user['member']}")->value('discount');
        $page = $this->request->param('page');
        $member_news = Db::name('LcItem')->where(['status' => 1, 'is_special' => 1,'index_type'=>3])->where("stock > 0")->order('sort asc,id desc')->page($page)->select();
        $member_news_count = Db::name('LcItem')->where(['status' => 1, 'is_special' => 1,'index_type'=>3])->where("stock > 0")->count();
        $data = array(
            'list' => $member_news,
            'page' => $page,
            'totalCount' => $member_news_count,
            "vipName" => getUserMember($user['member']),
            'vipRate' => round($rate / 10, 1)
        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：新人福利
     * @date: 2020/8/14 0014
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function new_bonus()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name("LcUser")->find($uid);
        $data = array(
            'amount' => getReward('new_reward'),
            'is_auth' => $user['auth'] ? true : false,
            'is_grant' => $user['is_new_reward'] ? true : false,
        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：领取新人福利
     * @date: 2020/8/14 0014
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function new_bonus_grant()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $money = getReward('new_reward');
        addFinance($uid, $money, 1, "领取新人福利{$money}元");
        setNumber('LcUser', 'money', $money, 1, "id = {$uid} AND is_new_reward = '0'");
        Db::name('LcUser')->where(['id' => $uid, 'is_new_reward' => 0])->update(['is_new_reward' => 1]);
        $this->success("领取成功");
    }

    /**
     * Describe:关于我们列表
     * DateTime: 2020/5/17 1:22
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function about()
    {
        $article = Db::name('LcArticle')->where(['show' => 1, 'type' => 9])->order('sort asc,id desc')->select();
        $this->success("操作成功", ['list' => $article]);
    }

    /**
     * Describe:文章详情
     * DateTime: 2020/5/17 1:22
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function article_detail()
    {
        $id = $this->request->param('id');
        $article = Db::name('LcArticle')->field('title,content')->find($id);
        $this->success("操作成功", $article);
    }

    /**
     * Describe:分享
     * DateTime: 2020/5/17 19:34
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function share()
    {
        $share = Db::name('LcShare')->order('sort asc,id desc')->select();
        $this->success("操作成功", ['list' => $share]);
    }

    /**
     * Describe:分享查看
     * DateTime: 2020/5/17 19:34
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function share_view()
    {
        $this->checkToken();
        $id = $this->request->param('id');
        $uid = $this->userInfo['id'];
        $phone = Db::name('LcUser')->where(['id' => $uid])->value('phone');
        $share = Db::name('LcShare')->find($id);
        $n = ($uid % 20);
        if ($this->createQrcode($phone, $uid, true)) $share['down_image'] = '/upload/qrcode/user/' . $n . '/' . $uid . '-1.png';
        $this->success("操作成功", $share);
    }


    /**
     * @description：生成分享图
     * @date: 2020/9/4 0004
     * @param $invite_code
     * @param $user_id
     * @param bool $is_new
     * @return bool
     */
    private function createQrcode($invite_code, $user_id, $is_new = false)
    {
        $n = ($user_id % 20);
        $dir = './upload/qrcode/user/' . $n . '/' . $user_id . '.png';
        if (file_exists($dir) && $is_new) return true;
        $qrCode = new QrCode();
        $qrCode->setText(getInfo('domain') . '#/register?m=' . $invite_code);
        $qrCode->setSize(200);
        $dir = './upload/qrcode/user/' . $n;
        if (!file_exists($dir)) mkdir($dir, 0777, true);
        $qrCode->save($dir . '/' . $user_id . '.png');
        $qr = env('root_path') . 'public/upload/qrcode/user/' . $n . '/' . $user_id . '.png';
        $shareBg = env('root_path') . 'public' . getInfo('login_img');
        $image = \think\Image::open($shareBg);
        $image->water($qr, [314, 969])->save(env('root_path') . 'public/upload/qrcode/user/' . $n . '/' . $user_id . '-1.png');
        return true;
    }

    /**
     * Describe:上传分享
     * DateTime: 2020/5/17 20:01
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function share_upload()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $id = $this->request->param('id');
        $re = Db::name('LcShareList')->whereTime('time', 'today')->where(['sid' => $id, 'uid' => $uid])->whereIn('status', "0,1")->find();
        if ($re) $this->error("今日已分享，请明天再来");
        if (!($file = $this->getUploadFile()) || empty($file)) {
            $this->error("文件上传异常，文件可能过大或未上传");
        }
        if (!$file->checkExt(strtolower(sysconf('storage_local_exts')))) {
            $this->error("上传失败");
        }
        if ($file->checkExt('php,sh')) {
            $this->error("上传失败");
        }
        $this->safe = boolval(input('safe'));
        $this->uptype = $this->getUploadType();
        $this->extend = pathinfo($file->getInfo('name'), PATHINFO_EXTENSION);
        $name = File::name($file->getPathname(), $this->extend, '', 'md5_file');
        $info = File::instance($this->uptype)->save($name, file_get_contents($file->getRealPath()), $this->safe);
        if (is_array($info) && isset($info['url'])) {
            $img = $this->safe ? $name : $info['url'];
        } else {
            $this->error("上传失败");
        }
        $add = array(
            'sid' => $id,
            'uid' => $uid,
            'img' => $img,
            'time' => date('Y-m-d H:i:s'),
        );
        if (Db::name('LcShareList')->insert($add)) {
            $this->success("上传成功");
        }
        $this->error("上传失败");
    }

    /**
     * 获取文件上传方式
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    private function getUploadType()
    {
        $this->uptype = input('uptype');
        if (!in_array($this->uptype, ['local', 'oss', 'qiniu'])) {
            $this->uptype = sysconf('storage_type');
        }
        return $this->uptype;
    }

    /**
     * Describe:获取本地上传文件
     * DateTime: 2020/5/17 19:46
     * @return array|\think\File|null
     */
    private function getUploadFile()
    {
        try {
            return $this->request->file('file');
        } catch (\Exception $e) {
            $this->error(lang($e->getMessage()));
        }
    }

    /**
     * Describe:合同
     * DateTime: 2020/5/17 1:47
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item_contract()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $id = $this->request->param('id');
        $invest = Db::name('LcInvest')->where(['uid' => $uid, 'id' => $id])->find();
        if (!$invest) $this->error("暂无合同！");
        $user = Db::name('LcUser')->find($uid);
        $data = array(
            'title' => getInfo('webname'),
            'contract_no' => $invest['number'],
            'name1' => $user['name'],
            'name2' => getInfo('company'),
            'name3' => getItemField($invest['pid'], 'guarantee'),
            'item_name' => $invest['title'],
            'name1_idcard' => $user['idcard'],
            'item_money' => $invest['money'],
            'item_days' => $invest['day'],
            'item_apr' => $invest['rate'],
            'item_adddate' => $invest['time'],
            'item_enddate' => date('Y-m-d', strtotime('+' . $invest['day'] . ' day', strtotime($invest['time']))),
            'item_back_money' => getInvestMoney($invest['id']) + $invest['money'] - $invest['discount'],
            'item_type' => $invest['type2'],
            'contract_content' => getInfo('contract'),
            'contract_date' => date('Y年m月d日', strtotime($invest['time'])),
            'contract_image1' => getInfo('seal_img'),
            'contract_image2' => getInfo('safe_seal_img'),
        );
        $this->success("操作成功", $data);
    }

    /**
     * @description：项目分类
     * @date: 2020/9/1 0001
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item_class()
    {
        $data = Db::name('LcItemClass')->order("sort asc,id desc")->select();
        $result = Data::arr2tree($data);
        $this->success("操作成功", $result);
    }

    /**
     * @description：搜索项目
     * @date: 2020/9/1 0001
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item_search()
    {
        $param = $this->request->param();
        $sort = array(1 => 'sort asc', 2 => 'sales_base desc', 3 => 'min asc');
        if (isset($param['name'])) $where = "title LIKE '%{$param['name']}%'";
        elseif (isset($param['cats'])) $where = "class = '{$param['cats']}'";
        elseif (isset($param['first_cats'])) {
            $class = Db::name('LcItemClass')->order("sort asc,id desc")->select();
            $ids = join(',', Data::getArrSubIds($class, $param['first_cats']));
            $where = "class IN($ids)";
        } else $this->error("无效参数");
        $data = Db::name('LcItem')->where($where)->where("stock > 0")->order($sort[$param['sort_type']])->select();
        $this->success("获取成功", ['list' => $data]);
    }

    /**
     * @description：项目列表
     * @date: 2020/5/14 0014
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item()
    {
        $this->checkToken();
        $now = date('Y-m-d H:i:s');
        $data = Db::name('LcItem')->field("id,img,title,min,total,rate,percent,day,type,desc")->order("sort desc,id desc")->select();
        foreach ($data as &$v) {
            $v['apr_money'] = round($v['min'] * $v['rate'] / 100, 2);
            $v['schedule'] = round(getProjectPercent($v['id']), 2);
            $v['type_name'] = getProjectType($v['type']);
            $v['thumb'] = $v['img'];
        }
        $this->success("获取成功", ['list' => $data]);
    }

    /**
     * Describe:项目详情
     * DateTime: 2020/5/16 19:38
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item_view()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->find($uid);
        $id = $this->request->param('id');
        $data = Db::name('LcItem')->find($id);
        $data['apr_money'] = round($data['min'] * $data['rate'] / 100, 2);
        $data['type_name'] = getProjectType($data['type']);
        $data['start'] = date('Y-m-d');
        $data['end'] = date('Y-m-d', strtotime(date('Y-m-d')) + $data['day'] * 86400);
        $discount = Db::name("LcUserMember")->field('discount,rate,name')->find($user['member']);
        if ($data['is_special']) $data['special_price'] = $data['min'] * $discount['discount'] / 100;
        $data['user_apr'] = $discount['rate'];
        $data['vip_name'] = $discount['name'];
        $data['user_vip_rebate'] = $discount['discount'];
        $data['sum_money'] = round($data['apr_money'] * $data['day'], 2) + (isset($data['special_price']) ? $data['special_price'] - $data['discount'] : $data['min'] - $data['discount']);
        $data['is_sale'] = time() > strtotime($data['time'])?1:0;
        if(!$data['is_sale']) $data['down_time'] = strtotime($data['time'])*1000-time()*1000;
        $this->success("获取成功", ['view' => $data]);
    }

    /**
     * @description：初始化订单
     * @date: 2020/9/4 0004
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function item_check()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->find($uid);
        $member = Db::name("LcUserMember")->field('discount,rate,name')->find($user['member']);
        $param = $this->request->param();
        $items = json_decode($param['items'], true);
        $total_money = $special_money = $discount_money = 0;
        $list = array();
        if ($items) {
            foreach ($items as $k => $v) {
                $item = array();
                $item = Db::name("LcItem")->find($v['item_id']);
                $list[] = $item;
                $total_money += $item['min'] * $v['num'];
                if ($item['is_special']) {
                    $special_money += ($item['min'] - ($item['min'] * $member['discount'] / 100)) * $v['num'];
                    $list[$k]['special_money'] = ($item['min'] - ($item['min'] * $member['discount'] / 100)) * $v['num'];
                }
                $discount_money += $item['discount'] * $v['num'];
                $list[$k]['number'] = $v['num'];
                $list[$k]['item_id'] = $v['item_id'];
                $list[$k]['vip_name'] = $member['name'];
                $list[$k]['user_vip_rebate'] = $member['discount'];
            }
        }
        if ($list) {
            foreach ($list as &$v) {
                $v['apr_money'] = round($v['min'] * $v['rate'] / 100, 2);
                $v['type_name'] = getProjectType($v['type']);
            }
        }
        $data = array(
            'actual_money' => sprintf("%.2f", $total_money - $special_money - $discount_money),
            'total_money' => sprintf("%.2f", $total_money),
            'discount_money' => sprintf("%.2f", $special_money + $discount_money),
            'user_money' => sprintf("%.2f", $user['money']),
            'item_list' => $list,
            'is_coupon' => getInfo("show_coupon")
        );
        $this->success("操作成功", $data);
    }

    /**
     * Describe:提交订单
     * DateTime: 2020/9/5 3:19
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function item_apply()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $param = $this->request->param();
        $this->user = Db::name('LcUser')->find($uid);
        $member = Db::name("LcUserMember")->field('discount,rate,name')->find($this->user['member']);
        if ($this->user['auth'] != 1) $this->error('请实名认证后再投资', '', 405);
        $user_invest = Db::name('LcInvest')->where(['uid' => $uid])->find();
        if (!$user_invest && $this->user['mwpassword2'] == "123456") $this->error('请先设置交易密码', '', 410);
        if ($this->user['password2'] != md5($param['password'])) $this->error('交易密码不正确！');
        if (empty($param['items'])) $this->error('无效参数');
        $items = json_decode($param['items'], true);
        $items_ids = array_column($items, 'item_id');
        $actual_money = actual_money($items, $member['discount']);
        //抵用券
        $is_coupon = false;
        $coupon_xid = 0;
        $coupon_value = 0;
        if ($param['coupon_id'] > 0) {
            $now_time = time();
            $coupon = Db::name('LcCoupon')->where(['uid' => $uid, 'id' => $param['coupon_id'], 'status' => 1])->where("endAt > $now_time")->where("startAt < $now_time")->find();
            if (!$coupon) $this->error('无效优惠券！');
            if ($coupon['xid'] > 0 && !in_array($coupon['xid'], $items_ids)) $this->error('该优惠券为指定项目券！');
            $is_coupon = true;
            $coupon_value = $coupon['value'] / 100;
            $max_item = Db::name("LcItem")->field("id,min")->whereIn('id', implode(',', $items_ids))->select();
            $item_min = array_column($max_item, 'min');
            array_multisort($item_min, SORT_DESC, $max_item);
            $coupon_xid = $max_item[0]['id'];
            if ($coupon['xid'] > 0) $coupon_xid = $coupon['xid'];
        }
        //end
        if ($this->user['money'] < $actual_money) $this->error('余额不足，请充值后下单！');
        if ($items) {
            foreach ($items as $v) {
                $data = array();
                $data = Db::name('LcItem')->where(['id' => $v['item_id']])->find();
                if (!$data) $this->error("订单包含无效商品！");
                if (!$data['status']) $this->error("{$data['title']}-商品已下架");
                if (date('Y-m-d H:i:s') < $data['time']) $this->error("{$data['title']}-商品尚未开售");
                if ($data['stock'] == 0 || $data['stock'] < $v['num']) $this->error("{$data['title']}-商品库存不足");
                $my_count = Db::name('LcInvest')->where(['uid' => $uid, 'pid' => $v['item_id']])->count();
                if ($data['num'] <= $my_count || $data['num'] < $v['num']) $this->error("{$data['title']}-商品限每人购买" . $data['num'] . '次！');
                //开始下单
                $special_money = 0;
                if ($data['is_special']) $special_money = ($data['min'] - ($data['min'] * $member['discount'] / 100)) * intval($v['num']);
                $money = $data['min'] * intval($v['num']);
                $discount_money = $data['discount'] * intval($v['num']) + $special_money;
                if (getInvestList($v['item_id'], $money, $uid, $discount_money, $coupon_value)) {
                    $other_msg = "";
                    if ($is_coupon) {
                        $coupon_value = $coupon['value'] / 100;
                        if ($coupon_xid == $v['item_id']) $money = $money - $coupon_value;
                        Db::name('LcCoupon')
                            ->where(array('id' => $param['coupon_id'], 'uid' => $uid))
                            ->update(array('status' => 2));
                        $other_msg = "(代金券抵扣" . $coupon_value . "元)";
                    }
                    $money = $money - $discount_money;
                    if ($money <= 0) $money = 0;
                    addFinance($uid, $money, 2, '购买商品：' . $data['title'] . '，使用余额' . $money . '元' . $other_msg);
                    setNumber('LcUser', 'money', $money, 2, "id = $uid");
                    setNumber('LcItem', 'stock', $v['num'], 2, "id = {$v['item_id']}");
                    setNumber('LcItem', 'sales_base', $v['num'], 1, "id = {$v['item_id']}");
                    setInvestReward_old($uid, $money);
                    if (0 < $data['red']) {
                        $multiple = floor($money / $data['min']) * $data['red'] ?: 0;
                        if (0 < $multiple) {
                            addFinance($uid, $multiple, 1, '投资送红包');
                            setNumber('user', 'money', $multiple, 1, "id = $uid");
                        }
                    }
                    sendSms(getUserPhone($uid), '18002', $money);
                }
            }
            $this->success('投资成功！');
        }
        $this->error('下单失败！');
    }

    /**
     * @description：
     * @date: 2020/5/15 0015
     */
    public function sync()
    {
        $msg = 0;
        if ($this->checkLogin()) {
            $this->checkToken();
            $uid = $this->userInfo['id'];
            $msg = Db::name('LcMsg')->alias('msg')->where('(msg.uid = ' . $uid . ' or msg.uid = 0 ) and (select count(*) from lc_msg_is as msg_is where  msg.id = msg_is.mid  and ((msg.uid = 0 and msg_is.uid = ' . $uid . ') or ( msg.uid = ' . $uid . ' and msg_is.uid = ' . $uid . ') )) = 0')->count();
        }
        $data = ['check_dev_no' => false, 'is_open_notice_dialog' => $msg > 0 ? true : false];
        $this->success("操作成功", $data);
    }

    /**
     * @description：
     * @date: 2020/5/15 0015
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function login()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if (!$data['username'] || !$data['password']) $this->error("参数不全！");
            if (!isMobile($data['username'])) $this->error('请输入正确的手机号');
            $user = Db::name('LcUser')->where(['phone' => $data['username']])->find();
            if (!$user) $this->error('用户不存在！');
            if ($user['password'] != md5($data['password'])) $this->error('登录密码有误，请重试！');
            if ($user['clock'] == 0) $this->error('账号被锁定，请联系管理员！');
            Db::name('LcUser')->where(['id' => $user['id']])->update(['logintime' => time()]);
            $result = array(
                'token' => $this->getToken(['id' => $user['id'], 'phone' => $user['phone']]),
            );
            $this->success('登录成功', $result);
        }
    }

    /**
     * @description：注册
     * @date: 2020/5/15 0015
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function register()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if (!isMobile($data['mobile'])) $this->error('请输入正确的手机号');

            if (smsStatus('18001')) {
                if (!$data['code']) $this->error('请输入验证码');
                $sms_code = Db::name("LcSmsList")->where("phone = '{$data['mobile']}'")->order("id desc")->value('ip');
                if ($data['code'] != $sms_code) $this->error("验证码不正确");
            }
            if (Db::name('LcUser')->where(['phone' => $data['mobile']])->find()) $this->error('该账号已注册！');
            if (strlen($data['password']) < 6 || 16 < strlen($data['password'])) $this->error('请输入6-16位密码！');
            if ($data['password'] != $data['spassword']) $this->error("两次输入的密码不一致");
            $tid = 0;
            if (isset($data['t_mobile']) && isMobile($data['t_mobile'])) {
                $top = Db::name('LcUser')->where(['phone' => $data['t_mobile']])->value('id');
                $tid = $top ? $top : 0;
            } else {
                $tid = isset($data['t_mobile']) ? $data['t_mobile'] : 0;
            }
            if (isset($data['t_mobile']) && !Db::name('LcUser')->find($tid)) $this->error("无效邀请人！");
            $reward = Db::name('LcReward')->get(1);
            $member_id = Db::name('LcUserMember')->order("value asc")->value('id');
            $add = array(
                'phone' => $data['mobile'],
                'password' => md5($data['password']),
                'password2' => md5("123456"),
                'mwpassword' => $data['password'],
                'mwpassword2' => "123456",
                'top' => $tid,
                'logintime' => time(),
                'money' => $reward['register'] ?: 0,
                'clock' => 1,
                'value' => $reward['registerzzz'] ?: 0,
                'time' => date('Y-m-d H:i:s'),
                'ip' => $this->request->ip(),
                'member' => $member_id,
            );
            $uid = Db::name('LcUser')->insertGetId($add);
            if (empty($uid)) $this->error('系统繁忙，注册失败！');
            if ($reward['register'] > 0) {
                addFinance($uid, $reward['register'], 1, '会员注册，系统赠送' . $reward['register'] . '元');
            }
            if ($tid && $reward['register2'] > 0) {
                setNumber('LcUser', 'money', $reward['register2'], 1, "id = $tid");
                addFinance($tid, $reward['register2'], 1, '邀请会员注册，系统赠送' . $reward['register2'] . '元');
                setNumber('LcUser', 'income', $reward['register2'], 1, "id = $tid");
            }
            $data = array(
                'token' => $this->getToken(['id' => $uid, 'phone' => $data['mobile']]),
                'app_link' => getInfo('app')
            );
            $this->success("注册成功", $data);
        }
    }
}
