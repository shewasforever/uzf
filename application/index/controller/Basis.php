<?php
namespace app\index\controller;

use app\common\controller\Api;
class Basis extends Api {
	public $user;
	public function initialize() {
		parent::initialize();
		$header = $this->request->header();
		$authToken = null;

		if (key_exists('authtoken', $header)) {
			$authToken = $header['authtoken'];
		}
		if ($authToken) {
			if($authToken == 'null'){
				$this->e_msg("请登录", 203);
			}
			$authToken = explode(':', $authToken);
			$this->user = model('User')
			->where("us_tel", $authToken[0])
			->find();
		} else {
			$this->e_msg("请登录", 401);
		}

		if (empty($this->user)) {
			$this->e_msg("用户不存在", 400);
		}
		if($this->user['us_status'] == 0){
			$this->e_msg("此账号被冻结",203);
		}
		if (!cache('setting')['status']) {
			$this->e_msg("网站维护", 203);
		}
		$pass = $this->user['us_pwd'];
		if (!array_key_exists('2', $authToken)) {
		    $this->e_msg("token缺失", 402);
		}
//        dump(date('Y/m/d'));
//        dump(md5($_SERVER['REQUEST_URI'].':'.$authToken[1]));
        if ($pass != md5($authToken[1])) {
            $this->e_msg("密码错误", 403);
        }
        if ($authToken[2] !=md5($_SERVER['REQUEST_URI'].':'.$authToken[1]) ){
            $this->e_msg("token错误", 405);
        }


	}
}
