function getPermissions(name, value){
	var box = "";
	if(value == 0 || value == null){
		return box;
	}
	if(name == "Message"){
		if(value == 1 || value == 3 || value == 5 || value == 7 || value == 9 || value == 11 || value == 13 || value == 15){
			box += "<a href='#' id='reload"+name+"' class='easyui-linkbutton' iconCls='icon-reload' plain='true'>刷新</a>";
		}
		if(value == 2 || value == 3 || value == 6 || value == 7 || value == 10 || value == 11 || value == 14 || value == 15){
			box += "<a href='#' id='addUserMessage' class='easyui-linkbutton' iconCls='icon-add' plain='true'>发送用户消息</a>";
			box += "<a href='#' id='addGroupMessage' class='easyui-linkbutton' iconCls='icon-add' plain='true'>发送组消息</a>";
			box += "<a href='#' id='addBroadcastMessage' class='easyui-linkbutton' iconCls='icon-add' plain='true'>广播消息</a>";
		}
		if(value == 4 || value == 5 || value == 6 || value == 7 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='edit"+name+"' class='easyui-linkbutton' iconCls='icon-edit' plain='true'>修改</a>";
		}
		if(value == 8 || value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='delete"+name+"' class='easyui-linkbutton' iconCls='icon-remove' plain='true'>删除</a>";
		}
		return box;
	}
	
	if(name == "Group"){
		if(value == 1 || value == 3 || value == 5 || value == 7 || value == 9 || value == 11 || value == 13 || value == 15){
			box += "<a href='#' id='reload"+name+"' class='easyui-linkbutton' iconCls='icon-reload' plain='true'>刷新</a>";
			box += "<a href='#' id='process"+name+"' class='easyui-linkbutton' iconCls='icon-search' plain='true'>查看处理情况</a>";
		}
		if(value == 2 || value == 3 || value == 6 || value == 7 || value == 10 || value == 11 || value == 14 || value == 15){
			box += "<a href='#' id='add"+name+"' class='easyui-linkbutton' iconCls='icon-add' plain='true'>增加</a>";
		}
		if(value == 4 || value == 5 || value == 6 || value == 7 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='edit"+name+"' class='easyui-linkbutton' iconCls='icon-edit' plain='true'>修改</a>";
		}
		if(value == 8 || value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='delete"+name+"' class='easyui-linkbutton' iconCls='icon-remove' plain='true'>删除</a>";
		}
		return box;
	}
	
	if(name == "Sys"){
		if(value == 1 || value == 3 || value == 5 || value == 7 || value == 9 || value == 11 || value == 13 || value == 15){
			box += "<a href='#' id='detail" + name + "' class='easyui-linkbutton' iconCls='icon-ok' plain='true'>明细</a>";
		}
		if(value == 2 || value == 3 || value == 6 || value == 7 || value == 10 || value == 11 || value == 14 || value == 15){
			box += "<a href='#' id='add"+name+"' class='easyui-linkbutton' iconCls='icon-add' plain='true'>增加</a>";
		}
		if(value == 4 || value == 5 || value == 6 || value == 7 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='edit"+name+"' class='easyui-linkbutton' iconCls='icon-edit' plain='true'>修改</a>";
		}
		if(value == 8 || value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14 || value == 15){
			box += "<a href='#' id='delete"+name+"' class='easyui-linkbutton' iconCls='icon-remove' plain='true'>删除</a>";
		}
		return box;
	}
	
	if(value == 1 || value == 3 || value == 5 || value == 7 || value == 9 || value == 11 || value == 13 || value == 15){
		box += "<a href='#' id='reload"+name+"' class='easyui-linkbutton' iconCls='icon-reload' plain='true'>刷新</a>";
	}
	if(value == 2 || value == 3 || value == 6 || value == 7 || value == 10 || value == 11 || value == 14 || value == 15){
		box += "<a href='#' id='add"+name+"' class='easyui-linkbutton' iconCls='icon-add' plain='true'>增加</a>";
	}
	if(value == 4 || value == 5 || value == 6 || value == 7 || value == 12 || value == 13 || value == 14 || value == 15){
		box += "<a href='#' id='edit"+name+"' class='easyui-linkbutton' iconCls='icon-edit' plain='true'>修改</a>";
	}
	if(value == 8 || value == 9 || value == 10 || value == 11 || value == 12 || value == 13 || value == 14 || value == 15){
		box += "<a href='#' id='delete"+name+"' class='easyui-linkbutton' iconCls='icon-remove' plain='true'>删除</a>";
	}
	return box;
}

function getCheckbox(value, row){
	var box = "";
	if(row.pid == 100) return box;
	if(value == 0 || value == null){
		//添加角色页面初始化
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 1){
		//1 查询
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 2){
		//2 创建
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 3){
		//3 查询+创建
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 4){
		//4 修改
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 5){
		//5 查询+修改
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 6){
		//6 创建+修改
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 7){
		//7 查询+创建+修改
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 8){
		//8 删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 9){
		//9 查询+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 10){
		//10 创建+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 11){
		//11 查询+创建+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 12){
		//12 修改+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 13){
		//13 查询+修改+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else if(value == 14){
		//14 创建+修改+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}else{
		//15 查询+创建+修改+删除
		box = "<input type='checkbox' name='create' class='easyui-validatebox' value='2' checked='checked' id=\'create_"+row.menuId+"\' onclick='changeValue(\"create_\",\""+row.menuId+"\",\"2\",\""+row.operation+"\",\""+row.pid+"\")'/>增加"+
  			  "<input type='checkbox' name='update' class='easyui-validatebox' value='4' checked='checked' id=\'update_"+row.menuId+"\' onclick='changeValue(\"update_\",\""+row.menuId+"\",\"4\",\""+row.operation+"\",\""+row.pid+"\")'/>修改"+
  			  "<input type='checkbox' name='delete' class='easyui-validatebox' value='8' checked='checked' id=\'delete_"+row.menuId+"\' onclick='changeValue(\"delete_\",\""+row.menuId+"\",\"8\",\""+row.operation+"\",\""+row.pid+"\")'/>删除"+
  			  "<input type='checkbox' name='retrieve' class='easyui-validatebox' value='1' checked='checked' id=\'retrieve_"+row.menuId+"\' onclick='changeValue(\"retrieve_\",\""+row.menuId+"\",\"1\",\""+row.operation+"\",\""+row.pid+"\")'/>刷新";
	}
	return box;
}