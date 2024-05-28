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
use think\Db;

/**
 * 优惠券管理
 * Class Item
 * @package app\admin\controller
 */
class Coupon extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'LcCoupon';

    /**
     * 优惠券管理
     * @auth true
     * @menu true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        $this->title = '优惠券列表';
        $query = $this->_query($this->table)->alias('c')->field('c.*,u.phone');
        $query->join('lc_user u', 'c.uid=u.id')->equal('c.status#c_status')->like('u.phone#u_phone')->dateBetween('c.startAt#c_startAt')->order('c.id desc')->page();
    }

    /**
     * 批量赠送优惠券
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function batch()
    {
        if($this->request->isPost()){
            $param = $this->request->param();
            $ids = Db::name("LcUser")->where(['member'=>$param['member']])->column('id');
            if($ids){
                $startAt = strtotime($param['startAt']);
                $endAt = strtotime($param['endAt']);
                foreach($ids as $k=>$v){
                    $insert[$k]['uid'] = $v;
                    $insert[$k]['name'] = $param['name'];
                    $insert[$k]['description'] = $param['description'];
                    $insert[$k]['startAt'] = $startAt;
                    $insert[$k]['endAt'] = $endAt;
                    $insert[$k]['value'] = $param['valueDesc']*100;
                    $insert[$k]['valueDesc'] = $param['valueDesc'];
                    $insert[$k]['xid'] = $param['xid']?$param['xid']:0;
                    if($param['xid']) $insert[$k]['condition'] = "指定商品券";
                }
                if(Db::name("LcCoupon")->insertAll($insert)) $this->success("添加成功");
            }
            $this->error("添加失败");
        }
        $this->member = Db::name("LcUserMember")->order('value desc')->select();
        return $this->fetch();
    }

    /**
     * 赠送优惠券
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        $this->title = '添加优惠券';
        $this->_form($this->table, 'form');
    }

    /**
     * 编辑优惠券
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        $this->title = '编辑优惠券';
        $this->_form($this->table, 'form');
    }

    /**
     * 删除优惠券
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->applyCsrfToken();
        $this->_delete($this->table);
    }

    /**
     * 表单数据处理
     * @param array $vo
     * @throws \ReflectionException
     */
    protected function _form_filter(&$vo){
        if ($this->request->isGet()) {
            if (isset($vo['startAt'])) $vo['startAt'] = date("Y-m-d H:i:s",$vo['startAt']);
            if (isset($vo['endAt'])) $vo['endAt'] = date("Y-m-d H:i:s",$vo['endAt']);
            if (isset($vo['uid'])) $vo['phone'] = getUserPhone($vo['uid']);
        }
        if ($this->request->isPost()) {
            $vo['startAt'] = strtotime($vo['startAt']);
            $vo['endAt'] = strtotime($vo['endAt']);
            $user = Db::name('LcUser')->where(['phone'=>$vo['phone']])->find();
            if(!$user) $this->error('暂无该用户');
            $vo['uid'] = $user['id'];
            $vo['value'] = $vo['valueDesc']*100;
            if($vo['xid']) $vo['condition'] = "指定商品券";
        }
    }

}
