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
 * 用户分享管理
 * Class Item
 * @package app\admin\controller
 */
class ShareList extends Controller
{
    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'LcShareList';

    /**
     * 用户分享列表
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
        $this->title = '用户分享列表';
        $query = $this->_query($this->table)->alias('i')->field('i.*,u.phone,u.name,s.title');
        $query->join('lc_user u', 'i.uid=u.id')->join('lc_share s', 'i.sid = s.id')->equal('i.status#i_status')->like('s.title,u.phone#u_phone')->dateBetween('i.time#i_time')->order('i.id desc')->page();
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
     * 同意
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function agree()
    {
        $this->applyCsrfToken();
        $id = $this->request->param('id');
        $share = Db::name($this->table)->find($id);
        if($share&&$share['status'] == 0){
            $reward = Db::name('LcShare')->where(['id'=>$share['sid']])->value('money');
            setNumber('LcUser', 'money', $reward, 1, "id = {$share['uid']}");
            setNumber('LcUser', 'reward', $reward, 1, "id = {$share['uid']}");
            addFinance($share['uid'], $reward, 1, "分享奖励审核通过");
        }
        $this->_save($this->table, ['status' => '1']);
    }

    /**
     * 拒绝
     * @auth true
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function refuse()
    {
        $this->applyCsrfToken();
        $this->_save($this->table, ['status' => '2']);
    }

    /**
     * 删除文章
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
