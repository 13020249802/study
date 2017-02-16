$.extend($.fn.validatebox.defaults.rules, {
	minLength: {     
        validator: function(value, param){
            return value.length >= param[0];     
        },     
        message: '请输入最小{0}位字符.'    
    },
    maxLength: {     
        validator: function(value, param){     
            return param[0] >= value.length;     
        },     
        message: '请输入最大{0}位字符.'    
    },
    unnormal: {// 验证是否包含空格和非法字符
		validator : function(value) {
			if($.trim(value) == "") return false;
			else return true;
		},
		message : '不能只输入为空.'
	}
});

//显示日期，格式为：yyyy-MM-dd
function parseToDate(value) {  
    if (value == null || value == '') {  
        return undefined;   
    }  
    var dt;  
    if (value instanceof Date) {  
        dt = value;  
    }  
    else {  
        if (!isNaN(value)) {  
            dt = new Date(value);  
        }  
        else if (value.indexOf('/Date') > -1) {  
            value = value.replace(/\/Date(−?\d+)\//, '$1');  
            dt = new Date();  
            dt.setTime(value);  
        } else if (value.indexOf('/') > -1) {  
            dt = new Date(Date.parse(value.replace(/-/g, '/')));  
        } else {  
            dt = new Date(value);  
        }  
    }  
		 return dt;  
} 
//为Date类型拓展一个format方法，用于格式化日期  
Date.prototype.format = function (format) //author: meizz   
{  
    var o = {  
        "M+": this.getMonth() + 1, //month   
        "d+": this.getDate(),    //day   
        "h+": this.getHours(),   //hour   
        "m+": this.getMinutes(), //minute   
        "s+": this.getSeconds(), //second   
        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter   
        "S": this.getMilliseconds() //millisecond   
    };  
    if (/(y+)/.test(format))  
        format = format.replace(RegExp.$1,  
                (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(format))  
            format = format.replace(RegExp.$1,  
                    RegExp.$1.length == 1 ? o[k] :  
                        ("00" + o[k]).substr(("" + o[k]).length));  
    return format;  
};
