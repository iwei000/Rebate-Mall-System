<?php
require_once __DIR__ . '/../autoload.php';

use Qiniu\Auth;
use Qiniu\Config;
use Qiniu\Storage\BucketManager;

$accessKey = getenv('QINIU_ACCESS_KEY');
$secretKey = getenv('QINIU_SECRET_KEY');

$auth = new Auth($accessKey, $secretKey);
$config = new Config();
$bucketManager = new BucketManager($auth, $config);

list($Info, $err) = $bucketManager->bucketLifecycleRule(
    $bucket = 'xxxx',
    $name = 'demo',
    $prefix = 'test',
    $delete_after_days = 80,
    $to_line_after_days = 70
);

if ($err) {
    print_r($err);
} else {
    print_r($Info);
}