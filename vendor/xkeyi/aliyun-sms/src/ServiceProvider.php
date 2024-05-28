<?php

namespace Xkeyi\AliyunSms;

class ServiceProvider extends \Illuminate\Support\ServiceProvider
{
    // 标记着提供器是延时加载的
    protected $defer = true;

    // 粗册服务提供者
    public function register()
    {
        $this->app->singleton(SendSms::class, function () {
            $config = [
                'access_key_id' => config('services.aliyun_sms.access_key_id'),
                'access_key_secret' => config('services.aliyun_sms.access_key_secret'),
                'sign_name' => config('services.aliyun_sms.sign_name'),

            ];

            return new SendSms($config);
        });

        $this->app->alias(SendSms::class, 'aliyun-sms');
    }

    // 取得提供者提供的服务
    public function provides()
    {
        return [SendSms::class, 'aliyun-sms'];
    }
}
