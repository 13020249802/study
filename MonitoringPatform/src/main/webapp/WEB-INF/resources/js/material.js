$(function(){
	$('#subjectBtn').on('click',function() {
		
		comOpenDialog($('#showSubChildDiv'), $('#sysdg'), 1000, 800, 'S001');
	});
	
	$('#gradeBtn').on('click',function() {
		
		comOpenDialog($('#showSubChildDiv'), $('#sysdg'), 1000, 800, 'S003');
	});
	
	function comOpenDialog(container, dg, width, height, param){
		
		var url = '/shiro/sysList?code=' + param
		container.dialog({
		    title: 'system data list',
		    width: width,
		    height: height,
		    closed: false,
		    cache: false,
		    href: url,
		    modal: true,
		    buttons:[{
				text:'OK',
				handler:function(){
					var dict_CD = null, code = null;
					var row = dg.datagrid('getSelected');
					if(row!=null)dict_CD=row["dict_CD"];code=row["code"];
					alert(dict_CD +"--" + code);
					if(code != null && code=='S001')$('#subject_CD').val(code);
					if(code != null && code=='S003')$('#grade_CD').val(code);
					container.dialog('close'); 
				}
			}]
		});
	}
})