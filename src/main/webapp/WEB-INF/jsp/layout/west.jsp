<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>west</title>
</head>
<body>
	<div id="nav" class="easyui-accordion" fit="true" border="false"></div>
	<script type="text/javascript">
	var _url = "${app}";
	var _menus;
	
	// 加载左侧菜单 
	function loadMenu(){
		$.ajax({
			type : 'post',
			url : '${app}/menu/load.shtml',
			async : false,
			dataType : 'json',
			success : function(msg){
			     _menus = {"menus" : msg};
			},
			error : function(msg){
				alertSysErrMsg();
			}
		});
	}
	
	//初始化左侧菜单
	function initMenu() {
		$("#nav").accordion({animate:false});
	    $.each(menus.menus, function(i, n) {
			var menulist ='';
			menulist +='<ul>';
	        $.each(n.menus, function(j, o) {
	        	url = _url + o.url;
				menulist += '<li><div><a ref="'+o.menuid+'" href="#" rel="' + url + '" ><span class="icon '+o.icon+'" >&nbsp;</span><span class="nav">' + o.menuname + '</span></a></div></li> ';
	        })
			menulist += '</ul>';
			$('#nav').accordion('add', {
	            title: n.menuname,
	            content: menulist,
	            iconCls: 'icon ' + n.icon
	        });
	    });
	    
	    
	
		$('.easyui-accordion li a').click(function(){
			var tabTitle = $(this).children('.nav').text();
	
			var url = $(this).attr("rel");
			var menuid = $(this).attr("ref");
			var icon = getIcon(menuid,icon);
			createTab(url,tabTitle);
			$('.easyui-accordion li div').removeClass("selected");
			$(this).parent().addClass("selected");
		}).hover(function(){
			$(this).parent().addClass("hover");
		},function(){
			$(this).parent().removeClass("hover");
		});
	
		//选中第一个
		var panels = $('#nav').accordion('panels');
		var t = panels[0].panel('options').title;
	    $('#nav').accordion('select', t);
	}
	
    $('#nav').accordion({
        animate:false
    });
	</script>
</body>
</html>