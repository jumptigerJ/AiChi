<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>aichi铺</title>
</head>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/test.js" type="text/javascript" ></script>
<style>
#div{
	width:10px;
	height:80px;
}
</style>
<body onload="test('<%=basePath%>')">
    <div class="page-header">
       
   	    <a style="float:right;margin-right:10px;">用户注册</a><a href="buyerLogin.jsp" style="float:right;margin-right:10px;">登录</a>
        <a href="#" style="float:right;margin-right:10px;">我的购物车</a>
        <h1 style="margin-left:50px;margin-bottom:20px">AiChi铺</h1>
       
    </div>
    <div class="container">
	    <div class="row" id="box">
	    	<div class="col-md-1" style="height:1500px;margin-right:100px">菜单栏</div>
	        <div class="col-md-2" id="div" style="width:300px;height:320px;margin-bottom:30px;" >
				<div class="thumbnail">
	                <img src="<%= basePath%>resources/images/products/001.jpg" id="img" style="width:270;height:160px">
	                <div class="caption" style="text-align:center">
	                    <h3 id="title">天然紫薯</h3>
	                    <p id="price"> <span>￥</span>20</p>
	                    <p><a href="#" class="btn btn-primary" role="button">好吃</a><a href="#" class="btn btn-default" role="button">买我</a></p>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    
    

</body>
</html>