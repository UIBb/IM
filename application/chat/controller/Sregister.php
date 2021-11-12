<?php
namespace app\chat\controller;
use \Workerman\Worker;
use \GatewayWorker\Register;
class Sregister
{
    public function __construct()
    {
		$path=APP_PATH."config.txt";
		$sysconfig = json_decode(file_get_contents($path),true);
        // register 服务必须是text协议
        $register = new Register('text://'.$sysconfig['register']);
        
		print_r($sysconfig['register']);
        // 如果不是在根目录启动，则运行runAll方法
        if(!defined('GLOBAL_START'))
        {
            Worker::runAll();
        }
	}
}
