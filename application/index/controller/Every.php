<?php
namespace app\index\controller;

use think\facade\Config;
use app\common\logic\UserLogic;
use app\index\controller\Wecpay;
use think\Container;

/**
 * 图片验证码
 */
class Every extends Common {
	protected $wechant_numb;
	public function initialize() {
		parent::initialize();
		$this->wechant_numb = Config::get('wechat_numb');
	}
	public function test()
	{
		$this->s_msg('成功','哈哈');
	}
	/**
	 * 上传图片
	 * @return [type] [description]
	 */
	public function sctp() {
		try {
			$rel = base64_upload(input('post.img'));
		} catch (\Exception $e) {
			$this->e_msg($e->getMessage());
		}
		if ($rel) {
			$this->s_msg('上传成功', $rel);
		} else {
			$this->e_msg();
		}
	}
	protected function object_to_array($obj) {
		$obj = (array) $obj;
		foreach ($obj as $k => $v) {
			if (gettype($v) == 'resource') {
				return;
			}
		}

		return $obj;
	}	
	//扫描二维码，通过id获取推荐人手机号
	//2018年6月26日 15:57:26
	//fkl
	public function getTelById(){
		$id = input('post.us_id');
		// $id = decrypt($id);
		$ptel = model('User')->where('id',$id)->value('us_tel');
		if (!$ptel) {
			$this->e_msg('查不到推荐人');
		}
		$this->s_msg(null,$ptel);
	}
	//注册
	public function register() {
		
		$data = input('post.');
		//halt($data);
		$code_info = cache($data['us_tel'] . 'code') ?: "";
		if (!$code_info) {
			$this->e_msg('请重新发送验证码');
		} elseif (trim(input('post.code')) != $code_info) {
			$this->e_msg('验证码不正确');
		}
		unset($data['code']);
		$userlogic = new UserLogic;
				
		//添加用户		
		$rel = $userlogic->addUser($data);
		if(!$rel['code']){
			$this->e_msg($rel['msg']);
		}
		$this->s_msg(null,$rel['msg']);
	}
	//注册绑定信息支付宝微信银行卡号等等
	public function registerblind(){
		$param = input('post.');        
		$us_tel = $param['us_tel'];
		$rel = model('User')->where('us_tel',$us_tel)->update($param);
		$userid = model('User')->where('us_tel',$us_tel)->value('id');
		$data['us_id'] = $userid;
		$data['bank_account'] = $param['bank_account'];
		$data['bank_name'] = $param['bank_name'];
		$data['bank_branch_name'] = $param['bank_branch_name'];
		$data['status'] = 1;
		//$rel2 = model('banks')->addInfo($data);
		if($rel){
			$this->s_msg(null, '绑定成功');
		}
		$this->s_msg('您没有绑定信息');
	}

	public function forget() {
		if (is_post()) {
			$data = input('post.');
			//手机号
			$info = model('User')->detail(['us_tel' => $data['us_tel']]);
			if (!$data['us_tel'] || !$info) {
				$this->e_msg('该账号不存在');
			}
			$code_info = cache($data['us_tel'] . 'code') ?: "";
			if (!$code_info) {
				$this->e_msg('请重新发送验证码');
			} elseif (trim(input('post.code')) != $code_info) {
				$this->e_msg('验证码不正确');
			}
			unset($data['code']);
			$validate = validate('Verify');
			if (!$validate->scene('forgetUser')->check($data)) {
				$this->e_msg($validate->getError());
			}
			$data['us_pwd'] = encrypt($data['us_pwd']);
			$rel = model('User')->editInfo($data, ['id' => $info['id']]);
			if ($rel) {
				$this->result('1', 1, '修改成功', 'json');
			} else {
				$this->result('1', 2, '修改失败,可能您的密码没有做出修改', 'json');
			}
		}
	}
	/**
	 * 86400 / 24 3600/60    120 两分钟
	 * 验证码
	 * @return [type] [description]
	 */
	public function send() {
		$mobile = input('post.mobile');
		if (cache($mobile . 'code')) {
			//halt(cache($mobile . 'code'));
			$this->e_msg('每次发送间隔120秒');
		}
		$random = mt_rand(1000, 9999);
		$rel = $this->note_code($mobile, $random);
		if ($rel['returnstatus'] == "Faild") {
			$this->e_msg($rel['message']);
		} else {
			cache($mobile . 'code', $random,300);
			$this->s_msg('发送成功');
		}
	}
	private function note_code($mobile, $content) {
		header('Content-Type:text/html;charset=utf8');
		$sms = Config::get('sms');
		$sms['password'] = ucfirst(md5($sms['password']));
		//$sms['content'] = $sms['content'].$content;
		$sms['content'] = $sms['content'].$content.$sms['contentlast'];
		// $sms['content'] = urlencode($content);
		// $sms['content'] = urlencode($sms['content']);
		$sms['mobile'] = $mobile;
		$query_str = http_build_query($sms);
		$gateway = "http://114.113.154.5/sms.aspx?action=send&" . $query_str;
		// $gateway = "http://114.113.154.5/sms.aspx?action=send&userid={$userid}&account={$account}&password={$password}&mobile={$mobile}&content={$content}&sendTime=";
		// $gateway = "http://114.113.154.5/sms.aspx?action=send&userid={$sms['userid']}&account={$sms['account']}&password={$sms['password']}&mobile={$mobile}&content={$sms['content']}&sendTime=";
		$url = preg_replace("/ /", "%20", $gateway);
		$result = file_get_contents($url);
		$xml = simplexml_load_string($result);
		return $this->object_array($xml);
	}

	public function token() {
		$pass = '123456';
		$url = "index/user/login";
		$tel = '15538927152';
		$pass1 = HmacMd5($pass, $pass);
		dump($pass1);
		$str = jsEncode($url, $pass1);
		dump($str);
		$this->result($tel . ':' . $str, 1, "获取成功", "json");
	}
	//code检查
    public function check_code($code) {
        //$code = '081cnrsy0W9FQg19xYty0g2zsy0cnrsx';
        $code = input('post.code');
        $wechat = $this->getOpenID($code);
        $this->s_msg(null, $wechat);
    }
    //获取openid
    protected function getOpenID($code) {

        $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" . $this->wechant_numb['appid'] . "&secret=" . $this->wechant_numb['appsecret'] . "&code=" . $code . "&grant_type=authorization_code";
        $weixin = file_get_contents($url); //通过code换取网页授权access_token
        $jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
        $array = get_object_vars($jsondecode); //转换成数组
        //dump($array);
        session('openid', $array['openid']);
        return $array;
        
    }
    public function aaa(){
    	$sms = Config::get('sms');
    	$content = '4561';
    	$sms['content'] = $sms['content'].$content.$sms['contentlast'];
    	halt($sms);
    }
    public function aboutus()
    {
    	$data = model('config')->where('id','in',[143,144,145])->select();
    	$this->s_msg(null, $data);
    }
    //上传图片
    public function upload()
    {
        $bb = Container::get('env')->get('ROOT_PATH');
        $file = request()->file('imgFile');
        //halt($file);
        $info = $file->validate(['size' => '4096000'])
            ->move($bb . 'public/uploads/');
        if ($info) {
            $path = '/uploads/' . $info->getsavename();
            $path = str_replace("\\", "/", $path);
            $this->s_msg(null,$path);
        } else {
            $data = array(
                'msg' => $file->getError(),
                'code' => 0,
            );
            $this->e_msg($data['msg']);
        }
    }

}
