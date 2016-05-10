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
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
</head>
<style>
	form{
		margin-top:150px;
		border:1px solid;
		width:500px;
		margin-left:400px;
		padding-left:60px;
		padding-top:20px;
	}
</style>
<script type="text/javascript">
	function orderSubmit(id,productName,price,buyNum){
		var receiver = $("input[name='receiver']").val();
		var receiverAddress = $("input[name='receiverAddress']").val();
		var receiverPhone = $("input[name='receiverPhone']").val();
		var remark = $("input[name='remark']").val();
		var productName = productName;
		var price = price;
		var productId = id;
		var num = buyNum;
		
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
			remark:remark
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
		<form class="form-horizontal" role="form" method="post">
	        
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
	       	<div class="form-group">
	            <div class="col-sm-offset-4 col-sm-10">
	                <button onclick="orderSubmit(<%=request.getParameter("id") %>,'<%=request.getParameter("product")%>',<%=request.getParameter("price") %>,<%=request.getParameter("buyNum") %>)">提交订单</button>              
	            </div>
	        </div>
	 </form>
	  

</body>
</html>