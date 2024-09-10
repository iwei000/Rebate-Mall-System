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

/* 定义会话路径 */
$_path_ = env('runtime_path') . 'sess' . DIRECTORY_SEPARATOR;
if (!file_exists($_path_)) {
    if (!mkdir($_path_, 0755, true)) {
        throw new RuntimeException("Failed to create session directory at {$_path_}");
    }
}

/* 生成安全的会话名称 */
$_name_ = 's' . substr(md5(__DIR__), -8); // 或者使用更强的哈希函数
// $_name_ = 's' . substr(hash('sha256', __DIR__), -8);

/* 配置会话参数 */
return [
    'prefix' => 'fw',
    'path'   => $_path_,
    'name'   => $_name_,
];
