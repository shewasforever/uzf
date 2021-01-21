<?php
namespace app\index\controller;

use app\admin\logic\UserLogic;
use hyperjiang\BankCard;
use app\index\controller\Wecpay;

class User extends Basis
{

	public function __construct()
	{
		parent::__construct();
	}

	public function detail()
	{

		$data = $this->user;
		$this->s_msg(null, $data);
	}

	public function doedit()
	{

		$param = input('post.');        
		$us_id = $this->user['id'];
		$pic = base64_upload($param['us_head_pic']);
		// if ($pic) {
		// 	$param['us_head_pic'] = $pic;
		// }else{
		// 	$this->e_msg('图片上传失败');
		// }
		//$param['us_head_pic'] = base64_upload($param['us_head_pic']);
		// if(!$param['us_head_pic']){
		// 	unset($param['us_head_pic']);
		// }
		// unset($param['us_tel']);
		$rel = model('User')->where('id',$us_id)->update($param);
		if($rel){
			$this->s_msg(null, 1);
		}
		$this->s_msg('您没有做出修改');
	}

	public function myHead()
	{
		$data['us_head_pic'] = $this->user['us_head_pic'];
		$data['us_nickname'] = $this->user['us_nickname'];

		if($this->user['us_level'] == 0 || $this->user['us_level'] == 1 || $this->user['us_level'] == 3){
			$data['us_level'] = '普通会员';
		}elseif($this->user['us_level'] == 2){
			$data['us_level'] = 'VIP会员';
		}
		$data['merchant_status'] = $this->user['merchant_status'];
		//$data['us_apply_shopname'] = $this->user['us_apply_shopname'];
		$data['id'] = $this->user['id'];
		$this->s_msg(null,$data);
	}

	public function qrcode()
	{
		$code = $this->user['id'];
		if (!$code) {
			$this->e_msg('用户没有登录');
		}
		// $code = encrypt($id);       
		$this->s_msg(null,$code);
	}

	public function myAccount()
	{
		$id = input('post.id');
		
		//$id = $this->user['id'];

		// if ($type == 2) {
		// 	$info = model('tixian')->where('us_id',$id)->select();
		// 	foreach ($info as $k => $v) {
		// 		$info[$k]['us_tel'] = $this->user['us_tel'];
		// 	}
		// } 
		// if ($type == 1) {   //报单奖励
		// 	$infos = model('wallet')->where('us_id',$id)->where('wa_type',1)->select();
		// 	$infos['all'] = $this->user['us_first_get'];
		// }elseif ($type == 2) {   //复购奖励
		// 	$infos = model('wallet')->where('us_id',$id)->where('wa_type',2)->select();
		// 	$infos['all'] = $this->user['us_secend_get'];
		// }elseif ($type == 3) {   //特惠专区奖励
		// 	$infos = model('wallet')->where('us_id',$id)->where('wa_type',3)->select();
		// 	$infos['all'] = $this->user['us_share_get'];
		// }elseif ($type == 4) {   //月底分红奖励
		// 	$infos = model('wallet')->where('us_id',$id)->where('wa_type',4)->select();
		// 	$infos['all'] = $this->user['us_share_bonus'];
		// }
		$info['first'] = model('wallet')->where('us_id',$id)->where('wa_type',1)->select();
		foreach ($info['first'] as $key => $value) {
			$account = model('wallet')
			->alias('a')
            ->join('order b','a.or_id = b.id','LEFT')
            ->join('user c','c.id = b.us_id','LEFT')
            //->where('a.us_id',$id)
            ->where('a.or_id',$value['or_id'])
            ->field('us_tel')
            ->find();
            $info['first'][$key]['us_tel'] = $account['us_tel'];
		}
		//dump($info['first']['us_account']);
		//dump($info['first']['us_account']);
		$info['secend'] = model('wallet')->where('us_id',$id)->where('wa_type',2)->select();
		foreach ($info['secend'] as $key => $value) {
			$account = model('wallet')
			->alias('a')
            ->join('order b','a.or_id = b.id','LEFT')
            ->join('user c','c.id = b.us_id','LEFT')
            //->where('a.us_id',$id)
            ->where('a.or_id',$value['or_id'])
            ->field('us_tel')
            ->find();
            $info['secend'][$key]['us_tel'] = $account['us_tel'];
		}
		$info['third'] = model('wallet')->where('us_id',$id)->where('wa_type',3)->select();
		foreach ($info['third'] as $key => $value) {
			$account = model('wallet')
			->alias('a')
            ->join('order b','a.or_id = b.id','LEFT')
            ->join('user c','c.id = b.us_id','LEFT')
            //->where('a.us_id',$id)
            ->where('a.or_id',$value['or_id'])
            ->field('us_tel')
            ->find();
            $info['third'][$key]['us_tel'] = $account['us_tel'];
		}
		$info['fourth'] = model('wallet')->where('us_id',$id)->where('wa_type',4)->select();
		$info['month_all'] = $this->user['us_share_bonus'];
		$info['share_all'] = $this->user['us_share_get'];
		$info['secend_all'] = $this->user['us_secend_get'];
		$info['first_all'] = $this->user['us_first_get'];
		//$info['us_account'] = $this->user['us_account'];
		// $infos = model('wallet')->where('us_id',$id)->select();
		// $sb = 1 - cache('setting')['sb'];
		// foreach ($infos as $k => $v) {
		// 	if(!$v['get_bi']){
		// 		$infos[$k]['get_bi'] = number_format($v['wa_num'] * $sb , 2);
		// 	}                
		// 	$infos[$k]['us_tel'] = $this->user['us_tel'];
		// }
		// $info['list'] = $infos;
		// $info['all'] = $this->user['us_all_get'];
		

		$this->s_msg(null,$info);
	}

    /**
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author sunpf
     * @date 2020/4/12 14:33
     */
	public function apply()
	{
		$param = input('post.');
		$validate = validate('Verify');
		if (!$validate->scene('apply')->check($param)) {
			$this->e_msg($validate->getError());
		}
		if ($this->user['us_type'] != 1){
            $this->e_msg('你不是会员无法申请商家');
        }
		$param['start_time'] = date('Y-m-d H:i:s');
		$param['status'] = 1;


		$map['user_id'] = $this->user['id'];

		$info = model('apply')->where($map)->find();
		if ($info){
            $this->e_msg('您的申请已在审批中，请勿重复提交');
        }

		$rel = model('apply')->add($param);
		if($rel){
			$this->s_msg('申请成功');
		}else{
            $this->e_msg('申请失败');
        }

	}

	public function myWallet()
	{
		$id = $this->user['id'];
		$tixian = model('Tixian')->where('id',$id)->select();
		//$data['us_shop_bi'] = $this->user['us_shop_bi'];
		$data['us_all_get'] = $this->user['us_all_get'];
		$data['tixian'] = $tixian;
		$this->s_msg(null,$data);
	}

	public function mybanks()
	{
		//$id = input('post.us_id');
		$id = $this->user['id'];
		$banks = model('Banks')->where('us_id',$id)->select();
		if (count($banks) == 0) {
			$this->e_msg('你没有银行卡');
		}
		//$data['us_shop_bi'] = $this->user['us_shop_bi'];
		// $data['us_all_get'] = $this->user['us_all_get'];
		// $data['tixian'] = $tixian;
		$this->s_msg(null,$banks);
	}

	public function addbank()
	{
		$param = input('post.');
		$validate = validate('Verify');
		if (!$validate->scene('addBank')->check($param)) {
			$this->e_msg($validate->getError());
		}

		$param['us_id'] = $this->user['id'];
		if ($param['status'] == 1) {
			$re = model('Banks')->where('us_id',$param['us_id'])->where('status',1)->setDec('status');
		}
		
		//$default = model('Banks')->where('us_id',$this->user['id'])->where('status',1)->find();
		// if(!$default){
		// 	$param['status'] = 1;
		// }
		$rel = model('Banks')->addInfo($param);
		if($rel){
			$this->s_msg('添加成功',$rel);
		} 

	}
	public function setDefaultBank()
	{
		$map['id'] = input('post.id');              
		$param['status'] = 1;

		$addr_m = model('Banks');
		$us_id = $addr_m->where($map)->value('us_id');
		$addr_m->where('us_id',$us_id)->where('status',1)->setDec('status');
		$rel = $addr_m->updateInfo($map,$param);
		if($rel){
			$this->s_msg('设置成功');
		}else{
			$this->s_msg('您没有作出修改');
		} 
	}

	public function biToQuan()
	{
		$id = $this->user['id'];
		$num = input('post.num');
		$bi = $this->user['us_shop_bi'];
		if($bi < $num){
			$this->e_msg('现金积分不足');
		}
		$u_model = model('User');
		$rel1 = $u_model->where('id',$id)->setInc('us_shop_quan',$num);
		$rel2 = $u_model->where('id',$id)->setDec('us_shop_bi',$num);
		$adds = [
			'us_id' => $id,
			'num' => $num,
			'add_time' => date('Y-m-d H:i:s'),
		];
		db('exchange')->insert($adds);
		if($rel1 && $rel2){
			$this->s_msg('转换成功',1);
		}
		$this->e_msg('转换失败,请联系管理员');
	}

	public function stakeMoney()
	{
		$type = input('post.type');
		if($type == 0){
			$data['msg'] = '银行卡号';
			$data['account'] = $this->user['bank_account'];
			$data['type_pic'] = "/static/index/img/bank.png";
		}elseif($type == 1){
			$data['msg'] = '微信账号';
			$data['account'] = $this->user['we_account'];
			$data['type_pic'] = "/static/index/img/wechat.png";
		}elseif($type == 2){
			$data['msg'] = '支付宝账号';
			$data['account'] = $this->user['ali_account'];
			$data['type_pic'] = "/static/index/img/alipay.png";
		}
		$data['type'] = $type;
		$data['us_shop_bi'] = $this->user['us_shop_bi'];
		$this->s_msg(null,$data);
	}

	public function tixian()
	{
		$have = $this->user['us_all_get'];
		$id = $this->user['id'];
		$fee = cache('setting')['fee'];
		$data['fee'] = $fee;
		$data['id'] = $id;
		$data['allmoney'] = $have;
		$data['msg'] = '平台手续费率为'.$fee;
		$this->s_msg(null,$data);

	}
	public function takeMoney()
	{
		$us_id = input('post.id');
		$have = model('User')->where('id',$us_id)->value('us_all_get');
		$fee = cache('setting')['fee']; 
		
		$type = input('post.type');
		if($type == 1){
			$data['msg'] = '银行卡号';
			$rel = model('banks')->where('id',$us_id)->where('status',1)->value('bank_account');

			$da = model('User')->where('id',$us_id)->value('bank_account');

			if (!$da || !$rel) {
				$this->e_msg('请设置银行卡号');
			}
		}elseif($type == 2){
			$data['msg'] = '微信账号';
			$wexin = model('User')->where('id',$us_id)->value('we_account');
			//$wexin = $this->user['we_account'];
			if (!$wexin) {
				$this->e_msg('请填写微信账号');
			}
			//$data['type_pic'] = "/static/index/img/wechat.png";
		}elseif($type == 0){
			$data['msg'] = '支付宝账号';
			$zhifubao = model('User')->where('id',$us_id)->value('ali_account');
			//$zhifubao  = $this->user['ali_account'];
			if (!$zhifubao) {
				$this->e_msg('请填写支付宝账号');
			}
		}
		$param = input('post.');
		if(!$param['type'] || !$param['tx_num']){
			$this->e_msg('请完善信息');
		}
		$lowest = cache('setting')['lowest'];

		if($param['tx_num'] < $lowest){
			$this->e_msg('提现金额不得小于'.$lowest);
		}
		if($param['tx_num'] % 100 != 0){
			$this->e_msg('提现金额必须为100的整数倍');
		}
		
		$last_tixian = model('Tixian')->where('tx_status',0)->where('us_id',$us_id)->count();

		if($last_tixian){
			$this->e_msg('上次提现尚未完成！');
		}
		$param['us_id'] = $us_id;
		$param['tx_apply_time'] = date('Y-m-d H:i:s');

		$us_model = model('User');
		
		if($param['code'] == 1){
			$need = $have;
			$param['tx_num'] = $have * (1 - $fee);
			unset($param['code']);
		}else{
			$need = $fee * $param['tx_num'] + $param['tx_num'];
			if($need > $have){
				$this->e_msg('可用余额不足');
			}
		}                               
		$rell = $us_model->where('id',$us_id)->setDec('us_all_get',$need);
		if(!$rell){
			$this->e_msg('扣除余额失败');
		}

		$rel = model("Tixian")->insertInfo($param);
		if(!$rel){
			$this->e_msg('申请提现失败');
		}
		$this->s_msg('申请提现成功');
		

		
	}

	public function addAddr()
	{
		$param = input('post.');

		$validate = validate('Verify');
		if (!$validate->scene('addAddr')->check($param)) {
			$this->e_msg($validate->getError());
		}
		$param['us_id'] = $this->user['id'];
		$param['add_time'] = date('Y-m-d H:i:s');
		//$param['addr_code'] = implode(',', $param['addr_code']);
		$default = model('UserAddr')->where('us_id',$this->user['id'])->where('addr_default',1)->find();
		if(!$default){
			$param['addr_default'] = 1;
		}
		$rel = model('UserAddr')->addInfo($param);
		if($rel){
			$this->s_msg('添加成功',$rel);
		} 
	}

	public function myAddr()
	{
		$id = $this->user['id'];
		$info = model('UserAddr')->where('us_id',$id)->select();
		foreach ($info as $key => $value) {
			$info[$key]['addr_addr'] = $value['province'] . $value['city'] . $value['area'] . $value['addr_detail'];
		}
		$this->s_msg(null,$info);
	}

	public function setDefaultAddr()
	{
		$map['id'] = input('post.id');              
		$param['addr_default'] = 1;

		$addr_m = model('UserAddr');
		$us_id = $addr_m->where($map)->value('us_id');
		$addr_m->where('us_id',$us_id)->where('addr_default',1)->setDec('addr_default');
		$rel = $addr_m->updateInfo($map,$param);
		if($rel){
			$this->s_msg('设置成功');
		}else{
			$this->s_msg('您没有作出修改');
		} 
	}

	public function addrDetail()
	{
		$id = input('post.id');
		$info = model('UserAddr')->where('id',$id)->find();
		$info['addr_code'] = explode(',', $info['addr_code']);

		$this->s_msg(null,$info);
	}

	public function delAddr()
	{
		$id = input('post.id');
		$code = model('UserAddr')->where('id',$id)->value('addr_default');
		if($code == 1){
			$this->e_msg('默认地址不能被删除');
		}
		$rel = model('UserAddr')->destroy($id);
		if($rel){
			$this->s_msg('删除成功');
		}
		$this->e_msg('请联系网站管理员');
	}

	public function editAddr()
	{
		$param = input('post.');

		$validate = validate('Verify');
		if (!$validate->scene('addAddr')->check($param)) {
			$this->error($validate->getError());
		}
		$map['id'] = $param['id'];

		$rel = model('UserAddr')->updateInfo($map,$param);
		if($rel){
			$this->s_msg('修改成功');
		}else{
			$this->s_msg('您没有作出修改');
		}       
	}

	public function myTeam()
	{
		$u_model = model('User');

		$id = input('post.us_id')?:$this->user['id'];
		$user = $u_model->where('us_pid',$id)->where('us_level',2)->select();
		$list = array();
		foreach ($user as $k => $v) {
			$list[$k]['tel'] = $v['us_tel']; 
			$list[$k]['us_nickname'] = $v['us_nickname'];
			//$list[$k]['us_nickname'] = $v['us_nickname'];
			$list[$k]['account'] = $v['us_account'];
			$list[$k]['time'] = $v['us_add_time'];
		}
		//$map[] = ['us_path','like','0,1,'.'%'];
		//$map[] = ['us_path','like',$this->user['us_path'].','.$this->user['id'].'%'];
		//dump($map);
		$map[] = ['us_pid','=',$id];
        $info = model('user')->where($map)->select();
        $list2 = array();
        $list_all = array();
        foreach ($info as $k => $v) {
            $list2[$k]['tel'] = $v['us_tel']; 
            $list2[$k]['account'] = $v['us_account'];
            $list2[$k]['time'] = $v['us_add_time'];
            $list2[$k]['us_nickname'] = $v['us_nickname'];
            $list2[$k]['level'] = "一级";
            //$map['us_pid'] = $v['id'];
            $secend_array = model('user')->where('us_pid','=',$v['id'])->where('us_level','=',2)->select();
            //dump($secend_array);
            if (count($secend_array) != 0) {
                foreach ($secend_array as $key => $value) {
                    $list3[$key]['tel'] = $value['us_tel']; 
                    $list3[$key]['account'] = $value['us_account'];
                    $list3[$key]['time'] = $value['us_add_time'];
                    $list3[$key]['us_nickname'] = $value['us_nickname'];
                    $list3[$key]['level'] = "二级";
                }
                $list_all = array_merge($list_all,$list3);
            }
        }
		$data['first'] = $list;
		$data['other'] = array_merge($list2,$list_all);
		$this->s_msg(null,$data);
	}


	public function changePwd()
	{
		$old = input('post.old');
		$new = input('post.new');
		if(!$old || !$new){
			$this->e_msg('请完善信息');
		}
		$data['us_pwd'] = encrypt($new);
		if(encrypt($old) != $this->user['us_pwd']){
			$this->e_msg('旧密码错误');
		}
		$rel = model('User')->where('id',$this->user['id'])->update($data);
		if($rel){
			$this->s_msg('密码修改成功');
		}else{
			$this->e_msg('密码并未修改');
		}
	}
	public function message(){
		$data = input('post.');
		$data['add_time'] = date('Y-m-d H:i:s');
		$data['us_id'] = $this->user['id'];
		$data['pic'] = base64_upload($data['pic']);
		$validate = validate('Verify');
		if (!$validate->scene('addmessage')->check($data)) {
			$this->error($validate->getError());
		}
		$rel = model('message')->addInfo($data);
		if($rel){
			$this->s_msg('留言成功');
		}else{
			$this->e_msg('留言失败');
		}
	}
	public function showMessage()
	{
		$data = model('message')->where('us_id',$this->user['id'])->select();
		$this->s_msg(null,$data);
	}
}

