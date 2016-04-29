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
<title>登录</title>
</head>
<link rel="stylesheet" href="<%=basePath %>resources/css/bootstrap.min.css">
<link href="<%= basePath%>resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
<style>
    body{
    	background:<%= basePath%>resources/images/12.jpg;
    }
	form{
		margin-top:150px;
		border:1px solid;
		width:500px;
		margin-left:400px;
	}
</style>
<body>
 		<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button class="btn btn-navbar" data-toggle="collapse" data-target="#app-nav-top-bar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#" class="brand"><i class="icon-leaf">aichi</i></a>
                    <div id="app-nav-top-bar" class="nav-collapse">
                    </div>
                </div>
            </div>
        </div>

		<form class="form-horizontal" role="form" action="login" method="post">
		<fieldset>
				<legend>
				     <div class="form-group">
		            <label class="col-sm-4 control-label">AiChi后台管理系统</label>
		        </div>
				</legend>
		
		        <div class="form-group">
		            <label class="col-sm-4 control-label">用戶名：</label>
		            <div class="col-sm-4">
		                <input type="text" class="form-control" placeholder="username" name="masterName" style="height:30px">
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
		                <button type="submit" class="btn btn-default">登录</button>
		            </div>
		        </div>
		</fieldset>
		    </form>

</body>
</html>