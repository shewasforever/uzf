<?php /*a:3:{s:63:"D:\phpStudy\WWW\szsc\application\admin\view\profit\paylist.html";i:1533008103;s:61:"D:\phpStudy\WWW\szsc\application\admin\view\public\_meta.html";i:1530329592;s:63:"D:\phpStudy\WWW\szsc\application\admin\view\public\_footer.html";i:1530790557;}*/ ?>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/static/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/static/admin/page.css" />
<link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/static/admin/static/h-ui.admin/css/style.css" />
<style>
	.table-bg thead th {
	     background-color:rgba(255,255,255,0); 
	}
	.bg-1 {
	    background-color:rgba(255,255,255,0);
	}
</style>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title></title>
</head>

<body>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>财务管理 <span class="c-gray en">&gt;</span> 支付记录<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="page-container">
        <div class="text-c">
            <form class="Huiform" method="get" action="">
            </span>
                <input type="text" class="input-text" style="width:150px" placeholder="用户姓名、手机号" id="" name="keywords" value="<?php echo htmlentities((app('request')->get('keywords') ?: '')); ?>">
                <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
            </form>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span style="margin: 50px">今日销售额：<?php echo htmlentities($todaysold); ?> </span>
            <span >累计销售额：<?php echo htmlentities($allsold); ?> </span>
            <span class="r">共有数据：<strong><?php echo htmlentities($list->total()); ?></strong> 条</span>
        </div>           
             </div>
        <div class="mt-20">
            <table class="table table-border  table-hover table-bg table-sort">
                <thead>
                    <tr class="text-c">
                        <th>付款人</th>
                        <th>手机号</th>
                        <th>账号</th>
                        <th>金额</th>
                        <th>类型</th>
                        <th>状态</th>
                        <th>时间</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <tr class="text-c">
                        <td><?php echo htmlentities($vo['us_nickname']); ?></td>
                        <td><?php echo htmlentities($vo['us_tel']); ?></td>
                        <td><?php echo htmlentities($vo['us_account']); ?></td>
                        <td><?php echo htmlentities($vo['money']); ?></td>
                        <td><?php echo htmlentities($vo['type_text']); ?></td>
                        <td><?php echo htmlentities($vo['status_text']); ?></td>
                        <td><?php echo htmlentities($vo['add_time']); ?></td>
                        <!-- <td class="td-manage">
                            <a style="text-decoration:none" onclick="change(<?php echo htmlentities($vo['id']); ?>,1,'tx_status')" title="给予提现"><i class="Hui-iconfont">&#xe634;</i></a>
                        </td> -->
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div class="pages" style="margin:20px;float: right; "><?php echo $list; ?></div>
        </div>
        <script type="text/javascript" src="/static/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/static/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/admin/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="/static/admin/static/gojs/go.js"></script>
<script type="text/javascript" src="/static/admin/static/qrcodejs-master/qrcode.js"></script>
<script>
	var aa = "<?php echo htmlentities(app('request')->controller()); ?>";
	var bb = "<?php echo htmlentities(app('request')->action()); ?>";
	// console.log(aa+"/"+bb);
</script>
<?php if(app('session')->get('admin.id') != '1'): ?>
	<script type="text/javascript">
	var nodeData = [<?php echo htmlentities(app('session')->get('rules')); ?>];
	$('.rule_node').addClass('hidden');
	$.each(nodeData, function (index, value) {
		$('.sidebar').find('li[data-node-id="' + value + '"]').removeClass('hidden');
		$('.sidebar').find('dt[data-node-id="' + value + '"]').removeClass('hidden');
	});
	</script>
<?php endif; ?>

        <!--请在下方写此页面业务相关的脚本-->
        <script type="text/javascript">
        $('select[name="wa_type"]').val(<?php echo htmlentities(app('request')->get('wa_type')); ?>);

        function create(id, url, key) {
            var url = "<?php echo url('" + url + "'); ?>?id=" + id;
            creatIframe(url, key);
        }
        function change(id,value,key){
        layer.confirm('确定要审批么？', {
              btn: ['确定', '取消']
            }, function(index, layero){
                $.ajax({
                    type: "post",
                    url: "<?php echo url('change'); ?>",
                    data: {id:id,value:value,key:key},
                    success: function(data) {
                        if(data.code){
                            layer.msg(data.msg);
                            setTimeout("window.location='';",500);
                        }
                    }
                });
            });
        }
        function del(id, key) {
            layer.confirm('确定要删除么？', {
                btn: ['确定', '取消']
            }, function(index, layero) {
                $.ajax({
                    type: "post",
                    url: "<?php echo url('Every/allDel'); ?>",
                    data: { id: id, key, key },
                    success: function(data) {
                        layer.msg(data.msg);
                        if (data.code == 1) {
                            setTimeout(function() {
                                location.href = data.url;
                            }, 1000);
                        }
                    }
                });
            });
        }
        </script>
</body>

</html>