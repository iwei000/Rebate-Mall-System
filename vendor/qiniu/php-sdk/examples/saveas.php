<?php
require_once __DIR__ . '/../autoload.php';

use Qiniu\Auth;
use Qiniu\Processing\PersistentFop;

// 获取AK, SK
$accessKey = 'Access_Key';
$secretKey = 'Secret_Key';

// 生成EncodedEntryURI的值
$entry = '<bucket>:<Key>'; // <Key>为生成缩略图的文件名
$encodedEntryURI = \Qiniu\base64_urlSafeEncode($entry);

// 构建新的下载URL
$newurl = "78re52.com1.z0.glb.clouddn.com/resource/Ship.jpg?imageView2/2/w/200/h/200|saveas/" . $encodedEntryURI;

// 使用SecretKey对新的下载URL进行HMAC1-SHA1签名并进行Base64编码
$sign = hash_hmac("sha1", $newurl, $secretKey, true);
$encodedSign = \Qiniu\base64_urlSafeEncode($sign);

// 最终得到的完整下载URL
$finalURL = "http://" . $newurl . "/sign/" . $accessKey . ":" . $encodedSign;

// 获取并输出回调内容
$callbackBody = file_get_contents($finalURL);
echo $callbackBody;