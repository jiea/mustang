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
	var _url = "${ctx}";
	var _menus;
	$(function(){
		loadMenu();
		initMenu();
	});
	// 加载左侧菜单 
	function loadMenu(){
		$.ajax({
			type : 'get',
			url : '${ctx}/menu/load',
			async : false,
			dataType : 'json',
			success : function(msg){
			     _menus = {"menus" : msg};
			},
			error : function(){
				alertSysErrMsg();
			}
		});
	}
	//初始化左侧菜单
	function initMenu() {
		$("#nav").accordion({animate:true});
	    $.each(_menus.menus, function(i, n) {
			var menulist ='';
			menulist +='<ul>';
	        $.each(n.children, function(j, o) {
	        	var url = _url + o.menuUrl;
				menulist += '<li>' +
								'<div>' +
									'<a ref="'+o.id+'" href="javascript:;" rel="'+url+'" ><span class="icon '+o.menuIcon+'" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="nav">' + o.nameZh + '</span></a>' +
						        '</div>' +
						     '</li>';
	        })
			menulist += '</ul>';
			$('#nav').accordion('add', {
	            title: n.nameZh,
	            content: menulist,
	            iconCls: 'icon '+n.menuIcon
	        });
	    });
	
		$('.easyui-accordion li a').click(function(){
			var title = $(this).children('.nav').text();
			var url = $(this).attr("rel");
			var id = $(this).attr("ref");
			var icon = getIcon(id);
			addTabs(title, icon, url);
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
	
	//获取左侧导航的图标
	function getIcon(id){
		var icon;
		$.each(_menus.menus, function(i, n) {
			 $.each(n.children, function(j, o) {
			 	if(o.id == id){
					icon = 'icon '+o.menuIcon;
				}
			 })
		})
		return icon;
	}
	
    $('#nav').accordion({
        animate:false
    });
	</script>
</body>
</html>