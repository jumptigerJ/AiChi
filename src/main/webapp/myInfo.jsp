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
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js" type="text/javascript" ></script>
<style>
.tname{
	font-family:"楷体";
	font-size:26px;
	padding-left:30px;
}
.hname{
	font-family:"宋体";
	font-size:28px;
}
</style>
<title>我的个人信息</title>
</head>
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
		    <%
		    	if(session.getAttribute("customer")==null){
		   			out.print("<a style='float:right;margin-right:10px;' href='buyerRegister.jsp'>用户注册</a><a href='buyerLogin.jsp' style='float:right;margin-right:10px;'>登录</a>");
		    	}
		    %>			 
	   	   
	        <a href="buyer_productList.jsp" style="float:right;margin-right:20px;">我的购物车</a>
	 
	        <li class="dropdown" style="float:right;margin-right:20px;list-style-type:none">
	        	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	        	我的AiChi
	        	</a>
	        	<ul class="dropdown-menu" role="menu">
	        		<li><a href="#">我的历史订单</a></li>
	        		<li><a href="#">我的个人信息</a></li>
	        	</ul>
	        </li>
	    </div>
	</nav>
	<div class="container">
		<table>
			<thead><td class="hname">您的基础信息</td></thead>
			<tbody>
				<tr>
					<td class="tname">会员名：</td><td class="tname"><%=session.getAttribute("customerName") %></td>
				</tr>
				<tr>
					<td class="tname">登录邮箱：</td><td class="tname"><%=session.getAttribute("email") %></td>
				</tr>
				<tr>
					<td class="tname">绑定手机：</td><td class="tname"><%=session.getAttribute("phone") %>***</td>
				</tr>
	
			</tbody>
		</table>
		<table>
			<thead><td class="hname">您的安全服务</td></thead>
			<tbody>
				<tr>
					<td class="tname">登录密码</td><td><a href="#">修改密码</a></td>		
				</tr>
				<tr>
					<td class="tname">绑定手机</td><td><a href="#">修改绑定手机</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>