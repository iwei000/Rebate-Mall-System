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

/**
 * 用户中心
 * Class Index
 * @package app\index\controller
 */
class User extends Controller
{
    public function info()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name("LcUser")->find($uid);
        $wait_money = Db::name('LcInvestList')->where("uid = $uid AND status = '0' AND money2 > 0")->sum('money2');
        $discount_money = Db::name('LcInvest')->where("uid = $uid AND time2 = '' AND discount > 0")->sum('discount');
        $wait_lixi = Db::name('LcInvestList')->where("uid = $uid AND status = '0' AND money1 > 0")->sum('money1');
        $all_money = Db::name('LcInvestList')->where("uid = $uid AND status = '1' AND money1 > 0")->sum('money1');
        $msg = Db::name('LcMsg')->alias('msg')->where('(msg.uid = ' . $uid . ' or msg.uid = 0 ) and (select count(*) from lc_msg_is as msg_is where  msg.id = msg_is.mid  and ((msg.uid = 0 and msg_is.uid = ' . $uid . ') or ( msg.uid = ' . $uid . ' and msg_is.uid = ' . $uid . ') )) = 0')->count();
        $data = array(
            "ds_apr_money" => sprintf("%.2f", $wait_lixi),
            "ds_money" => sprintf("%.2f", $wait_money - $discount_money),
            "all_money" => sprintf("%.2f", $all_money),
            "reward" => sprintf("%.2f", $user['reward']),
            "is_new_notice" => $msg > 0 ? true : false,
            "mobile" => $user['phone'],
            "baoku_money" => $user['baoku_money'],
            "money" => $user['money'],
            "name" => $user['name'],
            "uid" => $uid,
            "is_auth" => $user['auth'],
            "user_icon" => getInfo('logo_img'),
            "credit" => $user['integral'],
            "vip_name" => getUserMember($user['member']),
        );
        $this->success("获取成功", $data);
    }

    /**
     * Describe:会员分享
     * DateTime: 2020/5/17 14:03
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function share()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $phone = Db::name('LcUser')->where(['id' => $uid])->value('phone');
        $share_user = Db::name('LcUser')->where(['top' => $uid])->field('phone,time')->select();
        $reward = Db::name('LcReward')->field("invest1,invest2,invest3")->find(1);
        $qrCode = new QrCode();
        $qrCode->setText(getInfo('domain') . '/#/register?m=' . $phone);
        $qrCode->setSize(300);
        $shareCode = $qrCode->getDataUri();
        $data = array(
            'share_user' => $share_user,
            'share_image_url' => $shareCode,
            'reward'=>array(
                'invest1'=>$reward['invest1'],
                'invest2'=>$reward['invest2'],
                'invest3'=>$reward['invest3'],
            )
        );
        $this->success("获取成功", $data);
    }

    /**
     * @description：购物车列表
     * @date: 2020/9/4 0004
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cart()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->find($uid);
        $list = Db::name("LcItemCart")->alias("c")->field("c.id,c.number,c.item_id,i.title,i.min,i.is_special,i.discount,i.img,i.stock,i.num as type_num")->join("lc_item i", "c.item_id = i.id")->where("c.uid = $uid AND i.status = 1 AND i.stock > 0")->order("c.id desc")->select();
        $discount = Db::name("LcUserMember")->field('discount,rate,name')->find($user['member']);
        foreach ($list as &$v) {
            if ($v['is_special']) $v['special_price'] = $v['min'] * $discount['discount'] / 100;
        }
        $this->success("获取成功", ['list' => $list, 'count' => count($list)]);
    }

    /**
     * @description：添加到购物车
     * @date: 2020/9/4 0004
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cart_add()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $param = $this->request->param();
        if (!is_numeric($param['num']) && $param['num'] <= 0) $this->error("无效参数");
        if (Db::name("LcItem")->where(['id' => $param['item_id']])->where("stock > 0 AND status = 1")->find()) {
            $cart = Db::name("LcItemCart")->where(['item_id' => $param['item_id'], 'uid' => $uid])->find();
            if ($cart) setNumber("LcItemCart", "number", $param['num'], 1, ['item_id' => $param['item_id'], 'uid' => $uid]);
            else Db::name("LcItemCart")->insert(['item_id' => $param['item_id'], 'uid' => $uid, 'number' => $param['num']]);
            $this->success("操作成功");
        } else {
            $this->error("商品库存不足！");
        }
    }

    /**
     * @description：计算购物车
     * @date: 2020/9/4 0004
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cart_check()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->find($uid);
        $member = Db::name("LcUserMember")->field('discount,rate,name')->find($user['member']);
        $param = $this->request->param();
        $items = json_decode($param['items'], true);
        $total_money = $special_money = $discount_money = 0;
        if ($items) {
            foreach ($items as $v) {
                $item = array();
                $item = Db::name("LcItem")->find($v['item_id']);
                $total_money += $item['min'] * $v['num'];
                if ($item['is_special']) $special_money += ($item['min'] - ($item['min'] * $member['discount'] / 100)) * $v['num'];
                $discount_money += $item['discount'] * $v['num'];
            }
        }
        $data = array(
            'actual_money' => sprintf("%.2f", $total_money - $special_money - $discount_money),
            'total_money' => sprintf("%.2f", $total_money),
            'discount_money' => sprintf("%.2f", $special_money + $discount_money),
            'user_money' => sprintf("%.2f", $user['money']),
        );
        $this->success("获取成功", $data);
    }

    /**
     * @description：更新购物车
     * @date: 2020/9/4 0004
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function update_cart()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $param = $this->request->param();
        if (!is_numeric($param['number']) && $param['number'] < 1) $this->error("无效操作");
        Db::name("LcItemCart")->where(['uid' => $uid, 'id' => $param['id']])->update(['number' => $param['number']]);
        $this->success("操作成功");
    }

    /**
     * @description：清空购物车
     * @date: 2020/9/4 0004
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function cart_del()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $param = $this->request->param();
        if ($param['ids']) Db::name("LcItemCart")->whereIn('id', $param['ids'])->where(['uid' => $uid])->delete();
        $this->success("操作成功");
    }

    /**
     * Describe:订单列表
     * DateTime: 2020/9/5 13:41
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function order()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $list = Db::name('LcInvest')->field("title,id,money,discount,time,time2")->where('uid', $uid)->order("id desc")->select();
        $wait_money = Db::name('LcInvestList')->where("uid = $uid AND status = '0' AND money2 > 0")->sum('money2');
        $discount_money = Db::name('LcInvest')->where("uid = $uid AND time2 = '' AND discount > 0")->sum('discount');
        $wait_lixi = Db::name('LcInvestList')->where("uid = $uid AND status = '0' AND money1 > 0")->sum('money1');
        $all_money = Db::name('LcInvestList')->where("uid = $uid AND status = '1' AND money1 > 0")->sum('money1');
        $this->success("获取成功", ['list' => $list, 'on_money' => sprintf("%.2f", $wait_money - $discount_money), 'on_apr_money' => sprintf("%.2f", $wait_lixi), 'ok_apr_money' => sprintf("%.2f", $all_money)]);
    }

    /**
     * Describe:订单详情
     * DateTime: 2020/9/5 15:00
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function order_detail()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name("LcUser")->find($uid);
        $id = $this->request->param('id');
        if (!$id || !is_numeric($id)) $this->error("无效参数");
        $invest = Db::name('LcInvest')->alias("i")->field("i.*,t.img,t.min,t.is_special,t.rate as goods_rate,t.discount as goods_discount")->join("lc_item t", "i.pid = t.id")->where(['i.uid' => $uid, 'i.id' => $id])->find();
        $invest['special_price'] = 0;
        if ($invest['is_special']) $invest['special_price'] = sprintf("%.2f", $invest['min'] * (100 - $invest['goods_discount']) / 100);
        $member = Db::name("LcUserMember")->field("name,rate,discount")->find($user['member']);
        if (!$invest) $this->error("暂无数据！");
        $this->success("获取成功", ['member' => $member, 'invest' => $invest]);
    }

    /**
     * Describe:返佣明细
     * DateTime: 2020/9/5 15:00
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function aprlist()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $id = $this->request->param('cid');
        $page = $this->request->param('page_curren');
        $page_num = $this->request->param('page_num');
        if (!$id || !is_numeric($id)) $this->error("无效参数");
        $list = Db::name('LcInvestList')->where(['uid' => $uid, 'iid' => $id])->order('id asc')->page($page, $page_num)->select();
        $discount = Db::name('LcInvest')->where(['id' => $id])->value("discount");
        $this->success("获取成功", ['list' => $list, 'discount' => $discount]);
    }

    /**
     * @description：地址列表
     * @date: 2020/9/3 0003
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function address()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $result = Db::name("LcAddress")->where(['uid' => $uid])->select();
        $this->success("获取成功", ['list' => $result]);
    }

    /**
     * @description：地址详情
     * @date: 2020/9/3 0003
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function address_view()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $id = $this->request->param('id');
        $result = Db::name("LcAddress")->where(['uid' => $uid, 'id' => $id])->find();
        $this->success("获取成功", $result);
    }

    /**
     * @description：保存收货地址
     * @date: 2020/9/3 0003
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function address_save()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $data = $this->request->param();
        $update = array(
            'name' => $data['name'],
            'address' => $data['addressDetail'],
            'area_code' => $data['areaCode'],
            'city' => $data['city'],
            'county' => $data['county'],
            'postal_code' => $data['postalCode'],
            'province' => $data['province'],
            'tel' => $data['tel'],
            'uid' => $uid
        );
        if (isset($data['id'])) {
            Db::name('LcAddress')->where(['id' => $data['id'], 'uid' => $uid])->update($update);
        } else {
            Db::name('LcAddress')->insert($update);
        }
        $this->success("操作成功");
    }

    public function logistics()
    {
        $this->success("操作成功", ['list' => []]);
    }

    /**
     * Describe:获取银行卡
     * DateTime: 2020/5/16 16:37
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bank()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $bank = Db::name('LcBank')->where(['uid' => $userInfo['id']])->order('id desc')->select();
        foreach ($bank as $k => $v) {
            $bank[$k]['account'] = dataDesensitization($v['account'], 4, 8);
        }
        $data = array(
            'count' => count($bank),
            'list' => $bank,
        );
        $this->success("获取成功", $data);
    }

    /**
     * Describe:获取银行卡及支付宝
     * DateTime: 2020/5/17 21:59
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function my_bank()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $this->user = Db::name('LcUser')->find($userInfo['id']);
        $bank = Db::name('LcBank')->where(['uid' => $userInfo['id']])->order('id desc')->select();
        foreach ($bank as $k => $v) {
            $bank[$k]['account'] = dataDesensitization($v['account'], 4, 8);
        }
        $data = array(
            'count' => count($bank),
            'bank' => $bank,
            'money' => $this->user['money']
        );
        $this->success("获取成功", $data);
    }

    /**
     * Describe:添加银行卡
     * DateTime: 2020/5/16 16:47
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bank_add()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $card = input('post.card/s', '');
        $bank = input('post.bank/s', '');
        $area = input('post.area/s', '');
        $this->user = Db::name('LcUser')->find($uid);
        if ($this->user['auth'] != 1) $this->error("请实名认证后再添加！");
        $check_bank = Db::name('LcBank')->where(['account' => $card])->find();
        if ($check_bank) $this->error("此银行卡已存在,请勿重复添加！");
        if (getInfo('bank') == 1) {
            $auth_check = bankAuth($this->user['name'], $card, $this->user['idcard']);
            if ($auth_check['code'] == 0) $this->error($auth_check['msg']);
            $bank = $auth_check['bank'];
        } else {
            if (empty($card) || empty($bank)) $this->error('请输入所属银行和银行卡号！');
        }
        $add = ['uid' => $uid, 'bank' => $bank, 'area' => $area, 'account' => $card, 'name' => $this->user['name']];
        if (Db::name('LcBank')->insert($add)) $this->success("添加成功");
        $this->error("添加失败");
    }

    /**
     * Describe:删除银行卡
     * DateTime: 2020/5/16 16:38
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function bank_remove()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $id = input('post.id/d', '');
        $re = Db::name('LcBank')->where(['uid' => $userInfo['id'], 'id' => $id])->delete();
        if ($re) $this->success("操作成功");
        $this->error("操作失败");
    }

    /**
     * Describe:重置密码
     * DateTime: 2020/5/16 16:52
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function repasswd()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $password = input('post.passwd/s', '');
        $newpassword = input('post.npasswd/s', '');
        if (mb_strlen($newpassword) < 6) $this->error("登录密码最少为6位");
        $user = Db::name('LcUser')->where(['id' => $userInfo['id'], 'password' => md5($password)])->find();
        if (!$user) $this->error("旧密码错误！");
        $data = ['password' => md5($newpassword), 'mwpassword' => $newpassword];
        //开启事务
        Db::startTrans();
        $res = Db::name('LcUser')->where('id', $userInfo['id'])->update($data);
        if ($res) {
            Db::commit();
            $this->success("修改成功");
        } else {
            Db::rollback();
            $this->error("修改失败");
        }
    }

    /**
     * Describe:根据登录密码重置交易密码
     * DateTime: 2020/5/16 16:59
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function resetpaypwd()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $password = input('post.passwd/s', '');
        $newpassword = input('post.npasswd/s', '');
        if (mb_strlen($newpassword) < 6) $this->error("支付密码最少为6位");
        $user = Db::name('LcUser')->where(['id' => $uid, 'password' => md5($password)])->find();
        if (!$user) $this->error("旧密码错误！");
        $data = ['password2' => md5($newpassword), 'mwpassword2' => $newpassword];
        //开启事务
        Db::startTrans();
        $res = Db::name('LcUser')->where('id', $uid)->update($data);
        if ($res) {
            Db::commit();
            $this->success("修改成功");
        } else {
            Db::rollback();
            $this->error("修改失败");
        }
    }

    /**
     * Describe:重置交易密码
     * DateTime: 2020/5/16 16:59
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function resetpaypwd_code()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $data = $this->request->param();
        if (!isMobile($data['mobile'])) $this->error('请输入正确的手机号');
        if (smsStatus('18004')) {
            if (!$data['code']) $this->error('请输入验证码');
            $sms_code = Db::name("LcSmsList")->where("phone = '{$data['mobile']}'")->order("id desc")->value('ip');
            if ($data['code'] != $sms_code) $this->error("验证码不正确");
        }
        $user = Db::name('LcUser')->where(['phone' => $data['mobile'], 'id' => $uid])->find();
        if (!$user) $this->error('手机号不存在！');
        if (payPassIsContinuity($data['npassword'])) $this->error("支付密码过于简单或不合法");
        $data = ['password2' => md5($data['npassword']), 'mwpassword2' => $data['npassword']];
        //开启事务
        Db::startTrans();
        $res = Db::name('LcUser')->where('id', $uid)->update($data);
        if ($res) {
            Db::commit();
            $this->success("修改成功");
        } else {
            Db::rollback();
            $this->error("修改失败");
        }
    }

    /**
     * Describe:获取提现银行卡
     * DateTime: 2020/5/16 17:53
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cost_bank()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $bank = Db::name('LcBank')->where(['uid' => $userInfo['id']])->order('id desc')->find();
        if (!$bank) $this->error("请先绑定银行卡");
        $money = Db::name('LcUser')->where(['id' => $userInfo['id']])->value('money');
        $data = array(
            'bank' => array(
                'id' => $bank['id'],
                'bank' => $bank['bank'],
                'account' => dataDesensitization($bank['account'], 4, 8)
            ),
            'money' => $money
        );
        $this->success("获取成功", $data);
    }

    /**
     * Describe:提现申请
     * DateTime: 2020/5/16 18:06
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function cost_apply()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $this->user = Db::name('LcUser')->find($uid);
        $this->min_cash = getInfo('cash');
        $this->bank = Db::name('LcBank')->where('uid', $uid)->order("id desc")->select();
        if ($this->app->request->isPost()) {
            if ($this->user['auth'] != 1) $this->error("请先实名认证！", '', 405);
            $data = $this->request->param();
            if (!is_numeric($data['money'])||$data['money']<=0) $this->error('ERROR 404');
            if (!$this->bank) $this->error('请先绑定提现银行卡！');
            if ($data['bank_id'] != 0) {
                $bank = Db::name('LcBank')->where('id', $data['bank_id'])->find();
                if ($bank['uid'] != $uid || empty($bank)) $this->error('提现银行卡暂时不能使用！');
            } else {
                if (empty($this->user['alipay'])) $this->error('请先设置支付宝！');
            }
            $invest = Db::name('LcInvest')->where('uid', $uid)->find();
            $today = date('Y-m-d 00:00:00');
            if ($this->user['password2'] != md5($data['passwd'])) $this->error('交易密码不正确！');
            if ($data['money'] < $this->min_cash) $this->error('提现金额不能小于' . $this->min_cash . '元');
            if ($this->user['money'] < $data['money']) $this->error('提现金额大于会员余额！');
            if (empty($invest)) $this->error('未投资不能提现！');
            if (15 <= Db::name('LcCash')->where("uid = $uid AND status = 1 AND time > '$today'")->count()) $this->error('每日提现限十五次！');
            if ($data['bank_id'] == 0) {
                $add = array('uid' => $uid, 'name' => $this->user['name'], 'bid' => $data['bank_id'], 'bank' => '支付宝', 'area' => 0, 'account' => $this->user['alipay'], 'money' => $data['money'], 'status' => 0, 'time' => date('Y-m-d H:i:s'), 'time2' => '0000-00-00 00:00:00');
            } else {
                $add = array('uid' => $uid, 'name' => $this->user['name'], 'bid' => $data['bank_id'], 'bank' => $bank['bank'], 'area' => $bank['area'] ?: 0, 'account' => $bank['account'], 'money' => $data['money'], 'status' => 0, 'time' => date('Y-m-d H:i:s'), 'time2' => '0000-00-00 00:00:00');
            }
            if (Db::name('LcCash')->insert($add)) {
                addFinance($uid, $data['money'], 2, "余额提现{$data['money']}元");
                setNumber('LcUser', 'money', $data['money'], 2, "id = $uid");
                $this->success('提现申请成功！');
            } else {
                $this->error('提现失败！');
            }
        }
    }

    /**
     * Describe:充值选项
     * DateTime: 2020/5/17 13:41
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recharge()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->find($uid);
        $info = Db::name('LcInfo')->find(1);
        $data = array(
            'money' => $user['money'],
            'min_recharge' => $info['min_recharge'],
            'config' => array(
                array(
                    'key' => 'wx',
                    'name' => '微信支付',
                    'is_show' => $info['qr_wechat_status']
                ),
                array(
                    'key' => 'alipay_app',
                    'name' => '支付宝',
                    'is_show' => $info['alipay_app_status']
                ),
                array(
                    'key' => 'alipay',
                    'name' => '支付宝扫码',
                    'is_show' => $info['qr_alipay_status']
                ),
                array(
                    'key' => 'bank',
                    'name' => '银行汇款',
                    'is_show' => $user['value']>=$info['pay_bankbz']?$info['pay_bank_status']:0,
                    'apr' => $info['pay_bank_give'],
                ),
                array(
                    'key' => 'gz_bank',
                    'name' => '公账入款',
                    'is_show' => $user['value']>=$info['gz_bankbz']?$info['gz_bank_status']:0,
                    'apr' => $info['gz_bankz'],
                ),
                array(
                    'key' => 'alipay_bank',
                    'name' => '支付宝转银行卡',
                    'is_show' => $user['value']>=$info['alipay_bankbz']?$info['alipay_bank_status']:0,
                    'apr' => $info['alipay_bank_give'],
                )
            ,
                array(
                    'key' => 'wx_bank',
                    'name' => '微信转银行卡',
                    'is_show' => $user['value']>=$info['wx_bankbz']?$info['wx_bank_status']:0,
                    'apr' => $info['wx_bank_give'],
                )
            )
        );
        $this->success('获取成功！', $data);
    }

    /**
     * Describe:充值
     * DateTime: 2020/5/17 13:26
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recharge_type()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $this->user = Db::name('LcUser')->find($uid);
        $type = $this->request->param('type');
        $money = $this->request->param('money');
        $info = Db::name('LcInfo')->find(1);
        if ($money < $info['min_recharge']) $this->error("最低充值{$info['min_recharge']}元");
        if (getPayName($type) == '未知支付') $this->error("请更换支付方式");
        if ($this->user['auth'] != 1) $this->error("请先实名认证", "", 405);
        $orderid = 'PAY' . date('YmdHis') . rand(1000, 9999) . rand(100, 999);
        $add = array(
            'orderid' => $orderid,
            'uid' => $uid,
            'money' => $money,
            'type' => getPayName($type),
            'status' => 0,
            'time' => date('Y-m-d H:i:s'),
            'time2' => '0000-00-00 00:00:00'
        );
        $re = Db::name('LcRecharge')->insertGetId($add);
        if ($type == 'alipay_app') {
            $notify_url = getInfo("domain") . "/index/index/alipay_notify";
            $res = $this->alipay_app("APP支付", $orderid, $money, $notify_url);
            $data = array('alipay_app'=>htmlspecialchars_decode($res));
            if ($re) $this->success('获取成功！', $data);
        }
        $data = array(
            'wx' => array(
                'image' => $info['qr_wechat_img'],
                'content' => $info['qr_wechat'],
                'rid' => $re,
            ),
            'alipay' => array(
                'image' => $info['qr_alipay_img'],
                'content' => $info['qr_alipay'],
                'rid' => $re,
            ),
            'bank' => array(
                'bank_card' => $info['pay_bank_account'],
                'bank_name' => $info['pay_bank_type'],
                'bank_user' => $info['pay_bank_name'],
                'bank_remark' => $info['pay_bank'],
                'rid' => $re,
            ),
            'gz_bank' => array(
                'bank_card' => $info['gz_bank_account'],
                'bank_name' => $info['gz_bank_type'],
                'bank_user' => $info['gz_bank_name'],
                'bank_remark' => $info['gz_bank'],
                'rid' => $re,
            ),
            'alipay_bank' => array(
                'bank_card' => $info['alipay_bank_account'],
                'bank_name' => $info['alipay_bank_type'],
                'bank_user' => $info['alipay_bank_name'],
                'bank_remark' => $info['alipay_bank'],
                'rid' => $re,
            ),
            'wx_bank' => array(
                'bank_card' => $info['wx_bank_account'],
                'bank_name' => $info['wx_bank_type'],
                'bank_user' => $info['wx_bank_name'],
                'bank_remark' => $info['wx_bank'],
                'rid' => $re,
            ),
        );
        if ($re) $this->success('获取成功！', $data[$type]);
        $this->error("操作失败");
    }

    /**
     * Describe:支付宝APP支付统一下单
     * DateTime: 2020/12/07 23:49
     * @param $body
     * @param $order_sn
     * @param $total_amount
     * @param $notify_url
     * @return string
     */
    private function alipay_app($body, $order_sn, $total_amount, $notify_url)
    {
        require_once env("root_path") . "/vendor/alipayapp/aop/AopClient.php";
        require_once env("root_path") . "/vendor/alipayapp/aop/request/AlipayTradeAppPayRequest.php";
        $info = Db::name('LcAlipaySet')->where(['status'=>1])->orderRaw("RAND()")->find();
        $aop = new \AopClient();
        $aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
        $aop->appId = $info['appid'];
        $aop->rsaPrivateKey = $info['private_key'];
        $aop->format = 'json';
        $aop->charset = 'UTF-8';
        $aop->signType = 'RSA2';
        $aop->alipayrsaPublicKey = $info['public_key'];
        $request = new \AlipayTradeAppPayRequest();
        $arr['body'] = $body;
        $arr['subject'] = $body;
        $arr['out_trade_no'] = $order_sn;
        $arr['total_amount'] = floatval($total_amount);
        $arr['product_code'] = 'QUICK_MSECURITY_PAY';
        $json = json_encode($arr);
        $request->setNotifyUrl($notify_url);
        $request->setBizContent($json);
        $response = $aop->sdkExecute($request);
        return htmlspecialchars($response);
    }

    /**
     * Describe:充值申请
     * DateTime: 2020/5/17 13:40
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function bank_apply()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $data = $this->request->param();
        $update = array('reason' => '付款人：' . $data['name'] . '<br/>转账附言：' . $data['remark']);
        $re = Db::name('LcRecharge')->where(['uid' => $uid, 'status' => 0, 'id' => $data['rid']])->update($update);
        if ($re) $this->success('获取成功！');
        $this->error("操作失败");
    }

    /**
     * @description：检查身份认证
     * @date: 2020/5/8 0008
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function check_auth()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $user = Db::name('LcUser')->find($userInfo['id']);
        $data = array(
            "idcard" => $user['idcard'],
            "is_auth" => $user['auth'] ? 'Y' : 'N',
            "mobile" => $user['phone'],
            "name" => $user['name']
        );
        $this->success("获取成功", $data);
    }

    /**
     * @description：身份认证
     * @date: 2020/5/15 0015
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function auth()
    {
        $this->checkToken();
        $userInfo = $this->userInfo;
        $data = $this->request->param();
        $user = Db::name('LcUser')->find($userInfo['id']);
        if ($user['auth'] == 1) $this->error("你已认证，请勿重复认证！");
        $check = Db::name('LcUser')->where("idcard = '{$data['idcard']}' AND id <> {$userInfo['id']}")->find();
        if ($check) $this->error("身份证号码已存在，请勿重复注册！");
        if (getInfo('cert') == 1) {
            $auth_check = idCardAuth($data['idcard'], $data['name']);
            if ($auth_check['code'] == 0) $this->error($auth_check['msg']);
        } else {
            if (!judge($data['name'], 'name')) $this->error("名字不正确！");
            if (!judge($data['idcard'], 'idcard')) $this->error("身份证号码不正确！");
        }
        //开启事务
        $data = ['name' => $data['name'], 'idcard' => $data['idcard'], 'auth' => 1,];
        Db::startTrans();
        $res = Db::name('LcUser')->where('id', $userInfo['id'])->update($data);
        if ($res) {
            $money = getReward('shimingsong');
            addFinance($userInfo['id'], $money, 1, "实名成功，系统赠送{$money}元");
            setNumber('LcUser', 'money', $money, 1, "id = {$userInfo['id']}");
            setNumber('LcUser', 'income', $money, 1, "id = {$userInfo['id']}");
            Db::commit();
            $this->success("认证成功");
        } else {
            Db::rollback();
            $this->error("修改失败");
        }
    }

    /**
     * @description：签到
     * @date: 2020/5/15 0015
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function sign()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $user = Db::name('LcUser')->field("qiandao,qdnum")->find($uid);
        $today = strtotime(date('Y-m-d'));
        if ($today <= strtotime($user['qiandao'])) $this->error('每天只能签到一次');
        $days = $user['qdnum'] + 1;
        $reward = Db::name("LcSignReward")->where(['days' => $days])->find();
        $reward_type = 1;
        if ($reward) {
            $money = $reward['reward_num'];
            $reward_type = $reward['reward_type'];
            if ($reward['reward_type'] == 1) {
                $this->sign_reward_money($reward['reward_num'], $uid);
            } else {
                $insert['uid'] = $uid;
                $insert['name'] = "签到奖励代金券";
                $insert['description'] = "注：代金券可充当本金使用且可返还";
                $insert['startAt'] = time();
                $insert['endAt'] = time() + 86400 * $reward['coupon_day'];
                $insert['value'] = $reward['reward_num'] * 100;
                $insert['valueDesc'] = $reward['reward_num'];
                $insert['xid'] = $reward['coupon_xid'] ? $reward['coupon_xid'] : 0;
                if ($reward['coupon_xid']) $insert['condition'] = "指定商品券";
                Db::name("LcCoupon")->insert($insert);
            }
        } else {
            $money = getReward('qiandao');
            $this->sign_reward_money($money, $uid);
        }
        Db::name('LcUser')->where(['id' => $uid])->update(['qiandao' => date('Y-m-d H:i:s')]);
        Db::name("LcUserSignLog")->insert(['date' => date("Y-m-d"), 'uid' => $uid]);
        setNumber('LcUser', 'qdnum', 1, 1, "id=$uid");
        $this->success("签到成功", ['days' => $days, 'reward_num' => $money, 'reward_type' => $reward_type]);
    }

    /**
     * Describe:签到处理
     * DateTime: 2020/9/5 18:23
     * @param $money
     * @param $uid
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function sign_reward_money($money, $uid)
    {
        addFinance($uid, $money, 1, "每日签到，获得奖励{$money}元");
        setNumber('LcUser', 'money', $money, 1, "id=$uid");
        setNumber('LcUser', 'reward', $money, 1, "id=$uid");
    }

    /**
     * Describe:本月签到记录
     * DateTime: 2020/9/5 16:17
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sign_log()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $month = getAllMonthDays();
        foreach ($month as $k => $v) {
            $sign_log = Db::name("LcUserSignLog")->where(['date' => $v, 'uid' => $uid])->find();
            $data[$k]['date'] = $v;
            $data[$k]['is_signin'] = $sign_log ? 1 : 0;
        }
        $this->success("获取成功", ['date_list' => $data]);
    }

    /**
     * Describe:签到奖励列表
     * DateTime: 2020/9/5 17:47
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sign_reward()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $today = strtotime(date('Y-m-d'));
        $today_sign = false;
        $user = Db::name("LcUser")->field("qiandao,qdnum")->find($uid);
        $sign_num = $user['qdnum'];
        if ($today <= strtotime($user['qiandao'])) $today_sign = true;
        if (!$today_sign) $sign_num = $sign_num + 1;
        $today_reward = Db::name("LcSignReward")->where(['days' => $sign_num])->find();
        if (!$today_reward) {
            $today_reward['reward_type'] = 1;
            $today_reward['reward_num'] = getReward('qiandao');
        }
        $reward = Db::name('LcSignReward')->select();
        foreach ($reward as &$v) {
            $v['can_draw'] = $user['qdnum'] >= $v['days'] ? 2 : 0;
        }
        $this->success("获取成功", ['reward_list' => $reward, 'signin_days' => $user['qdnum'], 'isSign' => $today_sign, 'today_reward' => $today_reward]);
    }

    /**
     * @description：消息列表
     * @date: 2020/5/15 0015
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function notice()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $msgtop = Db::name('LcMsg')->alias('msg')->where('(msg.uid = ' . $uid . ' or msg.uid = 0 ) and (select count(*) from lc_msg_is as msg_is where msg.id = msg_is.mid  and ((msg.uid = 0 and msg_is.uid = ' . $uid . ') or ( msg.uid = ' . $uid . ' and msg_is.uid = ' . $uid . ') )) = 0')->select();
        $msgfoot = Db::name('LcMsg')->alias('msg')->where('(select count(*) from lc_msg_is as msg_is where msg.id = msg_is.mid and msg_is.uid = ' . $uid . ') > 0')->select();
        $list = [];
        if ($msgtop) {
            foreach ($msgtop as $v) {
                $push['id'] = $v['id'];
                $push['time'] = $v['add_time'];
                $push['title'] = $v['title'];
                $push['content'] = strip_tags($v['content']);
                $push['is_read'] = false;
                array_push($list, $push);
            }
        }
        if ($msgfoot) {
            foreach ($msgfoot as $v) {
                $push['id'] = $v['id'];
                $push['time'] = $v['add_time'];
                $push['title'] = $v['title'];
                $push['content'] = strip_tags($v['content']);
                $push['is_read'] = true;
                array_push($list, $push);
            }
        }
        $this->success("获取成功", ['list' => $list, 'ok_read_num' => count($msgtop)]);
    }

    /**
     * @description：读取信息
     * @date: 2020/5/15 0015
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function notice_view()
    {
        $this->checkToken();
        $id = $this->request->param('id');
        $uid = $this->userInfo['id'];
        $where['uid'] = $uid;
        $where['mid'] = $id;
        $ret = Db::name('LcMsgIs')->where($where)->find();
        if (!$ret) Db::name('LcMsgIs')->insertGetId(['uid' => $uid, 'mid' => $id]);
        $notice = Db::name('LcMsg')->find($id);
        $data = array('view' => $notice,);
        $this->success("获取成功", $data);
    }

    /**
     * @description：资金流水
     * @date: 2020/5/15 0015
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function funds()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $reason_id = $this->request->param('reason_id');
        $reason = array(
            "1" => "充值",
            "2" => "提现",
            "3" => "系统赠送",
            "4" => "签到",
            "5" => "分享奖励",
            "6" => "购买商品",
            "7" => "红包",
            "8" => "奖励",
            "9" => "新人福利",
            "10" => "推荐",
            "11" => "收益",
        );
        $user = Db::name("LcUser")->find($uid);
        $where[] = ['uid', 'eq', $uid];
        if ($reason_id) $where[] = ['reason', 'LIKE', "%{$reason[$reason_id]}%"];
        $data = Db::name('LcFinance')->where($where)->order("id desc")->select();
        $money = array_column($data, "money");
        $this->success("获取成功", ['list' => $data, 'reason' => $reason, 'money' => $user['money'], 'username' => $user['name'] ?: $user['phone'], 'share_reward' => array_sum($money)]);
    }

    /**
     * Describe:优惠券
     * DateTime: 2020/9/5 0:42
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function coupon()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $param = $this->request->param();
        $items = json_decode($param['items'], true);
        $ids = array_column($items, 'item_id');
        $time = time();
        $data = Db::name('LcCoupon')->where(['uid' => $uid, 'status' => 1])->where("endAt > $time")->order("id desc")->select();
        $money = Db::name('LcUser')->where(['id' => $uid])->value('money');
        $coupons = array();
        $disabledCoupons = array();
        if ($data) {
            foreach ($data as $v) {
                if ($v['xid'] == 0 || in_array($v['xid'], $ids)) {
                    if ($v['startAt'] > $time) {
                        $disabledCoupons[] = $v;
                    } else {
                        $coupons[] = $v;
                    }
                } else {
                    $disabledCoupons[] = $v;
                }
            }
        }
        $this->success("获取成功", ['coupons' => $coupons, 'disabledCoupons' => $disabledCoupons, 'user_money' => $money]);
    }

    public function coupon_list()
    {
        $this->checkToken();
        $uid = $this->userInfo['id'];
        $time = time();
        $coupons = Db::name('LcCoupon')->where(['uid' => $uid, 'status' => 1])->where("endAt > $time")->order("id desc")->select();
        $disabledCoupons = Db::name('LcCoupon')->where(['uid' => $uid, 'status' => 2])->order("id desc")->select();
        $expireCoupons = Db::name('LcCoupon')->where(['uid' => $uid, 'status' => 2])->where("endAt < $time")->order("id desc")->select();
        $this->success("获取成功", ['coupons' => $coupons, 'disabledCoupons' => $disabledCoupons, 'expireCoupons' => $expireCoupons]);
    }
}
