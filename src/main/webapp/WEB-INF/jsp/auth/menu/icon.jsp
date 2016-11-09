<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
<style type="text/css">
    .kuang {
        width: 100%;
    }
    .kuang ul li {
        float: left;
        list-style: none;
        width: 60px;
        text-align: center;
        margin-bottom: 20px;
    }
    .kuang ul a {
        float: left;
        color: #333;
        margin: 0 10px;
        padding: 10px 0 10px 0;
        display: block;
        width: 59px;
        height: 40px;
    }
    .kuang ul a:hover {
        background: #ebf3fd;
    }
    .kuang ul li p {
        margin: 0 auto;
        height: 22px;
        line-height: 22px;
    }
    .kuang .img {
        width: 16px;
        height: 16px;
    }
</style>
<script type="text/javascript">
    $(function(){
        $("a li").dblclick(function(){
            var icon = $(this).text();
            $("#menuIcon").textbox('setValue', icon);
            iconDialog.dialog('close');
        });
    });
</script>
<div class="kuang">
    <ul>
        <a href="#"><li><img class="img icon icon-001"><p>icon-001</p></li></a>
        <a href="#"><li><img class="img icon icon-002"><p>icon-002</p></li></a>
        <a href="#"><li><img class="img icon icon-003"><p>icon-003</p></li></a>
        <a href="#"><li><img class="img icon icon-004"><p>icon-004</p></li></a>
        <a href="#"><li><img class="img icon icon-005"><p>icon-005</p></li></a>
        <a href="#"><li><img class="img icon icon-006"><p>icon-006</p></li></a>
        <a href="#"><li><img class="img icon icon-007"><p>icon-007</p></li></a>
        <a href="#"><li><img class="img icon icon-008"><p>icon-008</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/disk.png"><p>icon-009</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/okay.png"><p>icon-011</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/cancel.png"><p>icon-013</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/cancel_1.png"><p>icon-014</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/search.png"><p>icon-016</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/print.png"><p>icon-017</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/help.png"><p>icon-018</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/remove_tabsall.png"><p>icon-019</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/expand.png"><p>icon-020</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/collapse.png"><p>icon-021</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/sum.png"><p>icon-022</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/menu_tree.png"><p>icon-024</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/key_go.png"><p>icon-028</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/user_disuse.png"><p>icon-033</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/user_enabled.png"><p>icon-034</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/user_pwd_reset.png"><p>icon-035</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/wrench_orange.png"><p>icon-037</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/star.png"><p>icon-038</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/stop.png"><p>icon-039</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/sitemap_color.png"><p>icon-040</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/flag_red.png"><p>icon-041</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/email.png"><p>icon-042</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/email_go.png"><p>icon-043</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/email_open.png"><p>icon-044</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/cog.png"><p>icon-045</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/chart_pie.png"><p>icon-046</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/chart_curve.png"><p>icon-047</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/chart_bar.png"><p>icon-048</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/chart_organisation.png"><p>icon-049</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/bell.png"><p>icon-050</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/application_view_icons.png"><p>icon-051</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/calculator.png"><p>icon-052</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/connect.png"><p>icon-053</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/cross.png"><p>icon-054</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/database_refresh.png"><p>icon-055</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/download.png"><p>icon-057</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/upload.png"><p>icon-058</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/gem_options.png"><p>icon-059</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/group_blue.png"><p>icon-060</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/information.png"><p>icon-061</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/clock.png"><p>icon-063</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/page_white_acrobat.png"><p>icon-069</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/page_word.png"><p>icon-070</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/page_white_excel.png"><p>icon-071</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/application.png"><p>icon-072</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/book.png"><p>icon-075</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/out.png"><p>icon-079</p></li></a>
        <a href="#"><li><img class="img" src="${ctx}/static/js/jquery-easyui-1.4.2/themes/icons/heart.png"><p>icon-080</p></li></a>
    </ul>
</div>
</body>
