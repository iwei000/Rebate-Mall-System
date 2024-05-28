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

use think\facade\Config;
use think\facade\Request;

return [
    // 去除HTML空格换行
    'strip_space'        => true,
    // 开启模板编译缓存
    'tpl_cache'          => !Config::get('app_debug'),
    // 定义模板替换字符串
    'tpl_replace_string' => [
        '__APP__'  => rtrim(url('@'), '\\/'),
        '__ROOT__' => rtrim(dirname(Request::basefile()), '\\/'),
        '__FULL__' => rtrim(dirname(Request::basefile(true)), '\\/'),
    ],
];
