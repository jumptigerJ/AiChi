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
<link rel="stylesheet" href="<%=basePath %>resources/css/validform/style.css"  type="text/css" media="all"/>
<link rel="stylesheet" href="<%=basePath %>resources/css/validform/demo.css" rel="stylesheet" />
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/validform/Validform_v5.3.2_min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js" type="text/javascript" ></script>
<title>修改手机号</title>
<style>
.phoneform li{padding-bottom:20px;list-style-type:none}
.Validform_checktip{margin-left:10px;}
.phoneform .lab{display:inline-block; width:200px;}
.action{padding-left:92px;}
</style>
<script type="text/javascript">
$(function(){
		
	var demo=$(".phoneform").Validform({
		tiptype:3,
		label:".label",
		showAllError:true,
		datatype:{
			
		},
		ajaxPost:true,
		callback:function(data){
			console.log(data);
			if(data==false){
				setTimeout(function(){
					$.Hidemsg(); //公用方法关闭信息提示框;显示方法是$.Showmsg("message goes here.");
				},1000);
				$("#phoneid").html("原先号码不正确");
			}
		}
	});
	
	
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"m"
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"m"
	},
]);
	
})
</script>
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
	<div class="container" style="padding-left:200px;">
		<form class="form-horizontal phoneform" role="form" action="" method="post">
		   <ul>
		   	   <li>
		   	   	   <label class="lab" style="font-size:18px;"><span class="need">*</span> 原先绑定的手机号码：</label>
                   <input type="text"  name="oldphone" ajaxurl="editPhone" class="inputxt" />
		   	   </li>
		   	   <li>
		   	   	   <label class="lab" style="font-size:18px;"><span class="need">*</span> 新绑定的手机号码：</label>
                   <input type="text" value="" name="newphone" class="inputxt" />
		   	   </li>
		   </ul>
		   <div class="form-group">
		       <div class="col-sm-offset-2 col-sm-10">
		         <button type="submit" class="btn">确定</button>
		         <button class="btn" style="margin-left:50px">取消</button>
		       </div>
		   </div>
		</form>
	</div>
</body>
</html>