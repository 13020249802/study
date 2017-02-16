<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="taglib.jsp"%>
<style>
body{font-family:'微软雅黑'; margin:0 auto;min-width:980px;}
ul{display:block;margin:0;padding:0;list-style:none;}
li{display:block;margin:0;padding:0;list-style: none;}
cite{font-style:normal;}
h2{font-weight:normal;}


.topleft{height:88px;background:url(${rootURL}resources/images/topleft.jpg) no-repeat;float:left; width:300px;}
.topleft img{margin-top:12px;margin-left:10px;}
.topright{height:88px;width:auto;background:url(${rootURL}resources/images/topright.jpg) no-repeat right;float:right;}
.nav{float:left;}
.nav li{float:left;width:80px;height:88px; text-align:center;}
.nav li a{display:block;width:80px;height:88px;-moz-transition: none; transition: background-color 0.3s linear; -moz-transition: background-color 0.3s linear; -webkit-transition: background-color 0.3s linear; -o-transition: background-color 0.3s linear; }
.nav li a.selected{background:url(${rootURL}resources/images/navbg.png) no-repeat;}
.nav li a:hover{display:block;background:#000;color:#fff;background: none repeat scroll 0% 0% rgb(43, 127, 181);}
.nav li img{margin-top:10px;}
.nav li a{display:block;}
.nav a h2{font-size:14px;color:#d6e8f1;}
.nav a:hover h2{color:#fff;}
.topright ul{padding-top:15px; float:right; padding-right:12px;}
.topright ul li{float:left; padding-left:9px; padding-right:9px; background:url(${rootURL}resources/images/line.gif) no-repeat right;}
.topright ul li:last-child{background:none;}
.topright ul li a{font-size:13px; color:#e9f2f7;}
.topright ul li a:hover{color:#fff;}
.topright ul li span{margin-top:2px;float:left;padding-right:3px;}
.user{height:30px;background:url(${rootURL}resources/images/ub1.png) repeat-x;clear:both;margin-top:10px;float:right; margin-right:12px;border-radius:30px; behavior:url(js/pie.htc); white-space:nowrap;position:relative;}
.user span{display:inline-block;padding-right:10px; background:url(${rootURL}resources/images/user.png) no-repeat 15px 10px; line-height:30px; font-size:14px;color:#b8ceda; padding-left:20px; padding-left:35px;}
.user b{display:inline-block;width:20px;height:18px; background:url(${rootURL}resources/images/msg.png);text-align:center; font-weight:normal; color:#fff;font-size:14px;margin-right:13px; margin-top:7px; line-height:18px;} 
.user i{display:inline-block;margin-right:5px;font-style:normal;line-height:30px; font-size:14px;color:#b8ceda;} 
</style>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a.titleBarAction").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
		
		var tabTitle = $(this).find('img').attr('title');
		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = '';//getIcon(menuid, icon);
		
		addTab(tabTitle, url, icon);
	});
	
	var currentUser = $("#currentUser").html();
	$("#updatePwd_li").show();
	$("#updatePwd").click(function(){
		$("#updatePwd_div").dialog({
		    title: '修改密码',
		    width: 500,
		    height: 400,
		    closed: false,
		    cache: false,
		    href: '${rootURL}toUpdatePwd',
		    modal: true,
		    buttons:[{
				text:'确认',
				iconCls:'icon-ok',
				handler:function(){
					var isValid = $("#updatePwdForm").form('validate');
					if(!isValid) return false;
					var new_password = $("input[name='new_password']").val();
					var new_confirm_password = $("input[name='new_confirm_password']").val();
					if(new_password != new_confirm_password){
						$.messager.alert('错误',"新密码与确认密码不一致，请确认!",'error');
						return false;
					}
					var form = $('#updatePwdForm').serialize();
					$.post('${rootURL}doUpdatePwd',form,function(data){
						var status = data.status;
						if("false" == status){
							$.messager.alert('错误',data.mes,'error');
						} else {
							$.messager.alert('提示','修改密码成功，需要退出后重新登录。','info', function(){
								window.location.href = "${rootURL}logout";
							});
						}
		        	});
				}
			},{
				text:'关闭',
				iconCls:'icon-clear',
				handler:function(){$('#updatePwd_div').dialog('close'); }
			}]
		});
	});
	
})	
</script>
    <div class="topleft">
    	<img src="${rootURL}resources/images/onstart_logo_3.png" style="height:75px;width:200px;"/>
    	<span></span>
    </div>
    <div style="height:75px;float:left;text-align:center;">
    	<span style="text-align:center; color:#d6e8f1; float:left; padding:20px 20px; font-size: 25px;font-weight: bold; margin: 0 0 15px;">企业管理集成平台</span>
    </div>
    <div style="float:right">
    <!-- 
    <ul class="nav">
    <li><a style="cursor:pointer;" target="rightFrame" rel="appList" ref="11" class="titleBarAction selected"><img src="${rootURL}resources/images/app_48.png" title="APP管理" /><h2>APP管理</h2></a></li>
    <li><a style="cursor:pointer;" target="rightFrame" rel="userProfileList" ref="41" class="titleBarAction"><img src="${rootURL}resources/images/user_48.png" title="用户管理" /><h2>用户管理</h2></a></li>
    <li><a style="cursor:pointer;"  target="rightFrame" rel="groupList" ref="51" class="titleBarAction"><img src="${rootURL}resources/images/group_48.png" title="分组管理" /><h2>分组管理</h2></a></li>
    <li><a style="cursor:pointer;"  target="rightFrame" rel="messageList" ref="21" class="titleBarAction"><img src="${rootURL}resources/images/message_48.png" title="消息管理" /><h2>消息管理</h2></a></li>
    </ul>
    -->
    <div class="topright">
    <ul>
    <li></li>
    <li></li>
    
   <!--  <li style="float: left;"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
		document.write(unescape("%3Cspan  id='cnzz_stat_icon_1254652506'%3E%3C/span%3E%3Cscript src='" +
		cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1254652506%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script></li> -->
    <li style="float: right;"><a href="${rootURL}logout" style ="cursor: pointer;text-decoration: none;">退出</a></li>
    <li id="updatePwd_li" style="float: right; display: none;"><a href="#" id="updatePwd" style ="cursor: pointer;text-decoration: none;">修改密码</a></li>
    </ul>
    <div class="user">
    <span id="currentUser"><shiro:principal property="nickname"/></span>
   <!--  <i>消息</i>
    <b><a href="#" id="zhanMessage" >10</a></b> -->
    </div> 
    </div>
    </div>
    <div id="updatePwd_div">
    </div>
