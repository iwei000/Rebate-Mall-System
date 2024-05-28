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
 * 提现管理
 * Class Item
 * @package app\admin\controller
 */
class Cash extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'LcCash';

    /**
     * 提现记录
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
        $this->title = '提现记录';
        $query = $this->_query($this->table)->alias('i')->field('i.*,u.phone');
        $query->join('lc_user u','i.uid=u.id')->equal('i.status#i_status')->like('u.phone#u_phone')->dateBetween('i.time#i_time')->order('i.id desc')->page();
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

    }

    /**
     * 同意提现
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function agree()
    {
        $this->applyCsrfToken();
        $id = $this->request->param('id');
        $cash = Db::name($this->table)->find($id);
        sendSms(getUserPhone($cash['uid']), '18007', $cash['money']);
        $this->_save($this->table, ['status' => '1','time2' => date('Y-m-d H:i:s')]);
    }

    /**
     * 拒绝提现
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function refuse()
    {
        $this->applyCsrfToken();
        $id = $this->request->param('id');
        $cash = Db::name($this->table)->find($id);
        addFinance($cash['uid'], $cash['money'],1, '提现失败，返还金额' . $cash['money'] . '元');
        setNumber('LcUser', 'money', $cash['money'], 1, "id = {$cash['uid']}");
        sendSms(getUserPhone($cash['uid']), '18008', $cash['money']);
        $this->_save($this->table, ['status' => '2', 'time2' => date('Y-m-d H:i:s')]);
    }
    
    /**
     * 删除记录
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remove()
    {
        $this->applyCsrfToken();
        $this->_delete($this->table);
    }
}
