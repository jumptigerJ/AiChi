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
<title>收件信息</title>
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<link href="<%= basePath%>resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
</head>
<style>
	form{
		margin-top:150px;
		border:1px solid;
		width:500px;
		margin-left:400px;
		padding-left:60px;
	}
</style>
<script type="text/javascript">
	function orderSubmit(id,buyNum){

		alert(buyNum);
		$.ajax({
			type:"POST",
			url:"orderSubmit",
		    data:{
	
		    },
		    success:function(){
		    
		    },
		    error :function(){
		         alert("222");
		     },
	       complete:function(jqXHR,textStatus){
	     	  	console.log("textStatus:%s",textStatus);
	       }
		})

	}
</script>
<body>
<div class="navbar navbar-fixed-top">
       <div class="navbar-inner">
               <div class="container">
                   <button class="btn btn-navbar" data-toggle="collapse" data-target="#app-nav-top-bar">
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                   </button>
                   <a href="#" class="brand"><i class="icon-leaf">aichi铺</i></a>
                   <div id="app-nav-top-bar" class="nav-collapse">
                   </div>
               </div>
           </div>
       </div>
	   <form class="form-horizontal" role="form"  method="post">	
	        <div class="form-group" style="margin-top:20px">
	            <label class="col-sm-4 control-label">收件人姓名：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="receiver" name="receiver" style="height:30px;width:200px">
	            </div>
	        </div>
	        <div class="form-group">
	            <label class="col-sm-4 control-label">收件人地址：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="receiverAddress" name="receiverAddress" style="height:30px;width:200px">
	            </div>
	        </div>

	        <div class="form-group">
	            <label class="col-sm-4 control-label">收件人电话号码：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="receiverPhone" name="receiverPhone" style="height:30px;width:200px">
	            </div>
	        </div>
			
	        <div class="form-group">
	            <div class="col-sm-offset-4 col-sm-10">
	                <button type="submit" class="btn btn-default" onclick="orderSubmit('<%=request.getParameter("id") %>','<%=request.getParameter("buyNum")%>')">提交订单</button>
	            </div>
	        </div>
	  </form>

</body>
</html>