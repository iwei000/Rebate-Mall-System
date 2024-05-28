<?php

namespace Xkeyi\AliyunSms;

use GuzzleHttp\Client;
use Xkeyi\AliyunSms\Exceptions\GatewayErrorException;
use Xkeyi\AliyunSms\Exceptions\HttpException;

class SendSms
{
    const URL = 'http://dysmsapi.aliyuncs.com';

    const ACTION = 'SendSms';

    const FORMAT = 'JSON';

    const VERSION = '2017-05-25';

    const REGION_ID = 'cn-hangzhou';

    const SIGNATURE_METHOD = 'HMAC-SHA1';

    const SIGNATURE_VERSION = '1.0';

    protected $access_key_id;
    protected $access_key_secret;
    protected $sign_name;

    public function __construct($config)
    {
        $this->access_key_id = $config['access_key_id'];
        $this->access_key_secret = $config['access_key_secret'];
        $this->sign_name = $config['sign_name'];
    }

    protected function getHttpClient(array $options = [])
    {
        return new Client($options);
    }

    public function send($send_to, $template_code, $message)
    {
        $params = [
            'RegionId' => self::REGION_ID,
            'AccessKeyId' => $this->access_key_id,
            'Format' => self::FORMAT,
            'SignatureMethod' => self::SIGNATURE_METHOD,
            'SignatureVersion' => self::SIGNATURE_VERSION,
            'SignatureNonce' => uniqid(mt_rand(0, 0xffff), true),
            'Timestamp' => gmdate("Y-m-d\TH:i:s\Z"),
            'Action' => self::ACTION,
            'Version' => self::VERSION,
            'PhoneNumbers' => $send_to,
            'SignName' => $this->sign_name,
            'TemplateCode' => $template_code,
            'TemplateParam' => json_encode($message, JSON_UNESCAPED_UNICODE),
        ];

        $params['Signature'] = $this->generateSign($params);

        try {
            $contents = $this->getHttpClient()
                    ->get(self::URL, [
                        'query' => $params,
                    ])
                    ->getBody()
                    ->getContents();

            $result = json_decode($contents, true);
            if ($result['Code'] != 'OK') {
                return ['Code'=>'ERROR','Message'=>$result['Message']];
            }
            return $result;
        } catch (\Exception $e) {
            throw new HttpException($e->getMessage(), $e->getCode(), $e);
        }
    }

    protected function generateSign($params)
    {
        ksort($params);
        ksort($params);
        $accessKeySecret = $this->access_key_secret;
        $stringToSign = 'GET&%2F&'.urlencode(http_build_query($params, null, '&', PHP_QUERY_RFC3986));

        return base64_encode(hash_hmac('sha1', $stringToSign, $accessKeySecret.'&', true));
    }
}
