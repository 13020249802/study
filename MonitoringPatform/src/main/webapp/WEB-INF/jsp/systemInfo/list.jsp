<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp"%>
<table id="systemInfoDG" class="" style="width:100%">
</table>
<div id="systemInfoTB" style="padding:5px;height:auto">
	<div id="systemInfoDIV" style="margin-bottom: 5px" data-options="split:true" class="panel-header">
		<a href="#" id="addSystemInfo" class="easyui-linkbutton" iconCls="icon-add" plain="true">增加</a>
		<a href="#" id="editSystemInfo" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="#" id="deleteSystemInfo" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="#" id="reloadSystemInfo" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
	</div>
	<div>
		<from id="systemInfoQueryFrom" class="queryForm" method="post">
			<label class="searchTitle">系统类型:</label>
			<select class="easyui-combobox" style="width: 200px;" name="systemInfo_systemType" data-options="panelHeight:'auto'">
				<option value="" >所以系统</option>
				<option value="1" >业务系统</option>
				<option value="2" >其他系统</option>
			</select>
			<label class="searchTitle">系统IP:</label>
			<input class="easyui-textbox" name="systemInfo_systemIp" style="width:180px;"/>
		</from>
		<a href="#" id="searchSystemInfoList" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	</div>
</div>
<div id="showSystemInfoDiv"></div>
<script type="text/javascript">
	$(function(){
		$('#systemInfoDG').datagrid({
			async:true,
			url:'${rootUrl}reloadSystemInfoList',
			singleSelect:true,
			pagination:true,
			collapsible:true,
			pageSize:10,
			fit: true,
			method:"post",
			toolbar:"#systemInfoTB",
			columns:[[
					  {field:"id",title:"序号",width:150,align:'center',hidden:true },
					  {field:"systemType",title:"系统类型",width:180,align:'center',formatter:function(value){
			        	  if(value==1){
			        		  return "业务系统";
			        	  }else if(value==2){
			        		  return "其他系统";
			        	  }
			          }},
			          {field:"systemIp",title:"系统IP",width:180,align:'center'},
			          {field:"systemInfo",title:"系统说明",width:200,align:'center'},
			          {field:"monitoringUrl",title:"监控地址",width:420,align:'left'},
			          {field:"systemStatus",title:"状态",width:80,align:'center',formatter:function(value){
			        	  if(value==1){
			        		  return "正常";
			        	  }else{
			        		  return "异常";
			        	  }
			          }},
			          {field:"updateDateStr",title:"更新时间",width:180,align:'center'}
			          ]],
			onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
				var responseData = eval('(' + XMLHttpRequest.responseText + ')');
				$.messager.alert('错误',responseData.respMsg,'error');
			},
	        onDblClickRow: function (index, row) {
				showDetail(row);
	         }
		})
		
		function showDetail(row){
			var entityId = 0;
			var row = $('#systemInfoDG').datagrid('getSelected');
			if(row!=null)entityId=row["id"];
			if(entityId==0)
			{
				$.messager.alert('提示','请选择数据!','info');
				return false;
			}
			$('#showSystemInfoDiv').dialog({
			    title: '系统用户信息',
			    width:  800,
			    height: 600,
			    closed: false,
			    cache: false,
			    href: '${rootURL}showSystemInfo?entityId='+entityId,
			    modal: true,
			    buttons:[{
			    	text:'关闭',
			    	iconCls:'icon-clear',
					handler:function(){
						$('#showSystemInfoDiv').empty();
						$('#showSystemInfoDiv').dialog('close'); 
					}
			    }]
			});
		}
		
		//查询系统用户列表
		$('#searchSystemInfoList').click(function(){
			var queryParams = $("#systemInfoDG").datagrid('options').queryParams;
			queryParams.systemType = $("input[name='systemInfo_systemType']").val();
			queryParams.systemIp = $("input[name='systemInfo_systemIp']").val();
			$("#systemInfoDG").datagrid('options').queryParams = queryParams;
			$("#systemInfoDG").datagrid('reload');
		});
		
		//添加系统用户
		$('#addSystemInfo').click(function() {
			$('#showSystemInfoDiv').dialog({
			    title: '新增系统用户',
			    width:  500,
			    height: 300,
			    closed: false,
			    cache: false,
			    href: '${rootURL}addSystemInfo',
			    modal: true,
			    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						var isValid = $("#editSystemInfoForm").form('validate');
						if(!isValid) return false;
						var form = $('#editSystemInfoForm').serialize(); 
						$.post('${rootURL}saveSystemInfo',form,function(data){
			        		$.messager.alert('提示',data.mes,'info');
			        		$("#systemInfoDG").datagrid('reload');
			        	});  
						$('#showSystemInfoDiv').empty();
						$('#showSystemInfoDiv').dialog('close');
					}
				},{
					text:'关闭',
					iconCls:'icon-clear',
					handler:function(){$('#showSystemInfoDiv').dialog('close'); }
				}]
			});
		});
		
		//编辑系统用户
		$('#editSystemInfo').click(function() {
			var entityId = 0;
			var row = $('#systemInfoDG').datagrid('getSelected');
			if(row!=null)entityId=row["id"];
			if(entityId==0)
			{
				$.messager.alert('提示','请选择数据!','info');
				return false;
			}
			$('#showSystemInfoDiv').dialog({
			    title: '修改系统用户信息',
			    width:  800,
			    height: 600,
			    closed: false,
			    cache: false,
			    href: '${rootURL}editSystemInfo?entityId='+entityId,
			    modal: true,
			    buttons:[{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						var isValid = $("#editSystemInfoForm").form('validate');
						if(!isValid) return false;
						var form = $('#editSystemInfoForm').serialize();
						$.post('${rootURL}saveSystemInfo',form,function(data){
			        		$.messager.alert('提示',data.mes,'info');
			        		$('#systemInfoDG').datagrid('reload');
			        	});
						$('#showSystemInfoDiv').empty();
						$('#showSystemInfoDiv').dialog('close'); 
					}
				},{
					text:'关闭',
					iconCls:'icon-clear',
					handler:function(){$('#showSystemInfoDiv').dialog('close'); }
				}]
			});
		});
		//删除系统用户
		$('#deleteSystemInfo').click(function() {
			var entityId = 0;
			var row = $('#systemInfoDG').datagrid('getSelected');
			if(row!=null)entityId=row["id"];
			if(entityId==0)
			{
				$.messager.alert('提示','请选择数据!','info');
				return false;
			}
			$.messager.confirm('提示','你确定要删除?',function(yes){
				if(yes){
					$.ajax({
						url: '${rootURL}deleteSystemInfo?entityId='+entityId,
					    title: 'delete systemInfo',
					    width: 200,
					    height: 100,
					    closed: false,
					    cache: false,
					    modal: true,
					    error: function(XMLHttpRequest, textStatus, errorThrown) {
							var responseData = eval('(' + XMLHttpRequest.responseText + ')');
							$.messager.alert('错误',responseData.respMsg,'error');
						},
					    success : function(data) {
					    	$.messager.alert('提示',data.mes,'info');
					    	$("#systemInfoDG").datagrid('reload');
						}
					});
				}
				
			});
			
		});
		
		//刷新系统用户信息
		$('#reloadSystemInfo').click(function() {
			$("#systemInfoDG").datagrid('reload');
		})
		
	})
</script>