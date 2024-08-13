<?php

require_once __DIR__ . '/../autoload.php';

use \Qiniu\Cdn\CdnManager;

// 从环境变量获取 Access Key 和 Secret Key
$accessKey = getenv('QINIU_ACCESS_KEY');
$secretKey = getenv('QINIU_SECRET_KEY');

// 初始化认证和 CDN 管理器
$auth = new Qiniu\Auth($accessKey, $secretKey);
$cdnManager = new CdnManager($auth);

// 要查询的域名列表
$domains = [
    "javasdk.qiniudn.com",
    "phpsdk.qiniudn.com"
];

// 查询的起止日期
$startDate = "2017-08-20";
$endDate = "2017-08-21";

// 数据粒度
$granularity = "day";

// 获取带宽数据
list($bandwidthData, $getBandwidthErr) = $cdnManager->getBandwidthData(
    $domains,
    $startDate,
    $endDate,
    $granularity
);

// 输出结果或错误信息
if ($getBandwidthErr !== null) {
    var_dump($getBandwidthErr);
} else {
    echo "Get bandwidth data success\n";
    print_r($bandwidthData);
}