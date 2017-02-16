<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp"%>
<div style="padding: 30px 60px 40px 60px">
	<form id="editSystemInfoForm" method="post">
		<input style="width: 200px;" value="${systemInfo.id}" type="hidden" name="id"></input>
		<table cellpadding="6" style="margin: auto;" class="form-tr">
			<tr>
				<td>系统类型:</td>
				<td><select class="easyui-combobox" style="width: 200px;" name="systemType" data-options="panelHeight:'auto'">
						<option value="1" <c:if test="${systemInfo.systemType == '1'}">selected="selected"</c:if>>业务系统</option>
						<option value="2" <c:if test="${systemInfo.systemType== '2'}">selected="selected"</c:if>>其他系统</option>
				</select></td>
			</tr>
			<tr>
				<td>系统信息:</td>
				<td><input class="easyui-textbox easyui-validatebox" style="width: 200px;" value="${systemInfo.systemInfo}" type="text" name="systemInfo" data-options="required:true,validType:'unnormal'"></input></td>
			</tr>
			<tr>
				<td>系统IP:</td>
				<td><input class="easyui-textbox easyui-validatebox" style="width: 200px;" value="${systemInfo.systemIp}" type="text" name="systemIp" data-options="required:true,validType:'unnormal'"></input></td>
			</tr>
			<tr>
				<td>监控地址:</td>
				<td><input class="easyui-textbox easyui-validatebox" style="width: 200px;" value="${systemInfo.monitoringUrl}" name="monitoringUrl" data-options="required:true,validType:'unnormal'"></input></td>
			</tr>
		</table>
	</form>
</div>
</div>