<?php

namespace app\admin\model;

use think\Model;
use think\Db;

class Item extends Model
{
    protected $item_table = 'LcItem';
    protected $invest_table = 'LcInvest';

    /**
     * @description：获取项目进度
     * @date: 2020/5/12 0012
     * @param $id
     * @return float|int|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProjectPercent($id){
        $item = Db::name($this->item_table)->find($id);
        if($item['auto']>0){
            $xc=$this->diffBetweenTwoDays($item['time'],date('Y-m-d H:i:s'));
            if($xc>$item['auto']){
                $total=100;
            }else{
                $total= round($xc/$item['auto']*100);
            }
        }else{
            $pid = $item['id'];
            $percent = $item['percent'];
            $investMoney = Db::name($this->invest_table)->where('pid', $pid)->sum('money');
            $actual = $investMoney / ($item['total'] * 10000) * 100;
            $total = $actual + $percent;
        }
        if (100 < $total) return 100;
        return $total;
    }

    public function diffBetweenTwoDays ($day1, $day2)
    {
        $second1 = strtotime($day1);
        $second2 = strtotime($day2);
        if ($second1 < $second2) {
            $tmp = $second2;
            $second2 = $second1;
            $second1 = $tmp;
        }
        return ($second1 - $second2) / 86400;
    }
}
