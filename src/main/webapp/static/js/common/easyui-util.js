// 将form表单元素的值序列化成对象
function serializeForm(form) {
	var o = {};
	$.each(form.serializeArray(), function() {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

// 清空
function clearForm(datagrid) {
	// 清空textbox
	$('[id$="Search"] input[class^=easyui-textbox]').each(function() {
		$('#' + $(this).attr('id')).textbox('setValue', '');
	});

	// 清空datebox
	$('[id$="Search"] input[class^=easyui-datebox]').each(function() {
		$('#' + $(this).attr('id')).textbox('setValue', '');
	});

	// 清空datetimebox
	$('[id$="Search"] input[class^=easyui-datetimebox]').each(function() {
		$('#' + $(this).attr('id')).textbox('setValue', '');
	});
	datagrid.datagrid('load', {});
	datagrid.datagrid('clearSelections');
	datagrid.datagrid('clearChecked');
}

// 提示信息show
function showMsgSlide(msg) {
	$.messager.show({
		title : '提示信息',
		msg : msg,
		timeout : 5000,
		showType : 'slide'
	});
}
// 处理成功
function showSuccessMsgSlide(){
	$.messager.show({
		title : '提示信息',
		msg : '处理成功',
		timeout : 5000,
		showType : 'slide'
	});
}

// 提示信息alert msgType可用值:error,question,info,warning
function alertMsg(msg, msgType) {
	$.messager.alert('提示信息', msg, msgType);
}

// 系统错误提示信息
function alertSysErrMsg() {
	$.messager.alert('提示信息', '系统异常, 请联系管理员', 'error');
}

// 数据是否重复
function hasRepeat(url, val, id){
	var flag = true;
	$.ajax({
		url : url,
		type : 'post',
		data : {val : val, id : id},
		dataType : 'json',
		async : false,
		success : function(data) {
            flag = data.success;
            if(!data.success){
                alertMsg(data.msg, 'error');
            }
		}
	});
	return flag;
}

// 关闭Dialog
function closeDialog(dialog){
	dialog.dialog('close');
}

// 加载dialog内容，淡入效果
function dialogEffect(id){
    $('#'+id+'').fadeIn('slow', function() {
        $(this).show();
    });
}