<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setAttribute("ctx", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mustang</title>
<link rel="shortcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico" />
<%@ include file="/WEB-INF/jsp/common/easyui.jsp"%>
</head>
<body class="easyui-layout">
	<div id="global-mask" style="position:absolute; top:0px; left:0px; width:100%; height:100%; background:#ccc; z-index:1000">
		<div id="global-mask-msg" style="position:absolute; top:50%; left:50%; margin:-30px 0px 0px -85px; text-align:center; border:2px solid #FF8901; width:auto; height:16px; line-height:16px; font-size:12px; padding:12px 5px 10px 30px; background: #fff url('static/js/jquery-easyui-1.5/themes/default/images/loading.gif') no-repeat scroll 5px center; font-weight:bold; color:#31B2F6;">正在处理，请稍待。。。</div>
	</div>
	<div data-options="region:'north', border:true" style="height: 65px; width: 100%">
		<%@ include file="/WEB-INF/jsp/layout/north.jsp"%>
	</div>
	<div data-options="region:'south', border:false" style="height: 30px; width: 100%">
		<%@ include file="/WEB-INF/jsp/layout/south.jsp"%>
	</div>
	<div data-options="region:'west', title:'导航菜单', split:true, border:true, iconCls:'icon icon-011'" style="width: 193px; overflow: auto;">
		<%@ include file="/WEB-INF/jsp/layout/west.jsp"%>
	</div>
	<div data-options="region:'center', border:true" style="overflow: hidden;">
		<%@ include file="/WEB-INF/jsp/layout/center.jsp"%>
	</div>
	<div id="menu" class="easyui-menu" data-options="onClick:menuHandler" style="width: 150px;">
		<div id="refresh" data-options="iconCls:'icon-008'">刷新</div>
		<div class="menu-sep"></div>
		<div id="closeCurrent" data-options="iconCls:'icon-004'">关闭当前标签</div>
		<div id="closeAll" data-options="iconCls:'icon-005'">关闭全部标签</div>
		<div id="closeOther" data-options="iconCls:'sdfs'">关闭其他标签</div>
		<div id="closeLeftAll" data-options="iconCls:''">关闭左侧标签</div>
		<div id="closeRightAll" data-options="iconCls:''">关闭右侧标签</div>
	</div>
	<script type="text/javascript" charset="UTF-8">
		var ctx = '${ctx}';
		var tree = $('#tree');
		var tabs = $('#tabs');
		var menu = $('#menu');
		var homeTitle = '首页';
		
		//Fires when parser finishing its parse action
		$.parser.onComplete = function() {
			removeMask();
		}
		
		// remove mask 
		function removeMask() {
			$("#global-mask").fadeOut("fast", function() {
				$(this).remove();
			});
		}

		$(function() {

			// init home tabs			
			initHomeTabs(ctx + '/home');

			// tabs onContextMenu
			tabs.tabs({
				onContextMenu : function(e, title, index) {
					tabs.tabs('select', title);
					// prevent default event
					e.preventDefault();
					if(title != homeTitle){
						menu.menu('show', {
							left : e.pageX,
							top : e.pageY
						}).data('tabTitle', title);
					}
				}
			});

		});

		// init home tabs
		function initHomeTabs(url) {
			tabs.tabs('addIframeTab', {
				tab : {
					title : homeTitle,
					iconCls : 'icon icon-007',
					tools : [ {
						iconCls : 'icon-027',
						handler : function() {
							tabs.tabs('refreshIframeTab', {
								which : homeTitle,
								iframe : {
									src : url
								}
							});
						}
					} ]
				},
				iframe : {
					src : url
				},

			});
		}

		// add or refresh tabs
		function addTabs(title, icon, url) {
			if (tabs.tabs('exists', title)) {
				tabs.tabs('select', title);
				tabs.tabs('refreshIframeTab', {
					which : title,
					iframe : {
						src : url
					}
				});
			} else {
				tabs.tabs('addIframeTab', {
					tab : {
						title : title,
						closable : true,
						iconCls : icon,
						// 此content只用于右键刷新时获取url
						content : url
					},
					iframe : {
						src : url
					}
				});
			}
		}

		//refresh tabs
		function refreshTabs(title, url) {
			tabs.tabs('refreshIframeTab', {
				which : title,
				iframe : {
					src : url
				}
			});
		}

		// close tabs
		function closeTabs(title) {
			tabs.tabs('close', title);
		}

		// menu onClick
		function menuHandler(item) {
			contextMenuHandler(item.id);
		}

		// tabs contextMenu handler
		function contextMenuHandler(action) {
			var allTabs = tabs.tabs('tabs');
			var currentTab = tabs.tabs('getSelected');
			var allTabsTitle = [];
			$.each(allTabs, function(i, n) {
				allTabsTitle.push($(n).panel('options').title);
			});
			switch (action) {
			case 'refresh':
				var title = currentTab.panel('options').title;
				var url = currentTab.panel('options').content;
				refreshTabs(title, url);
				break;
			case 'closeCurrent':
				var title = currentTab.panel('options').title;
				closeTabs(title);
				break;
			case 'closeAll':
				$.each(allTabsTitle, function(i, n) {
					if (n != homeTitle) {
						closeTabs(n);
					}
				});
				break;
			case 'closeOther':
				var title = currentTab.panel('options').title;
				$.each(allTabsTitle, function(i, n) {
					if (n != title && n != homeTitle) {
						closeTabs(n);
					}
				});
				break;
			case 'closeLeftAll':
				var tabIndex = tabs.tabs('getTabIndex', currentTab);
				if (tabIndex == 1) {
					return false;
				}
				$.each(allTabsTitle, function(i, n) {
					if (i < tabIndex) {
						if (n != homeTitle) {
							closeTabs(n);
						}
					}
				});
				break;
			case 'closeRightAll':
				var tabIndex = tabs.tabs('getTabIndex', currentTab);
				if (tabIndex == allTabs.length - 1) {
					return false;
				}
				$.each(allTabsTitle, function(i, n) {
					if (i > tabIndex) {
						if (n != homeTitle) {
							closeTabs(n);
						}
					}
				});
				break;
			}
		}
	</script>
</body>
</html>