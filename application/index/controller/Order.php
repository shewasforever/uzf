<?php
namespace app\index\controller;

use think\Controller;
use app\common\logic\OrderLogic;
use app\common\logic\ProductLogic;
use app\common\logic\OrderDetailLogic;
use app\index\controller\Wecpay;
use app\index\controller\Wehpay;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;


class Order extends Basis

{

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		//$map[] = ['a.us_id','=',input('post.us_id')];
		$map[] = ['a.us_id','=',$this->user['id']]; 
		// if(input('post.or_status')){
		// 	$map[] = ['or_status', '=', input('post.or_status')];
		// }

		$rel = $this->getorder($map);
		$this->s_msg(null, $rel);
	}
	public function getorder($map)
	{       
		$Order = new OrderLogic;            
		$list = $Order->getListNpg($map, $this->order,''); 
		//dump($list);
		$lists = array();      
		foreach ($list as $k => $v) {
			$lists[$k]['id'] = $v['id'];
			$lists[$k]['or_status'] = $v['or_status'];
			$totals = $this->orderTotalById($v['id']);
			$lists[$k]['total'] = $totals[0];
			$lists[$k]['take_fee'] = $totals[1];
			$lists[$k]['all_num'] = $totals[2];
			$lists[$k]['detail'] = model('OrderDetail')->where('or_id',$v['id'])->select();
			//$lists[$k]['st_name'] = model('User')->where('id',$v['st_id'])->value('us_apply_shopname')?:'草津堂';
			foreach ($lists[$k]['detail'] as $key => $value) {

				$pics = explode(",", $value['or_pd_pic']);
				if(!$pics[0]){
					array_shift($pics);
				}
				$lists[$k]['detail'][$key]['or_pd_pic'] = $pics;
				$lists[$k]['detail'][$key]['pd_head_pic'] = model('product')->where('id',$value['pd_id'])->value('pd_head_pic');
			}                              
		}
		if(!$list){
			$this->e_msg('没有查询到订单');
		}      
		return $lists;
	}

	public function wehpay()
	{

		if(!input('post.or_id')){
			$this->e_msg('无法获取订单ID');
		}
		$or_id = input('post.or_id');
		$or_status = model('order')->where('id',$or_id)->value('or_status');
		if($or_status > 0){
			$this->e_msg('请勿重复支付');
		}
		$or_data = $this->getOrderPay($or_id);
		$rel_pay = $or_data['rel_pay'];
		$bi = $this->user['us_shop_bi'];

		$topay = new Wehpay;
		$pay_msg['or_id'] = $or_id;
		$pay_msg['type'] = 6;
		$pay_msg['money'] = $rel_pay;

		$pay_msg['us_id'] = $this->user['id'];

		$pay_rel = $topay->index($pay_msg);

	}

	public function subOrder()
	{
		if (!input('post.or_id')){
			$this->e_msg('无法获取订单ID', 401);
		}
		//$or_id = decrypt(input('post.or_id'));
		$or_id = input('post.or_id');
		if (!is_numeric($or_id)) {			
			$or_id = decrypt($or_id);
			//$this->e_msg('转换失败', $or_id);
		}
		$Order = new OrderLogic;
		$list = $Order->getOneOrder($or_id);
		//dump($list);
		$total = 0;
		$take_fee = 0;

		$p_model = model('Product');
		foreach ($list as $k => $v) {
			$goods = $p_model->where('id',$v['pd_id'])->find();
			$skus = model('skus')->where('id',$v['sku_id'])->find();
			if($goods['take_fee'] > $take_fee){
				$take_fee = $goods['take_fee'];
			}
			$total += (float)$v['or_pd_num'] * (float)$skus['sku_price']?(float)$skus['sku_price']:$goods['pd_price'];
			$pics = explode(",", $v['or_pd_pic']);
			if(!$pics[0]){
				array_shift($pics);
			}
			$list[$k]['or_pd_pic'] = $pics; 
			$list[$k]['pd_head_pic'] = $goods['pd_head_pic'];  
			//$list[$k]['st_name'] = model('User')->where('id',$goods['st_id'])->value('us_apply_shopname')?:'草津堂'; 
			$list[$k]['pd_content'] = $goods['pd_content']; 
			$list[$k]['pd_price'] = $skus['sku_price']?$skus['sku_price']:$goods['pd_price']; 
		}
		//$data['skus'] = $skus;
		$data['list'] = $list;
		$data['order']['total'] = $total;
		$data['order']['all_money'] = $total + $take_fee;
		$data['order']['take_fee'] = $take_fee;
		$addr_id = model('order')->where('id',$or_id)->value('addr_id');
		 $rel = model('config')->where('id','in',[11,12,138,139])->field('value')->select();
	     foreach ($rel as $key => $value) {
	        $bank[$key] = $value['value'];  
	     }
		$data['bank'] = $bank;
		if(!$addr_id){
			$data['addr'] = model('UserAddr')->where('us_id',$this->user['id'])->where('addr_default',1)->find()?:'';
		}else{
			$data['addr'] = model('UserAddr')->where('id',$addr_id)->find();
		}       
		$this->s_msg(null, $data);
	}

	public function bandAddr()
	{
		$or_id = decrypt(input('post.or_id'));
		$addr_id = input('post.addr_id');
		if(!input('post.or_id') && !$addr_id){
			$this->e_msg('参数错误');
		}
		$info = model('order')->where('id',$or_id)->find();
		if(!$info){
			$this->e_msg('无法找到订单');
		}
		$data['addr_id'] = $addr_id;
		$rel = model('order')->where('id',$or_id)->update($data);
		$this->s_msg(null,1);
	}

	public function subOrderToPayBybi()
	{                   
		if(!input('post.or_id')){
			$this->e_msg('参数错误');
		}
		//$or_id_type = input('post.or_id_type');
		// if($or_id_type == 8){
		// 	$or_id = input('post.or_id');
		// }else{
		// 	$or_id = decrypt(input('post.or_id'));
		// }
		$or_id = input('post.or_id');
		// if(!input('post.or_pay_id')) {
		//         	$this->e_msg('缺少支付方式');
		// }
		$Order = new OrderLogic;
		// $or_remark = input('post.or_remark');
		// $this->checkAddr($or_id,$or_remark);
		$totals = $this->orderTotalById($or_id);
		$total_no_fee = $totals[3];
		$total = $totals[0];
		$balance = $this->user['us_all_get'];
		$level = $this->user['us_level'];
		$cat_id = model('order')->where('id',$or_id)->value('ca_id');
		$or_num = model('order')->where('id',$or_id)->value('or_num');
		if ($level == 2 && $cat_id == 11) {
			$this->e_msg('你已经是VIP用户，不能再报单了');
		}
		$map[] = ['id','=',$this->user['id']];
		if($balance >= $total){
			$rel = model('User')->where('id',$this->user['id'])->setDec('us_all_get',$total);       
			if(!$rel){
				$this->e_msg('余额扣除失败1');
			}
			if ($level == 0 && $total_no_fee >= 499) {
				$changelevel['us_level'] = 2;
				$changelevel['activate_time'] = date('Y-m-d H:i:s');

				$rel = model('user')->updateInfo($map,$changelevel);
				$data['add_time'] = date('Y-m-d H:i:s');
				$rel_time = model('order')->where('id',$or_id)->updateInfo($data);
				if (!$rel) {
					$this->e_msg('用户等级升级失败');
				}
			}
			// $wallet1['us_id'] = $this->user['id'];
			// $wallet1['or_id'] = $or_id;
			// $wallet1['get_bi'] = $total;
			// $wallet1['wa_type'] = 1;
			// $wallet1['wa_note'] = '余额购买商品';
			// $wallet1['add_time'] = date('Y-m-d H:i:s');
			// $wa1_rel = model('Wallet')->addInfo($wallet1);
			$or_status_data['or_status'] = 1;
			$or_rel = model('Order')->where('id',$or_id)->update($or_status_data);

			// $rel2 = model('User')->where('id',$this->user['id'])->setInc('us_all_shopping',$total);
			// if(!$rel2){
			// 	$this->e_msg('个人消费总额更新失败');
			// }
			$awa =$Order->gaveAward($total_no_fee,$or_id);
            if ($awa['code'] == 0) {
                $this->e_msg('奖励发放失败');
            }
			$this->s_msg('购买成功');
			 
		}else{	
			$payable = $total - $balance; 
			if (input('post.or_pay_id') == 0) {
	            $config = config('alipay');
	            $order = [
				    'out_trade_no' => $or_num,
				    'subject' => '草津堂生物药膳购买商品',
				    'total_amount' => $payable,
				];
				$alipay = Pay::alipay($config)->wap($order);
				$this->s_msg(null,$alipay);
			}elseif (input('post.or_pay_id') == 1) {
	
	   				$wechat = config('wechat');
					$order = [
					    'out_trade_no' => $or_num,
					    'body' => '草津堂生物药膳购买商品',
					    'total_fee' => $payable*100,
					];
					$wepay=Pay::wechat($wechat)->wap($order);		
				$this->s_msg(null,$wepay);
			}elseif (input('post.or_pay_id') == 2) {
				$pic = base64_upload(input('post.or_voucher'));
				if ($pic) {
					$or_status_data['or_voucher'] = $pic;
				}else{
					$this->e_msg('图片上传失败');
				}
				
				$or_status_data['or_status'] = 5;
				$or_rel = model('Order')->where('id',$or_id)->update($or_status_data);
				if ($or_rel) {
					$this->s_msg('支付凭证已上传，等待平台审核');
				}else{
					$this->e_msg('支付凭证上传失败');
				}
				
			}
		}	
	}

	


	public function orderTotalById($or_id)
	{
		$p_model = model('product');
		$list = model('OrderDetail')->where('or_id',$or_id)->select();
		$total = 0;
		$take_fee = 0;
		$all_num = 0;
		foreach ($list as $k => $v) {
			$goods = $p_model->where('id',$v['pd_id'])->find();
			if($goods['take_fee'] > $take_fee){
				$take_fee = $goods['take_fee'];
			}
			$total += $v['or_pd_num'] * $goods['pd_price'];
			$all_num += $v['or_pd_num'];
		}
		$total_no_fee = $total;
		$total += $take_fee;
		return [$total,$take_fee,$all_num,$total_no_fee];
	}

	public function checkAddr($or_id,$or_remark)
	{
		$addr_id = model('UserAddr')->where('us_id',$this->user['id'])->where('addr_default',1)->fetchSql(false)->value('id');

		$order = model('order')->where('id',$or_id)->find();
		if(!$order['addr_id']){
			if(!$addr_id){
				$this->e_msg('请选择收货地址');
			}
			$data['addr_id'] = $addr_id;
			$data['or_remark'] = $or_remark;
			model('order')->where('id',$or_id)->update($data);
		}
	}

	public function orderDetail()
	{
		
		$or_id = input('post.or_id');
		if(!$or_id){
			$this->e_msg('无法获取订单');
		}

		$Order = new OrderLogic;
		$list = $Order->getOneOrder($or_id);
		foreach ($list as $k => $v) {
			$list[$k]['pd_head_pic'] = model('Product')->where('id',$v['pd_id'])->value('pd_head_pic');
		}
		$totals = $this->orderTotalById($or_id);

		$the_order = model('Order')->find($or_id);
		$the_order['list'] = $list;
		$addr = model('UserAddr')->where('id',$the_order['addr_id'])->find();
		$the_order['take_addr'] = $addr['province'] . $addr['city'] . $addr['area'] . $addr['addr_detail']; 
		$the_order['take_name'] = $addr['addr_receiver']; 
		$the_order['take_tel'] = $addr['addr_tel'];
		$the_order['all_money'] = $totals[0];
		$the_order['take_fee'] = $totals[1];
		$the_order['discount'] = 0;    //优惠金额
		// $the_order['or_total'] = $totals[0] - $totals[1];
		// $the_order['take_fee'] = $totals[1];
		$this->s_msg(null,$the_order);
	}

	public function remindDeliver()
	{
		$or_id = input('post.or_id');
		$time = time();
		$t = model('Order')->where('id',$or_id)->value('or_remind_time');
		if(!$t || $time >= $t + 1800){
			$rel = model('Order')->where('id',$or_id)->setInc('or_remind_times');
			model('Order')->where('id',$or_id)->update(['or_remind_time' => $time]);
			$this->s_msg('提醒发货成功');
		}else{
			$this->s_msg('您已提醒发货成功，半小时内请勿再次提醒');
		}        
		$this->s_msg(null,$or_id);
	}

	public function Igot()
	{
		$or_id = input('post.or_id');

		$data['or_status'] = 3;
		$data['or_finish_time'] = date('Y-m-d H:i:s');
		$rel = model('Order')->where('id',$or_id)->update($data);
		if($rel){
			$this->s_msg(null,'确认收货成功');
		}else{
			$this->e_msg('确认收货失败');
		}
	}

	public function delOrder()
	{
		$or_id = input('post.or_id');

		$rel = model('Order')->destroy($or_id);
		if($rel){
			$this->s_msg(null,'删除成功');
		}else{
			$this->e_msg('删除失败');
		}
	}
	//复购订单
	public function againorder()
	{
		$or_id = input('or_id');
		$us_id = $this->user['id'];
		$order = model('order')->where('id',$or_id)->select();
	
		$newoder['us_id'] = $order[0]['us_id'];
		$newoder['ca_id'] = $order[0]['ca_id'];
		$newoder['addr_id'] = $order[0]['addr_id'];
		$newoder['or_add_time'] = date('Y-m-d H:i:s');
		$newoder['or_num'] = date('Ymd') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
		//dump($newoder);
		$newoder['or_status'] = 0;
		$new_or_id = model('order')->addInfo($newoder);
		if (!$new_or_id) {
			$this->e_msg('订单添加失败');
			//$this->s_msg('订单添加成功',$new_or_id);
		}
		$orderdetails = model('OrderDetail')->where('or_id',$or_id)->select();
		 //dump($orderdetails);
		foreach ($orderdetails as $key => $value) {
			$order_d['pd_spec'] = $value['pd_spec'];                                  
			$order_d['or_id'] = $new_or_id;       
			$order_d['ca_id'] = $value['ca_id'];
			$order_d['pd_id'] = $value['pd_id'];
			$order_d['or_pd_name'] = $value['or_pd_name'];
			$order_d['or_pd_pic'] = $value['or_pd_pic'];
			$order_d['or_pd_price'] = $value['or_pd_price'];
			$order_d['or_pd_num'] = $value['or_pd_num'];
			$order_d['sku_id'] = $value['sku_id'];
			$order_d['or_pd_content'] = $value['or_pd_content'];
			$rel = model('OrderDetail')->addInfo($order_d);
			if(!$rel){
				$this->error('详情添加失败');
			}       
		}
		$this->s_msg('订单提交成功',$new_or_id);
		
	}

	public function addOrder()
	{
		$map['us_id'] = $this->user['id'];
		//$map['us_id'] = input('post.us_id');
		$level = $this->user['us_level'];
		$pd_id = input('post.pd_id');
		$pd_price = input('post.pd_price');
		//$pd_color = input('post.pd_color');
		$pd_spec = input('post.spec');
		$pd_num = input('post.num')?:1;
		$sku_id = input('post.sku_id');
		if(!$pd_id || !$pd_spec){
			$this->e_msg('请选择商品和参数');
		}

		$goods = model('Product')->where('id',$pd_id)->find();
		$order = array();
		$addr_id = model('UserAddr')->where('us_id',$this->user['id'])->where('addr_default',1)->value('id');
		if (!$addr_id) {
			$this->e_msg('请填写收货地址');
		}
		$order['ca_id'] = $goods['ca_id'];
		$ca_pid = $goods['ca_id'];

		$order['us_id'] = $map['us_id'];
		$order['or_status'] = 0;

		$order['addr_id'] = $addr_id;
		$order['or_add_time'] = date('Y-m-d H:i:s');
		$order['or_num'] = date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);


        $check_order_num = model('order')->where('or_num', $order['or_num'])->count();
        if ($check_order_num > 0) {
            $or_num = date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);  //订单号
            while (model('order')->where('or_num', $or_num)->count()) {
                $or_num = date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT); //订单号
            }
        } else {
            $or_num = $order['or_num'];
        }
		$or_id = model('order')->addInfo($order);
		if(!$or_id){
			$this->error('订单添加失败');
		}

		$pd_logic = new ProductLogic;
		$order_d = array();        
		//$order_d['pd_color'] = $pd_color;
		$order_d['pd_spec'] = $pd_spec;                                  
		$order_d['or_id'] = $or_id;       
		$order_d['ca_id'] = $goods['ca_id'];
		$order_d['pd_id'] = $goods['id'];
		$order_d['or_pd_name'] = $goods['pd_name'];
		$order_d['or_pd_pic'] = $goods['pd_pic'];
		$order_d['or_pd_price'] = $pd_price;
		$order_d['or_pd_num'] = $pd_num;
		$order_d['sku_id'] = $sku_id;
		$order_d['or_pd_content'] = $goods['pd_content'];
		$rel = model('OrderDetail')->addInfo($order_d);
		if(!$rel){
			$this->error('详情添加失败');
		}             
		$or_id = encrypt($or_id);    
		$this->s_msg('订单提交成功',$or_id);
	}

	public function gaveAward($or_id = '',$allfee = '')
	{
		$order = model('Order')->where('id',$or_id)->find();

		$ca_id = $this->user['us_abc'];
		$us_id = $order['us_id'];        
		$u_model = model('User');

		$path = $u_model->where('id',$us_id)->value('us_path');
		$path_array = explode(',', $path);
		$path_array = array_reverse($path_array);

		foreach ($path_array as $k => $v) {
			if($k <= 2){

				$p_id1 = $v;
				$us_level1 = $u_model->where('id',$v)->value('us_level');
				$us_award_type1 = $u_model->where('id',$v)->value('us_award_type');
				$award1 = db('award')->where('us_level',$us_level1)->where('award_level',$k+1)->where('ca_level',$ca_id)->value('award');
				$award1 = $award1 * $us_award_type1 * $allfee;
				$rel1 = $u_model->where('id',$p_id1)->setInc('us_shop_bi',($award1*0.9));
				$rel1 = $u_model->where('id',$p_id1)->setInc('us_all_get',$award1);
				$wallet1['us_id'] = $p_id1;
				$wallet1['or_id'] = $or_id;
				$wallet1['wa_num'] = $award1;
				$wallet1['wa_type'] = 3;
				$wallet1['wa_note'] = ($k+1).'代奖励发放';
				$wallet1['add_time'] = date('Y-m-d H:i:s');
				$wa1_rel = model('Wallet')->addInfo($wallet1);
			}
		}
	}
}
