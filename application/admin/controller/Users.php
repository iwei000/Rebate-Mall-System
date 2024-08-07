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
 * 会员管理
 * Class Item
 * @package app\admin\controller
 */
class Users extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'LcUser';

    /**
     * 会员列表
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
      $this->title = '会员列表';

      // 优化字段选择，只选择需要的字段
      $query = $this->_query($this->table)
          ->alias('u')
          ->field('u.id, u.auth, u.clock, u.member, u.ip, u.phone, u.name, u.time, m.name as m_name')
          ->join('lc_user_member m', 'u.member = m.id');
      
      // 确保查询条件中涉及的字段已创建索引
      $query->equal('u.auth#u_auth, u.clock#u_clock, u.member#u_member');
      
      // 优化 LIKE 查询
      $query->like('u.ip#i_orderid, u.phone#u_phone, u.name#u_name, u.ip#u_ip');
      
      // 优化时间范围查询
      $query->dateBetween('u.time#u_time');
      
      // 排序和分页
      $query->order('u.id desc')->page();
    }

    /**
     * 数据列表处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function _index_page_filter(&$data)
    {
        $this->member = Db::name("lc_user_member")->field('id,name')->select();
        $ip = new \Ip2Region();
        foreach($data as &$vo){
            $vo['online'] = $vo['logintime']>(time()-300)?1:0;
            $vo['top']  = Db::name("lc_user")->where("id = {$vo['top']}")->value('phone');
            $vo['cash_sum']  = Db::name("lc_cash")->where("uid = {$vo['id']} AND status = '1'")->sum('money');
            $vo['recharge_sum']  = Db::name("lc_recharge")->where("uid = {$vo['id']} AND status = '1'")->sum('money');
            $vo['invest_sum']  = Db::name('lc_invest')->where("uid = {$vo['id']}")->sum('money');
            $vo['wait_invest']  = Db::name('lc_invest_list')->where("uid = {$vo['id']} AND pay1 > 0 AND status = 0")->sum('money1');
            $vo['wait_money']  = Db::name('lc_invest_list')->where("uid = {$vo['id']} AND money2 > 0 AND status = 0")->sum('money2');
            $result = $ip->btreeSearch($vo['ip']);
            $vo['isp'] = isset($result['region']) ? $result['region'] : '';
            $vo['isp'] = str_replace(['内网IP', '0', '|'], '', $vo['isp']);
        }
    }

    /**
     * 表单数据处理
     * @param array $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _form_filter(&$vo)
    {
        if ($this->request->isPost()) {
            if($vo['mwpassword']) $vo['password'] = md5($vo['mwpassword']);
            if($vo['mwpassword2']) $vo['password2'] = md5($vo['mwpassword2']);
            if(isset($vo['id'])){
                $money = Db::name($this->table)->where("id = {$vo['id']}")->value('money');
                if($money&&$money != $vo['money']){
                    $handle_money = $money-$vo['money'];
                    $type = $handle_money>0?2:1;
                    model('admin/Users')->addFinance($vo['id'],abs($handle_money),$type,'系统操作');
                }
            }else{
                $vo['time'] = date('Y-m-d H:i:s');
            }
        } else {
            if(!isset($vo['auth'])) $vo['auth'] = '0';
            $this->member = Db::name("LcUserMember")->order('id desc')->select();

        }
    }

    /**
     * 添加用户
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        $this->applyCsrfToken();
        $this->_form($this->table, 'form');
    }

    /**
     * 编辑用户
     * @auth true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        $this->applyCsrfToken();
        $this->_form($this->table, 'form');
    }

    /**
     * 禁用用户
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        $this->applyCsrfToken();
        $this->_save($this->table, ['clock' => '0']);
    }

    /**
     * 启用用户
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        $this->applyCsrfToken();
        $this->_save($this->table, ['clock' => '1']);
    }

    /**
     * 删除用户
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->applyCsrfToken();
        $this->_delete($this->table);
    }
    
    public function user_relation(){
        $this->title = '会员关系网';
        if($this->request->isGet()&&$this->request->param('phone')){
            $list = [];
            $phone = $this->request->param('phone');
            $type = $this->request->param('type');
            if($type == 1){
                $top = Db::name('LcUser')->where(['phone'=>$phone])->value('top');
                if($top){
                    $list = Db::name('LcUser')->where(['id'=>$top])->select();
                }
            }else{
                $uid = Db::name('LcUser')->where(['phone'=>$phone])->value('id');
                if($uid){
                    $list = Db::name('LcUser')->where(['top'=>$uid])->select();
                }
            }
            if($list){
                foreach ($list as &$v){
                    $vo['top_phone'] = '';
                    if($v['top']){
                      $vo['top_phone'] = Db::name('LcUser')->where(['id'=>$v['top']])->value('phone');  
                    }
                }
            }
            $this->assign('list', $list);
            $this->assign('type', $type);
        }
        $this->fetch();
    }
}
