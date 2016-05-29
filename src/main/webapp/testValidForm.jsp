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
<link rel="stylesheet" href="<%=basePath %>resources/css/validform/style.css"  type="text/css" media="all"/>
<link rel="stylesheet" href="<%=basePath %>resources/css/validform/demo.css" rel="stylesheet" />
<style>
.registerform li{padding-bottom:20px;}
.Validform_checktip{margin-left:10px;}
.registerform .label{display:inline-block; width:70px;}
.action{padding-left:92px;}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="main">
    <div class="wraper">

		<form class="registerform">
            <ul>
                <li>
                    <label class="label"><span class="need">*</span> 中文名：</label>
                    <input type="text" value="" name="name" class="inputxt" />
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 密码：</label>
                    <input type="password" value="" name="userpassword" class="inputxt" />
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 确认密码：</label>
                    <input type="password" value="" name="userpassword2" class="inputxt" />
                </li>
            </ul>
            <div class="action">
                <input type="submit" value="提 交" /> <input type="reset" value="重 置" />
            </div>
        </form>

	</div>
</div>
<div class="footer" style="height:0px;width:0px;">
1
</div>
<script src="<%= basePath%>resources/js/validform/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/validform/Validform_v5.3.2_min.js" type="text/javascript" ></script>
<script type="text/javascript">
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
		
	var demo=$(".registerform").Validform({
		tiptype:3,
		label:".label",
		showAllError:true,
		datatype:{
			"zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
		},
		ajaxPost:true
	});
	
	//通过$.Tipmsg扩展默认提示信息;
	//$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
	demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
	
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"m"
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"*6-20"
	},
]);
	
})
</script>

</body>
</html>