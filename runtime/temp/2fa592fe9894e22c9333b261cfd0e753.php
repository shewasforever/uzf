<?php /*a:3:{s:64:"D:\phpstudy_pro\WWW\uzf\application\admin\view\product\edit.html";i:1585649744;s:64:"D:\phpstudy_pro\WWW\uzf\application\admin\view\public\_meta.html";i:1530329594;s:66:"D:\phpstudy_pro\WWW\uzf\application\admin\view\public\_footer.html";i:1530790558;}*/ ?>
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
<link href="/static/admin/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<style>

    .lbwxq_mImg {
        width: 110px;
        height: 110px;
        border: 1px solid #eee;
        position: relative;
    }

    .lbwxq_mImg img {
        width: 110px;
        height: 110px;
    }


    .big img{
        width: 1000px;
        height: 1000px;
    }

    /*大图*/

    .lbwxq_lImg {
        width: 500px;
        height: 500px;
        position: absolute;
        left: 540px;
        top: 25px;
        display: none;
        overflow: hidden;
    }

    .lbwxq_lImg img {
        width: 1000px;
        height: 1000px;
    }


    .pic {
        display: inline-block;
    }

    .pic img {
        width: 110px;
        height: 110px;
    }
    body,html{
    position: relative;
    }
    .big{
       position: absolute;
        right: 25%;
        top: 120px;
        width: 300px;
        height: 300px;
    }
    .big img{
        width: 100%;
        height: 100%;
    }
</style>

<body>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>服务管理 <span class="c-gray en">&gt;</span> 修改服务 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="page-container">
        <form class="form form-horizontal" id="form-article-add">
            <input type="hidden" name="__token__" value="<?php echo htmlentities(app('request')->token()); ?>" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>服务名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="服务名称" name="pd_name" value="<?php echo htmlentities($info['pd_name']); ?>" style="width:20%">
                </div>
            </div>


            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>价格：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="价格" name="pd_price" value="<?php echo htmlentities($info['pd_price']); ?>" style="width:20%">
                </div>
            </div>

            <!-- <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">服务销量：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="number" class="input-text" placeholder="服务销量" name="pd_sales" value="<?php echo htmlentities($info['pd_sales']); ?>" style="width:20%">
                </div>
            </div> -->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>服务分类：</label>
                <div class="formControls col-xs-8 col-sm-9"> 
                    <span class="select-box" style="width:20%">
                        <select name="ca_id"  class="select">
                            <option value="">选择服务分类</option>
                            <?php if(is_array($ca_list) || $ca_list instanceof \think\Collection || $ca_list instanceof \think\Paginator): $i = 0; $__LIST__ = $ca_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<!--                                 <?php if($vo['p_id'] == 0): ?><option value="<?php echo htmlentities($vo['id']); ?>"-->
<!--                                <?php if($vo['id'] == $info['ca_id']): ?> selected="selected" <?php endif; ?>>┣<?php echo htmlentities($vo['ca_name']); ?></option>-->
<!--                                <?php elseif($vo['p_id'] != 0): ?>-->
<!--                                <option value="<?php echo htmlentities($vo['id']); ?>"<?php if($vo['id'] == $info['ca_id']): ?> selected="selected" <?php endif; ?>>┗━<?php echo htmlentities($vo['ca_name']); ?></option>-->
<!--                                <?php endif; ?>-->
                                <option value="<?php echo htmlentities($vo['id']); ?>" <?php if($vo['id'] == $info['ca_id']): ?> selected="selected" <?php endif; ?>>┣<?php echo htmlentities($vo['ca_name']); ?></option>
                                    <!-- <?php $_result=getChild($vo['id']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voo): $mod = ($i % 2 );++$i;?>
                                    <option value="<?php echo htmlentities($voo['id']); ?>" <?php if($voo['id'] == $info['ca_id']): ?> selected="selected" <?php endif; ?>>┗━<?php echo htmlentities($voo['ca_name']); ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?> -->
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </span>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">地址：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" placeholder="产地" name="pd_place" value="<?php echo htmlentities($info['pd_place']); ?>" style="width:20%">
                </div>
            </div>


            
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">服务描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea type="text"  placeholder="服务描述" name="pd_content" value="" style="width:20%" rows="3" cols="18"><?php echo htmlentities($info['pd_content']); ?></textarea>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">缩略图：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div style="width:110px;height: 110px;position: relative;display: inline-block; ">   
                        <?php if($info['pd_head_pic']): ?>
                            <img src="<?php echo htmlentities($info['pd_head_pic']); ?>" class="logo" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;">
                        <?php else: ?>
                            <img src="/static/admin/img/add0.png" class="logo" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;">
                        <?php endif; ?>                     
                                               
                        <input type="file" name="file" onchange="eee($(this))" class="input-text" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;opacity: 0;">
                    </div>
                </div>
            </div>
            <div style="display:none" class="dfd">
                <input type="text" name="pd_head_pic" value="<?php echo htmlentities($info['pd_head_pic']); ?>">
                <input type="text" name="id" value="<?php echo htmlentities($info['id']); ?>">
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">主图：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <div class="pic" >
                        <?php if(is_array($info['pd_pic']) || $info['pd_pic'] instanceof \think\Collection || $info['pd_pic'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['pd_pic'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                          <li class="maomao" style="position: relative; list-style: none;float: left">
                            <i class="Hui-iconfont ioc_x" onclick="remove_li(this)"  style="position: absolute;right: 0; top: 0;">&#xe6e2;</i>
                            <img  src="<?php echo htmlentities($vo); ?>" onclick="ccc(this)"  alt="">
                          </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                    <div style="width:110px;height: 110px;position: relative;display: inline-block; ">
                        <img src="/static/admin/img/add0.png" alt="" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;">
                        <input type="file" name="file" onchange="bbb($(this))" class="input-text" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;opacity: 0;">
                    </div>
                </div>
            </div>
            <div style="display:none" class="ttt">
                <?php if(is_array($info['pd_pic']) || $info['pd_pic'] instanceof \think\Collection || $info['pd_pic'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['pd_pic'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <input type="text" name="pd_pic[]" class="ppp" value="<?php echo htmlentities($vo); ?>">
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <input type="text" name="pd_id" value="<?php echo htmlentities($info['id']); ?>">
            </div>
 <!--            <div class="row" id="sku">
                
                <div class="row cl sku_item">
                    <label class="form-label col-xs-4 col-sm-2">服务规格：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="text" name="sku_list[<?php echo htmlentities($i); ?>][]" class="hidden" placeholder="" value="">
                        <div class="col-md-3">
                            <div class="formControls col-xs-12 col-sm-12 col-md-9" style="padding: 0">
                                <input type="text" name="sku_list[<?php echo htmlentities($i); ?>][sku_name]" id="" placeholder="" value="" class="input-text">
                            </div>
                        </div>
                        <div class=" col-md-2">
                            <label class="form-label col-xs-12 col-sm-12 col-md-3" style="text-align: left;padding: 0">价格</label>
                            <div class="formControls col-xs-12 col-sm-12 col-md-9" style="padding: 0">
                                <input type="number" name="sku_list[<?php echo htmlentities($i); ?>][realprice]" id="" placeholder="" value="" class="input-text">
                            </div>
                        </div>
                        <div class=" col-md-2">
                            
                                <button class="btn btn-primary" onclick="return addSku()">添加</button>
                          
                                
                            
                        </div>
                    </div>
                </div>
                
            </div> -->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">详细内容：</label>
                <div class="formControls col-xs-8 col-sm-9"> 
                    <textarea id="editor" type="text/plain" name="pd_detail" style="width:100%;height:400px;">
                        <?php echo htmlentities((isset($info['pd_detail']) && ($info['pd_detail'] !== '')?$info['pd_detail']:'')); ?>
                    </textarea>
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                    <button onclick="return edit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 确认提交</button>
                </div>
            </div>
        </form>
    </div>
    <div class="big" >
        <!-- <img src="/static/admin/img/add0.png" /> -->
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

    <script type="text/javascript" src="/static/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/static/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
    <script type="text/javascript" src="/static/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript">
        $(function() {
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });
            $("#tab-system").Huitab({
                index: 0
            });
            var ue = UE.getEditor('editor');
        });

    function edit() {
        $.post('<?php echo url("edit"); ?>', $('#form-article-add').serialize()).success(function(data) {
            layer.msg(data.msg);
            if (data.code) {
                setTimeout(function() {
                    location.href = '';
                }, 1000);
            }
        });
        return false;
    }
    function bbb(dada) {
        var data = new FormData();
        data.append('file', dada[0].files[0]);
        var index = layer.load(1, { shade: false }); //0代表加载的风格，支持0-2
        $.ajax({
            url: '<?php echo url("upload"); ?>',
            type: 'POST',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                layer.msg(data.msg);
                if (data.code) {
                    var html1 = '<li class="maomao" style="position: relative; list-style: none;float: left"><i  onclick="remove_li(this)" class="Hui-iconfont ioc_x" style="position: absolute;right: 0; top: 0;">&#xe6e2;</i><img src="' + data.data + '"  onclick="ccc(this)" alt=""></li>';
                    var html2 = '<input name="pd_pic[]" class="ppp" hidden="hidden" value="'+data.data+'">';
                    $('.pic').append(html1);
                    $('.ttt').append(html2);
                }
                layer.close(index);
            },
            error: function() {
                layer.close(index);
                layer.msg('上传出错');
            }
        });
    }
    function ccc(data){
        var path = $(data).attr('src');
        var html = '<img src="' + path + '" onclick="ddd()" alt="">';
        $('.big').html(html);
        $('.big').show();
    }
    function ddd(){
        $('.big').hide();
    }
    ddd();
    //删除主图
    function remove_li(data){

        var index = $('.maomao i').index(data);
        $(data).parent().remove();
        // var path = $(data).next('img').attr('src');
        // var val = $('.ppp').eq(index).val();
        $('.ppp').eq(index).remove();
    }

    function eee(dada) {
        var data = new FormData();
        data.append('file', dada[0].files[0]);
        var index = layer.load(1, { shade: false }); //0代表加载的风格，支持0-2
        $.ajax({
            url: '<?php echo url("upload"); ?>',
            type: 'POST',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                layer.msg(data.msg);
                if (data.code) {
                    $('.logo').attr('src',data.data);
                    $('input[name="pd_head_pic"]').val(data.data);
                }
                layer.close(index);
            },
            error: function() {
                layer.close(index);
                layer.msg('上传出错');
            }
        });
    }
    // 新增sku
    function addSku() {
        i++;
        var html = 
            '<div class="row cl sku_item">' +
                '<label class="form-label col-xs-4 col-sm-2">服务规格：</label>' +
                '<div class="formControls col-xs-8 col-sm-9">' +
                    '<div class="col-md-3">' +
                        '<div class="formControls col-xs-12 col-sm-12 col-md-9" style="padding: 0">' +
                            '<input type="text" name="sku_list['+i+'][sku_name]" id="" placeholder="服务规格" value="" class="input-text">' +
                        '</div>' +
                    '</div>' +
                    '<div class=" col-md-2">' +
                        '<label class="form-label col-xs-12 col-sm-12 col-md-3" style="text-align: left;padding: 0">价格</label>' +
                        '<div class="formControls col-xs-12 col-sm-12 col-md-9" style="padding: 0">' +
                            '<input type="number" name="sku_list['+i+'][realprice]" id="" placeholder="对应价格" value="0" class="input-text">' +
                        '</div>' +
                    '</div>' +
                    '<div class=" col-md-2">' +
                        '<label class="form-label col-xs-12 col-sm-12 col-md-3" style="text-align: left;padding: 0">原价</label>' +
                        '<div class="formControls col-xs-12 col-sm-12 col-md-9" style="padding: 0">' +
                            '<input type="number" name="sku_list['+i+'][oldprice]" id="" placeholder="" value="0" class="input-text">' +
                        '</div>' +
                    '</div>' +
                    '<div class=" col-md-2">' +
                        '<button class="btn btn-danger" onclick="return rmSku(this,i)">移除</button>' +
                    '</div>' +
                '</div>' +
            '</div>';
        $('#sku').append(html);
        return false;
    }

    // 移除sku
    function rmSku(obj, skuid = 0) {
        //alert(obj);
        if (skuid) {
            $.get("<?php echo url('rmSku'); ?>", {skuid:skuid}, function(data){
                console.log(data);
                layer.msg(data.msg);
                if (data.code) {
                    $(obj).parent().parent().parent().remove();
                }
            });
        }
        return false;
    }
    function selecttime(flag){
    if(flag==1){
        var endTime = $("#countTimeend").val();
        if(endTime != ""){
            WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:endTime})}else{
            WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})}
    }else{
        var startTime = $("#countTimestart").val();
        if(startTime != ""){
            WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:startTime})}else{
            WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})}
    }
 }
    </script>
</body>

</html>