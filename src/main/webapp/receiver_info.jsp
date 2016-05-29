<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
    

 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收件信息</title>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js" type="text/javascript" ></script>
</head>
<style>
	form{
		margin-top:40px;
		border:1px solid;
		width:500px;
		margin-left:400px;
		padding-left:60px;
		padding-top:20px;
	}
</style>
<script type="text/javascript">
	function orderSubmit(id,productName,price,buyNum,customerId){
		var receiver = $("input[name='receiver']").val();
		var receiverAddress = $("input[name='receiverAddress']").val();
		var receiverPhone = $("input[name='receiverPhone']").val();
		var remark = $("input[name='remark']").val();
		var productName = productName;
		var price = price;
		var productId = id;
		var num = buyNum;
		var customerId = customerId;
		
		$.ajax({
		type:"POST",
		url:"orderSubmit",
		async: false,  
	    data:{
	    	receiver:receiver,
			receiverAddress:receiverAddress,
			receiverPhone:receiverPhone,
			productId:productId,
			productName:productName,
			totalPay:price,
			num:num,
			remark:remark,
			customerId:customerId
	    },
	    success:function(){
	    
	    },
	    error :function(){
	         alert("222");
	     },
       complete:function(jqXHR,textStatus){
     	  	console.log("textStatus:%s",textStatus);
       }
	});
}
</script>
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
	   	   
	        <a href="myCart.jsp" style="float:right;margin-right:20px;">我的购物车</a>
	 
	        <li class="dropdown" style="float:right;margin-right:20px;list-style-type:none">
	        	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	        	我的AiChi
	        	</a>
	        	<ul class="dropdown-menu" role="menu">
	        		<li><a href="myOrder.jsp">我的历史订单</a></li>
	        		<li><a href="myInfo.jsp">我的个人信息</a></li>
	        	</ul>
	        </li>
	    </div>
	</nav>
		<form class="form-horizontal" role="form" action="orderSubmit" method="post">
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">收件人姓名：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" name="receiver" style="height:30px;width:200px"/>
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">收件人地址：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" name="receiverAddress"  style="height:30px;width:200px">
	            </div>
	        </div>
	        
	       <div class="form-group">
	            <label class="col-sm-4 control-label">收件人电话号码：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" name="receiverPhone"  style="height:30px;width:200px">
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">备注：</label>
	            <div class="col-sm-4">
	                <input type="textarea" class="form-control" name="remark"  style="width:200px">
	            </div>
	        </div>
	        <input type="hidden" name="customerId" value="<%=session.getAttribute("customerId") %>">
	        <input type="hidden" name="productId" value="<%=request.getParameter("id") %>">
	        <input type="hidden" name="productName" value="<%=request.getParameter("product")%>">
	        <input type="hidden" name="num" value="<%=request.getParameter("buyNum") %>">
	        <!--  
	        <%=session.getAttribute("customerId") %>
	        <%=request.getParameter("id") %>
	        <%=request.getParameter("product")%>
	        <%=request.getParameter("buyNum") %>    
	        onclick="orderSubmit(<%=request.getParameter("id") %>,'<%=request.getParameter("product")%>',<%=request.getParameter("price") %>,<%=request.getParameter("buyNum") %>,<%=session.getAttribute("customerId") %>)"
	        -->
	       	<div class="form-group">
	            <div class="col-sm-offset-4 col-sm-10">
	                <button type="submit">提交订单</button>              
	            </div>
	        </div>
	 </form>
	  
</body>
</html>