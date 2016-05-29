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
<script type="text/javascript">
function myOrder(){
	var customerId = $("#myCustomerId")[0].value;
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "myOrder", 
		 data:{  
			 customerId:customerId
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productEdit' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productDelete' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
				 row.find("#orderId").text(data[i].orderId); 
				 row.find("#productName").text(data[i].productName); 
				 row.find("#num").text(data[i].num); 
				 row.find("#remark").text(data[i].remark);  
				 row.find("#receiver").text(data[i].receiver);  
				 row.find("#orderTime").text(data[i].orderTime);

				 //将新行添加到表格中  
				 row.appendTo("#table");  
			}  
			
		 },
		 error :function(data){
	         alert("222");
	     },
        complete:function(jqXHR,textStatus){
      	  	console.log("textStatus:%s",textStatus);
        }
	 });	
}

</script>
<title>我的订单</title>
</head>
<body onload="myOrder()">
	<input type="hidden" id="myCustomerId" value="<%=session.getAttribute("customerId")%>">
	<nav class="navbar navbar-default" role="navigation">
	    <div class="navbar-header">
	    	<%
	    		if(session.getAttribute("customer")!=null){
	    			out.print("<a href='#' style='margin-left:20px'><font size='4' color='#FF0000'>HI,"+session.getAttribute("customerName")+"</font></a>");
	    		}
	    	%>
	    	<a href="index.jsp"><h1 style="margin-left:50px;margin-bottom:20px">AiChi铺</h1></a>
	    </div>
	 
	    <div>
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
		<table class="table table-striped table-bordered" id="table">
			<thead id="tem">
				<th id="orderId" width="20%">订单号</th>
				<th id="productName" width="20%">产品名字</th>
				<th id="num" width="10%">购买数量</th>
				<th id="remark" width="15%">备注</th>
				<th id="receiver" width="15%">收件人</th>
				<th id="orderTime" width="20%">订单时间</th>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>