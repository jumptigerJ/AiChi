<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/test.js" type="text/javascript" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品页</title>
</head>
<style>
    #box {
        margin-bottom:20px;
    }
    #box {
        margin-top:20px;
        margin-bottom: 0;
    }
    [class*="col-"]{
        padding-top:15px;
        padding-bottom: 15px;
        background-color:#eee;
        background-color:rgba(86,61,124,.15);
        border:1px solid #ddd;
        border:1px solid rgba(86,61,124,.2);
    }

</style>
<script type="text/javascript">
	function loadProduct(id,basePath){
		var imgPath = basePath + "resources/images/products/";
		$.ajax({
			type:"POST",
			url:"loadProduct",
			dataType:"json", 
			data:{
				productId:id
			},
			success: function (data) {
				var product = data[0];
				$("#img").attr("src",imgPath+product.photo);
				$("#title").text(product.productName);
				$("#title1").text(product.productName);
				$("#price").html("<span>￥</span>"+product.price);
				$("#storeNum").text(product.num);
			}
		})
	}
</script>
<body onload="loadProduct('<%= request.getParameter("id") %>','<%=basePath %>')">
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
	  <div class="container">
	    <div class="row" id="box">
	        <div class="col-md-3 col-md-offset-2" style="height:300px;margin-right:50px;">
				<div class="thumbnail" >
	                <img src="" id="img" style="width:270;height:170px">
	                <div class="caption" style="text-align:center">
	             		<h4 id="title"></h4>
	                    <p id="price"></p>
	                </div>
	            </div>
	        </div>
	        <form action="receiver_info" method="post">
		        <div class="col-md-3" style="height:300px;width:380px;">
		           <div class="row">
	                    <div class="col-xs-12" style="text-align:center">
	                       <h2 id="title1"></h2>
	                    </div>
	                </div>
	    		    <div class="row">
	                    <div class="col-xs-6" style="height:60px">
	                     	   购买数量：
	                    </div>
	                    <div class="col-xs-6" style="height:60px">
	                        <input type="text" id="buyNum" name="buyNum" style="width:80px" name="buyNum">
	                    </div>
	                </div>
	                 <div class="row">
	                    <div class="col-xs-6"  style="height:60px">
	               			         库存：
	                    </div>
	                    <div class="col-xs-6" style="height:60px" id="storeNum" name="storeNum">
	
	                    </div>
	                </div>
	                <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
	                <input type="hidden" id="product" name="product" value="<%=request.getParameter("productName")%>">
	                <input type="hidden" name="price" value="<%=request.getParameter("price")%>">
	                <div class="row">
	                    <div class="col-xs-6"  style="height:60px">
	               			 <a id="addToCart" class="btn btn-primary" role="button" href="#">加入购物车</a>
	               		</div>
	                    <div class="col-xs-6" style="height:60px">
	                    	<button class="btn btn-default" type="submit">立即购买</button> 
	                    	<%if(request.getAttribute("needLogin")!=null&&(Integer)request.getAttribute("needLogin")==1){
	                    		out.print("<a href='buyerLogin.jsp'><font color='red'>请登录<font></a>");
	                    	}
	                    
	                    	%>      
	                    </div>
	                </div>
		        </div>
		    </form>
	    </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$("#addToCart").click(function(){
    			var num = $("#buyNum").val();
    			var productName = $("#product")[0].value;
    			$("#addToCart").attr("href","addToCart?productId=<%=request.getParameter("id")%>&price=<%=request.getParameter("price")%>&customerId=<%=session.getAttribute("customerId") %>&num="+num+"&productName="+productName+"");
    		})
    	})
    </script>
</body>
</html>