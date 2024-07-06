<?php

/**
 * ThinkPHP initialization script
 *
 * ThinkPHP is a PHP framework that simplifies web application development.
 * This script initializes the framework by setting up class loading, error handling,
 * and essential configurations.
 *
 * @package ThinkPHP
 * @author liu21st <liu21st@gmail.com>
 * @license http://www.apache.org/licenses/LICENSE-2.0 Apache 2.0 License
 */

namespace think;

// Load the Loader class
require __DIR__ . '/library/think/Loader.php';

// Register class autoloading
Loader::register();

// Register error and exception handling
Error::register();

// Define the LoggerInterface if it's not already defined
if (!interface_exists('Psr\Log\LoggerInterface')) {
    interface LoggerInterface extends \Psr\Log\LoggerInterface
    {
        // Interface body can be extended with custom methods if needed
    }
}

// Register class aliases for shorter code and better readability
Loader::addClassAlias([
    'App'      => facade\App::class,
    'Build'    => facade\Build::class,
    'Cache'    => facade\Cache::class,
    'Config'   => facade\Config::class,
    'Cookie'   => facade\Cookie::class,
    'Db'       => Db::class,
    'Debug'    => facade\Debug::class,
    'Env'      => facade\Env::class,
    'Facade'   => Facade::class,
    'Hook'     => facade\Hook::class,
    'Lang'     => facade\Lang::class,
    'Log'      => facade\Log::class,
    'Request'  => facade\Request::class,
    'Response' => facade\Response::class,
    'Route'    => facade\Route::class,
    'Session'  => facade\Session::class,
    'Url'      => facade\Url::class,
    'Validate' => facade\Validate::class,
    'View'     => facade\View::class,
]);