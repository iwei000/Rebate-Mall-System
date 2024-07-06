<?php

/**
 * Application configuration settings for ThinkPHP.
 *
 * This configuration array organizes settings by their functionality such as application behavior,
 * routing, templating, logging, and more. Descriptive comments are provided to enhance understanding
 * and ease of use.
 */

return [
    // Application settings
    'app' => [
        'app_name'            => '',
        'app_host'            => '',
        'app_debug'           => false,
        'app_trace'           => false,
        'app_status'          => '',
        'is_https'            => false,
        'auto_bind_module'    => false,
        'root_namespace'      => [],
        'default_return_type' => 'html',
        'default_ajax_return' => 'json',
        'default_jsonp_handler' => 'jsonpReturn',
        'var_jsonp_handler'   => 'callback',
        'default_timezone'    => 'Asia/Shanghai',
        'lang_switch_on'      => false,
        'default_validate'    => '',
        'default_lang'        => 'zh-cn',
        'controller_auto_search' => false,
        'use_action_prefix'   => false,
        'action_suffix'       => '',
        'empty_controller'    => 'Error',
        'empty_module'        => '',
        'default_module'      => 'index',
        'app_multi_module'    => true,
        'deny_module_list'    => ['common'],
        'default_controller' => 'Index',
        'default_action'     => 'index',
        'url_convert'         => true,
        'url_controller_layer' => 'controller',
        'class_suffix'        => false,
        'controller_suffix'   => false,
    ],

    // URL and routing settings
    'route' => [
        'pathinfo_depr'       => '/',
        'url_common_param'    => false,
        'url_param_type'      => 0,
        'url_lazy_route'      => false,
        'url_route_must'      => false,
        'route_rule_merge'    => false,
        'route_complete_match' => false,
        'route_annotation'    => false,
        'default_route_pattern' => '\w+',
        'route_check_cache'   => false,
        'route_check_cache_key' => '',
        'route_cache_option'  => [],
    ],

    // Template settings
    'template' => [
        'auto_rule'           => 1,
        'type'                => 'Think',
        'view_base'           => '',
        'view_path'           => '',
        'view_suffix'         => 'html',
        'view_depr'           => DIRECTORY_SEPARATOR,
        'tpl_begin'           => '{',
        'tpl_end'             => '}',
        'taglib_begin'        => '{',
        'taglib_end'          => '}',
    ],

    // Log settings
    'log' => [
        'type'                => 'File',
        //'path'                => LOG_PATH,
        'level'               => [],
        'record_trace'        => false,
        'json'                => false,
    ],

    // Trace settings (effective when app_trace is enabled)
    'trace' => [
        'type'                => 'Html',
        'file'                => __DIR__ . '/tpl/page_trace.tpl',
    ],

    // Cache settings
    'cache' => [
        'type'                => 'File',
        //'path'                => CACHE_PATH,
        'prefix'              => '',
        'expire'              => 0,
    ],

    // Session settings
    'session' => [
        'id'                  => '',
        'var_session_id'      => '',
        'prefix'              => 'think',
        'type'                => '',
        'auto_start'          => true,
        'httponly'            => true,
        'secure'              => false,
    ],

    // Cookie settings
    'cookie' => [
        'prefix'              => '',
        'expire'              => 0,
        'path'                => '/',
        'domain'              => '',
        'secure'              => false,
        'httponly'            => '',
        'setcookie'           => true,
    ],

    // Database settings
    'database' => [
        'type'                => 'mysql',
        'dsn'                 => '',
        'hostname'            => '127.0.0.1',
        'database'            => '',
        'username'            => 'root',
        'password'            => '',
        'hostport'            => '',
        'params'              => [],
        'charset'             => 'utf8',
        'prefix'              => '',
        'debug'               => false,
        'deploy'              => 0,
        'rw_separate'         => false,
        'master_num'          => 1,
        'slave_no'            => '',
        'fields_strict'       => true,
        'resultset_type'      => 'array',
        'auto_timestamp'      => false,
        'datetime_format'     => 'Y-m-d H:i:s',
        'sql_explain'         => false,
        'query'               => '\\think\\db\\Query',
    ],

    // Pagination configuration
    'paginate' => [
        'type'                => 'bootstrap',
        'var_page'            => 'page',
        'list_rows'           => 15,
    ],

    // Console configuration
    'console' => [
        'name'                => 'Think Console',
        'version'             => '0.1',
        'user'                => null,
        'auto_path'           => '',
    ],

    // Middleware configuration
    'middleware' => [
        'default_namespace'   => 'app\\http\\middleware\\',
    ],
];