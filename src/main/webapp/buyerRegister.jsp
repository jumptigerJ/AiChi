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
<title>买家注册</title>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<link href="<%= basePath%>resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>resources/css/date/BeatPicker.min.css">
<link rel="stylesheet" href="<%=basePath %>resources/css/date/demos.css">
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/date/BeatPicker.min.js" type="text/javascript" ></script>
</head>
<style>
	form{
		margin-top:100px;
		border:1px solid;
		width:500px;
		margin-left:400px;
	}
</style>
<script type="text/javascript">
function register(){
	var customerName = $("input[name='customerName']").val();
	var email = $("input[name='email']").val();
	var sex = $("#sex option=selected").text();
	var email = $("input[name='email']")
	
	
	
} 

	
</script>
<body>
	  <form class="form-horizontal" role="form" action="buyerLogin" method="post">
		<fieldset>
			<legend>
			     <div class="form-group">
	            <label class="col-sm-4 control-label">买家注册</label>
	        </div>
			</legend>
	
	        <div class="form-group">
	            <label class="col-sm-4 control-label" >用戶名：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="username" name="customerName" style="height:30px">
	            </div>
	        </div>
	        <div class="form-group">
	            <label class="col-sm-4 control-label">邮箱：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="email" name="email" style="height:30px">
	            </div>
	        </div>
		    <div class="form-group">
	            <label class="col-sm-4 control-label">性别：</label>
	            <div class="col-sm-4">
	               <select id="sex" style="width:150px">
	               		<option selected>男</option>
	               		<option>女</option>
	               </select>
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">出生年月：</label>
	            <div class="col-sm-6">
                    <div>
			            <input type="text" data-beatpicker="true"/ style="width:100px;height:30px">
			        </div>
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">电话号码：</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" placeholder="phone" name="phone" style="height:30px">
	            </div>
	        </div>
	        
	        <div class="form-group">
	            <label class="col-sm-4 control-label">密码：</label>
	            <div class="col-sm-4">
	                <input type="password" class="form-control" placeholder="password" name="password" style="height:30px">
	            </div>
	        </div>
	        
	       	<div class="form-group">
	            <div class="col-sm-offset-4 col-sm-10">
	                <button type="submit" class="btn btn-default">注册</button>
	            </div>
	        </div>
		</fieldset>
	 </form>
</body>
</html>