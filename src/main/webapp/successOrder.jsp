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
<title>订单成功</title>
</head>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<body>
<nav class="navbar navbar-default" role="navigation">
	    <div class="navbar-header">
	    	<%
	    		if(session.getAttribute("customer")!=null){
	    			out.print("<a href='#' style='margin-left:20px'><font size='4' color='#FF0000'>HI,"+session.getAttribute("customerName")+"</font></a>");
	    		}
	    	%>
	    	<a href="index.jsp"><h1 style="margin-left:50px;margin-bottom:20px">AiChi铺</h1></a>
	    </div>
	    <div >			 
	   	    <a style="float:right;margin-right:10px;" href="buyerRegister.jsp">用户注册</a><a href="buyerLogin.jsp" style="float:right;margin-right:10px;">登录</a>
	        <a href="#" style="float:right;margin-right:10px;">我的购物车</a>
	    </div>
	</nav>
<div style="margin-top:100px;text-align:center;font-weight:2;font-size:30px">订单成功，<a href="index.jsp">返回店铺首页</a></div>
</body>
</html>