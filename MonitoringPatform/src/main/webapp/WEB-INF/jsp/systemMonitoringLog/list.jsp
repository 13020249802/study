<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp"%>
<table id="systemMonitoringLogDG" class="" style="width:100%">
</table>
<div id="systemMonitoringLogTB" style="padding:5px;height:auto">
	<div id="systemMonitoringLogDIV" style="margin-bottom: 5px" data-options="split:true" class="panel-header">
		<a href="#" id="reloadSystemMonitoringLog" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
	</div>
	<div>
		<from id="systemMonitoringLogQueryFrom" class="queryForm" method="post">
			<label class="searchTitle">系统类型:</label>
			<select class="easyui-combobox" style="width: 200px;" name="systemMonitoringLog_systemType" data-options="panelHeight:'auto'">
				<option value="" >所以系统</option>
				<option value="1" >业务系统</option>
				<option value="2" >其他系统</option>
			</select>
			<label class="searchTitle">系统IP:</label>
			<input class="easyui-textbox" name="systemMonitoringLog_systemIp" style="width:180px;"/>
		</from>
		<a href="#" id="searchSystemMonitoringLogList" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
	</div>
</div>
<div id="showSystemMonitoringLogDiv"></div>
<script type="text/javascript">
	$(function(){
		$('#systemMonitoringLogDG').datagrid({
			async:true,
			url:'${rootUrl}reloadSystemMonitoringLogList',
			singleSelect:true,
			pagination:true,
			collapsible:true,
			pageSize:10,
			fit: true,
			method:"post",
			toolbar:"#systemMonitoringLogTB",
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
			var row = $('#systemMonitoringLogDG').datagrid('getSelected');
			if(row!=null)entityId=row["id"];
			if(entityId==0)
			{
				$.messager.alert('提示','请选择数据!','info');
				return false;
			}
			$('#showSystemMonitoringLogDiv').dialog({
			    title: '系统用户信息',
			    width:  800,
			    height: 600,
			    closed: false,
			    cache: false,
			    href: '${rootURL}showSystemMonitoringLog?entityId='+entityId,
			    modal: true,
			    buttons:[{
			    	text:'关闭',
			    	iconCls:'icon-clear',
					handler:function(){
						$('#showSystemMonitoringLogDiv').empty();
						$('#showSystemMonitoringLogDiv').dialog('close'); 
					}
			    }]
			});
		}
		
		//查询系统用户列表
		$('#searchSystemMonitoringLogList').click(function(){
			var queryParams = $("#systemMonitoringLogDG").datagrid('options').queryParams;
			queryParams.systemType = $("input[name='systemMonitoringLog_systemType']").val();
			queryParams.systemIp = $("input[name='systemMonitoringLog_systemIp']").val();
			$("#systemMonitoringLogDG").datagrid('options').queryParams = queryParams;
			$("#systemMonitoringLogDG").datagrid('reload');
		});
		
		//刷新系统用户信息
		$('#reloadSystemMonitoringLog').click(function() {
			$("#systemMonitoringLogDG").datagrid('reload');
		})
		
	})
</script>