<?php
require_once __DIR__ . '/../autoload.php';

use \Qiniu\Auth;
use \Qiniu\Config;
use \Qiniu\Storage\BucketManager;

$accessKey = getenv('QINIU_ACCESS_KEY');
$secretKey = getenv('QINIU_SECRET_KEY');
$bucket = getenv('QINIU_TEST_BUCKET');
$key = "qiniu.mp4";

try {
    $auth = new Auth($accessKey, $secretKey);
    $config = new Config();
    $bucketManager = new BucketManager($auth, $config);

    list($fileInfo, $err) = $bucketManager->stat($bucket, $key);
    if ($err) {
        throw new Exception($err->message());
    } else {
        print_r($fileInfo);
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}