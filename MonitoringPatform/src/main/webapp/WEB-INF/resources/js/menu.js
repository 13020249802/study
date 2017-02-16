
var detailInfo = [{
	menuId : '6',
	title : 'App管理',
	msgList : [{
		msg : 'TODO App管理资源正在建设ing..........。'
	}]
},{
	menuId : '7',
	title : '用户管理',
	msgList : [{
		msg : 'TODO 用户管理资源正在建设ing..........。'
	}]
},{
	menuId : '8',
	title : '分组管理',
	msgList : [{
		msg : 'TODO 分组管理资源正在建设ing..........。'
	}]
},{
	menuId : '9',
	title : '消息管理',
	msgList : [{
		msg : 'TODO 消息管理资源正在建设ing..........。'
	}]
},{
	menuId : '10',
	title : '系统用户管理',
	msgList : [{
		msg : 'TODO 系统用户资源正在建设ing..........。'
	}]
}];
function loadMenu(data)
{
	addNav(data);
	InitLeftMenu();
}

function Clearnav() {
	var pp = $('#wnav').accordion('panels');

	$.each(pp, function(i, n) {
		if (n) {
			var t = n.panel('options').title;
			$('#wnav').accordion('remove', t);
		}
	});

	pp = $('#wnav').accordion('getSelected');
	if (pp) {
		var title = pp.panel('options').title;
		$('#wnav').accordion('remove', title);
	}
}

function addNav(data) {

	$.each(data, function(i, sm) {
		var menulist = "<ul>";
		$.each(sm.children, function(j, o) {
			/*menulist +=
				'<div class="panel-header accordion-header childMenu">'
				+ '<div class="panel-title panel-with-icon"  ref="'+ o.menuId + '" rel="'+ o.uri +'">' + o.menuName 
				+ '</div></div>';*/
			menulist +=
				'<li>'
				+	'<div class="">'
				+		'<a title="'+ o.menuName +'" ref="'+ o.menuId + '" rel="'+ o.uri +'" target="mainFrame">'
				+			'<span class="'+ o.icon +'"></span>'
				+			o.menuName
				+		'</a>'
				+	'</div>'
				+'</li>';
			
		});
		menulist += '</ul>';
		$('#wnav').accordion('add', {
			title : sm.menuName,
			content : menulist,
			iconCls : 'icon ' + sm.icon
		});

	});

	var pp = $('#wnav').accordion('panels');
	if(pp == []) return false;
	var t = pp[0].panel('options').title;
	$('#wnav').accordion('select', t);

}

// 初始化左侧
function InitLeftMenu() {
	
	$('.easyui-accordion li a').click(function(){
		var tabTitle = $(this).text();
		var url = $(this).attr("rel");
		addTab(tabTitle,url);
		$('.easyui-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
		var menuid = $(this).attr("ref");
		var infoHtml = '';
		$('#eastContent').html('');
		$.each(detailInfo, function(i, obj){
			if(menuid == obj.menuId){
				var childInfo = '';
				$.each(obj.msgList, function(j, item){
					childInfo += '<dd class="eastInfo">'+ item.msg +'</dd><br/>';
				})
				infoHtml += '<dl><dd class="eastTitle"><div class="messager-icon messager-question"></div><div>'+ tabTitle +'</div></dd><br/>' + childInfo +' </dl>';
			}
		})
		$('#eastContent').html(infoHtml);
	}).hover(function(){
		$(this).parent().addClass("hover");
	},function(){
		$(this).parent().removeClass("hover");
	});
	
	/*$('.panel .panel-header').bind('click', function() {
		$('.childMenu').removeClass("accordion-header-selected");
	})
	$('.childMenu').bind('click', function() {
		$('.childMenu').removeClass("accordion-header-selected");
		$(this).addClass("accordion-header-selected");
		if($(this).closest(".accordion-body").prev().hasClass("accordion-header-selected")){
			$(this).closest(".accordion-body").prev().removeClass("accordion-header-selected");
		}
		var tabTitle = $(this).children('.panel-title').html();
		var url = $(this).children('.panel-title').attr("rel");
		var menuid = $(this).children('.panel-title').attr("ref");
		var icon = '';//getIcon(menuid, icon);
		
		showEastInfo(menuid, tabTitle, url, icon);*/
		/*var infoHtml = '';
		$.each(detailInfo, function(i, obj){
			if(menuid == obj.menuId){
				var childInfo = '';
				$.each(obj.msgList, function(j, item){
					childInfo += '<dd class="eastInfo">'+ item.msg +'</dd><br/>';
				})
				infoHtml += '<dl><dd class="eastTitle"><div class="messager-icon messager-question"></div><div>'+ tabTitle +'</div></dd><br/>' + childInfo +' </dl>';
			}
		})
		
		$('#eastContent').html(infoHtml);*/
	/*});*/
}

/**
 * 菜单项鼠标Hover
 */
function hoverMenuItem() {
	$(".easyui-accordion").find('a').hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
}

// 获取左侧导航的图标
function getIcon(menuid) {
	var icon = 'icon ';
	$.each(_menus, function(i, n) {
		$.each(n, function(j, o) {
			$.each(o.menus, function(k, m){
				if (m.menuId == menuid) {
					icon += m.icon;
					return false;
				}
			});
		});
	});
	return icon;
}

function addTab(subtitle, url, icon) {
	if (!$('#tabs').tabs('exists', subtitle)) {
		$('#tabs').tabs('add', {
			title : subtitle,
			href : url,//'test',//;createFrame(url),
			closable : true,
			icon : 'icon-ok'//icon
		});
	} else {
		$('#tabs').tabs('select', subtitle);
		$('#mm-tabupdate').click();
	}
	$('#tabs').tabs('getSelected').zclip('show');
}

function tabClose() {
	/* 双击关闭TAB选项卡 */
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	});
	/* 为选项卡绑定右键 */
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
}
// 绑定右键菜单事件
function tabCloseEven() {
	// 刷新
	$('#mm-tabupdate').click(function() {
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		$('#tabs').tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url)
			}
		});
	});
	// 关闭当前
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close', currtab_title);
	});
	// 全部关闭
	$('#mm-tabcloseall').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			$('#tabs').tabs('close', t);
		});
	});
	// 关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function() {
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	// 关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function() {
		var nextall = $('.tabs-selected').nextAll();
		if (nextall.length == 0) {
			// msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			$('#tabs').tabs('close', t);
		});
		return false;
	});
	// 关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		if (prevall.length == 0) {
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			$('#tabs').tabs('close', t);
		});
		return false;
	});

	// 退出
	$("#mm-exit").click(function() {
		$('#mm').menu('hide');
	});
}

// 弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
//TODO:封装消息
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}

function showEastInfo(menuid, tabTitle, url, icon){
	addTab(tabTitle, url, icon);
	$('.eastContent').hide();
	/*if('6' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent1').show();
	}
	if('7' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent2').show();
	}
	if('8' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent3').show();
	}
	if('9' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent4').show();
	}
	if('10' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent5').show();
	}
	if('11' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent6').show();
	}
	if('12' == menuid){
		addTab(tabTitle, url, icon);
		$('#eastContent7').show();
	}*/
}
