﻿/*$(function() {
	tabClose();
	tabCloseEven();

	$('#css3menu a').click(function() {
		$('#css3menu a').removeClass('active');
		$(this).addClass('active');
		
		var d = _menus[$(this).attr('name')];
		Clearnav();
		addNav(d);
		InitLeftMenu();
	});

	// 导航菜单绑定初始化
	$("#wnav").accordion( {
		animate : false
	});

	var firstMenuName = $('#css3menu a:first').attr('name');
	//alert("sundy_"+firstMenuName);
	addNav(_menus[firstMenuName]);
	InitLeftMenu();
});*/

function loadMenu(data)
{
	addNav(data);
	InitLeftMenu();
}

function loadMenuCut(data)
{
	cutNav(data);
	cutInitLeftMenu();
}

function cutNav(data) {
	//shotmenu
	var menulistCut = "";
	$.each(data, function(i, sm) {
		menulistCut += '<div style="padding:5px;float: right; padding-right: 20px;">';
		menulistCut += '<a href="#" class="easyui-splitbutton" data-options="menu:'+sm.menuId+',iconCls:'icon-ok'">'+sm.menuName+'</a>';
		menulistCut += '</div>';
		$.each(sm.childMenu, function(j, o) {
			/*menulist += '<p><a style="text-decoration:none;" ref="' + o.id + '" href="#" rel="'
					+ o.url + '" >'
					+ '&nbsp;</span><span class="nav">' + o.name
					+ '</span></a></p> ';*/
			menulistCut +=' <div id="'+sm.menuId+'" style="width:150px;"> ';
			menulistCut +='<div class="cutmenu" data-options="iconCls:'icon-undo'"><a url="'+o.menuUrl+'"><span class="cm">'+o.menuName+'</span></a></div>';
			menulistCut += '</div>';
		});
		

		/*$('#wnav').accordion('add', {
			title : sm.name,
			<a href="#" class="easyui-splitbutton" data-options="menu:'#mm1',iconCls:'icon-edit'">ShortMenu1</a>
			content : menulist,style="padding:5px;float: right; padding-right: 20px;"
			iconCls : 'icon ' + sm.icon
		});*/

	});
	$("#shotmenu").html(menulistCut);
	
	/*var pp = $('#wnav').accordion('panels');
	var t = pp[0].panel('options').title;
	$('#wnav').accordion('select', t);*/

}

function cutInitLeftMenu()
{
	$('.cutmenu a').bind('click', function() {
		alert("testmenuclick");
		var tabTitle = $(this).children('.cm').text();
		alert("sundy_"+tabTitle);
		var url = $(this).attr("url");
		alert(url);
		//addTab(tabTitle, url, icon);
		/* var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = '';//getIcon(menuid, icon);
		alert("sundyByTabTitle_"+tabTitle);
		addTab(tabTitle, url, icon); */
		if (!$('#tabs').tabs('exists', tabTitle)) {
			$('#tabs').tabs('add', {
				title : tabTitle,
				href : url,//'test',//;createFrame(url),
				closable : true,
				icon : 'icon-ok'//icon
			});
		} else {
			$('#tabs').tabs('select', subtitle);
			$('#mm-tabupdate').click();
		}
	});
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
		var menulist = "";
		menulist += '<div>';
		$.each(sm.childMenu, function(j, o) {
			menulist += '<p><a style="text-decoration:none;" ref="' + o.id + '" href="#" rel="'
					+ o.url + '" >'
					+ '&nbsp;</span><span class="nav">' + o.name
					+ '</span></a></p> ';
		});
		menulist += '</div>';

		$('#wnav').accordion('add', {
			title : sm.name,
			content : menulist,
			iconCls : 'icon ' + sm.icon
		});

	});

	var pp = $('#wnav').accordion('panels');
	var t = pp[0].panel('options').title;
	$('#wnav').accordion('select', t);

}

// 初始化左侧
function InitLeftMenu() {
	
	//hoverMenuItem();

	$('#wnav p a').bind('click', function() {
		var tabTitle = $(this).children('.nav').text();

		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		var icon = '';//getIcon(menuid, icon);
		addTab(tabTitle, url, icon);
		//$('#wnav p ').removeClass("selected");
		//$(this).parent().addClass("selected");
	});

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
				if (m.menuid == menuid) {
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
	//tabClose();
}

function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	return s;
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
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}

// 本地时钟
function clockon() {
	var now = new Date();
	var year = now.getFullYear(); // getFullYear getYear
	var month = now.getMonth();
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minu = now.getMinutes();
	var sec = now.getSeconds();
	var week;
	month = month + 1;
	if (month < 10)
		month = "0" + month;
	if (date < 10)
		date = "0" + date;
	if (hour < 10)
		hour = "0" + hour;
	if (minu < 10)
		minu = "0" + minu;
	if (sec < 10)
		sec = "0" + sec;
	var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	week = arr_week[day];
	var time = "";
	time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu
			+ ":" + sec + " " + week;

	$("#bgclock").html(time);

	var timer = setTimeout("clockon()", 200);
}
