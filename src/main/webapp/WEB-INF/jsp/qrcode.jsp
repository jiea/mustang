<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script type="javascript" src="../../static/js/jquery/jquery-1.11.3.min.js"></script>
    <script type="javascript" src="../../static/js/jquery/jquery.qrcode.min.js"></script>
    <script type="javascript">
        $(function(){
            var src = "我是jQuery生成的二维码";

               $("#qrcode").qrcode({
                   render: "table",
                   with: 200,
                   height: 200,
                   text: 'fsdfsd'
               });
        });
    </script>
    <title>jQuery 生成二维码</title>
</head>
<body>
    <input type="button" id="btn1" value="生成二维码">
    <div id="qrcode">11</div>
</body>
</html>
