<h1 align="center"> Aliyun-SMS</h1>

基于 [阿里云短信服务](https://help.aliyun.com/document_detail/55451.html?spm=a2c4g.11186623.6.573.58e83a76BkPkop) 的 PHP 组件

### 安装

```sh
$ composer require xkeyi/aliyun-sms
```

### 配置

在使用本扩展之前，你需要去 注册账号，然后开通短信服务，创建 AccessKey，并设置好自己的短信签名和短信模版。

### 使用

```php
use Xkeyi\AliyunSms\SendSms;

$config = [
    'access_key_id' => 'xxxxx',
    'access_key_secret' => 'xxxxx',
    'sign_name' => 'xxxxx', // 短信签名

];

$sms = new SendSms($config);

$result = $sms->send('18000000000', 'SMS_152549473', ['code' => '321475', 'name' => 'xxxx']);
```

### 参数说明

```
 array | string send(string $phone, string $template_code, array $message)
```

> - `$phone` - 接收短信的手机号码
> - `$template_code` - 短信模版
> - `$message` - 包含所有在短信模版中设置的变量的数组，如：['code' => '123456, 'name' => 'xxx']

### 在 Laravel 中使用

在 Laravel 中使用也是同样的安装方式，配置写在 `config/services.php` 中：

```php
    .
    .
    .
    'aliyun_sms' => [
        'access_key_id' => env('ALIYUN_SMS_ACCESS_KEY_ID'),
        'access_key_secret' => env('ALIYUN_SMS_ACCESS_KEY_SECRET'),
        'sign_name' => env('ALIYUN_SMS_SIGN_NAME'),
    ],
```

然后在 `.env` 中配置上面的三个值：

```
ALIYUN_SMS_ACCESS_KEY_ID=xxxxx
ALIYUN_SMS_ACCESS_KEY_SECRET=xxxxx
ALIYUN_SMS_SIGN_NAME=xxxx
```

可以用两种方法获取 `Xkeyi\AliyunSms\SendSms` 实例：

#### 方法参数注入

```php
public function send(SendSms $sms)
{
    $res = $sms->send('18000000000', 'SMS_152549473', ['code' => '321475', 'name' => 'xxxx']);
}
```

#### 服务器访问

```php
public function send()
{
    $res = app('aliyun-sms')->send('18000000000', 'SMS_152549473', ['code' => '321475', 'name' => 'xxxx']);
}
```

### 参考

- [阿里云短信服务](https://help.aliyun.com/document_detail/55451.html?spm=a2c4g.11186623.6.573.58e83a76BkPkop)
- [PHP 扩展包实战教程 - 从入门到发布](https://laravel-china.org/courses/creating-package)；
- [Easy SMS](https://github.com/overtrue/easy-sms)

### License

MIT
