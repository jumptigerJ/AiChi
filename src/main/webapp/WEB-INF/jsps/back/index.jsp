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
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">   
<meta name="layout" content="main"/>
<script src="<%= basePath%>resources/js/jquery.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/pagination.js" type="text/javascript" ></script>
<link href="<%= basePath%>resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
</head>
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

                        <ul class="nav pull-right">
                            <li>
                                <a href="loiginOut">Admin</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

 <div id="body-container">
     <div id="body-content">
        <section class="page container">
            <div class="row">
                <div class="span4">
                    <div class="blockoff-right">
                        <ul id="handle-list" class="nav nav-list">
                            <li class="nav-header">菜单</li>
                            <li class="active">
                                <a id="view-all" href="#">
                                    <i class="icon-chevron-right pull-right"></i>
                                    <b>View All</b>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:search();">
                                    <i class="icon-chevron-right pull-right"></i>
                                		  客户管理
                                </a>
                            </li>
                        
                            <li>
                                <a href="#Handle-order">
                                    <i class="icon-chevron-right pull-right"></i>
                                		订单管理
                                </a>
                            </li>
                    		<li>
                                <a href="#Handle-product">
                                    <i class="icon-chevron-right pull-right"></i>
                                		产品管理
                                </a>
                            </li>
                            
                            <li>
                                <a href="#Handle-master">
                                    <i class="icon-chevron-right pull-right"></i>
                                		用户管理
                                </a>
                            </li>
   
                        </ul>
                    </div>
                </div>
                <div class="span12">
                
                    <div id="Handle-customer" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>客户列表</h5>
                        </div>
                       
                        <div class="box-content box-table">
                        <table class="table table-hover tablesorter" id="table">
                          	<thead id="tem">
               					<th id="handle" width="10%">操作</th>
								<th id="customerId" width="10%">客户Id</th>
								<th id="customerName" width="15%">客户名字</th>
								<th id="email" width="20%">邮箱</th>
								<th id="sex" width="9%">性别</th>
								<th id="birthDate" width="20%">出生日</th>
								<th id="phone" width="16%">电话</th>
							</thead>
							<tbody>
							</tbody>
                        </table>
                        
                        <div id="bottomTool" class="row-fluid"> 
								<div class="span6" style="width: 25%;">
									<div id="DataTables_Table_0_info" class="dataTables_info"></div>
								</div>
								<!-- 第2页 -->
								<div class="span6" style="width: 30%;">
									<div class="dataTables_paginate paging_bootstrap pagination">
										<ul id="previousNext" style="float: right">
											<li onclick="previous()" class="prev disabled"><a
												id="previousPage" href="#">← 上一页</a></li>
											<div id="page" style="float: left;">
												<select id="pageNum" onchange="search()"
													style="width: 50PX; margin-right: 1px;"
													aria-controls="DataTables_Table_0" size="1"
													name="DataTables_Table_0_length">
													<option selected="selected" value="1">1</option>
												</select>
											</div>
											<li class="next" onclick="next()"><a id="nextPage" href="#">下一页→ </a></li>
										</ul>
									</div>
								</div>
							</div>
                        </div>

                    </div>
                    
                    <div id="Handle-order">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>订单列表</h5>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table3">
	                          	<thead id="tem">
	               					<th id="handle" width="30%">操作</th>
									<th id="firstName" width="5%">FirstName</th>
									<th id="lastName" width="5%">LastName</th>
									<th id="address" width="15%">Address</th>
									<th id="email" width="15%">Email</th>
									<th id="customerId" width="15%">CustomerId</th>
									<th id="lastUpdate" width="15%">LastUpdate</th>
								</thead>
								<tbody>
								</tbody>
	                        </table>
                        </div>
                    	
                    </div>
                    
                     <div id="Handle-product">
                    	<div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>产品列表</h5>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table2">
	                          	<thead id="tem">
	               					<th id="handle" width="30%">操作</th>
									<th id="firstName" width="5%">FirstName</th>
									<th id="lastName" width="5%">LastName</th>
									<th id="address" width="15%">Address</th>
									<th id="email" width="15%">Email</th>
									<th id="customerId" width="15%">CustomerId</th>
									<th id="lastUpdate" width="15%">LastUpdate</th>
								</thead>
								<tbody>
								</tbody>
	                        </table>
                        </div>
                    	
                    </div>
                     <div id="Handle-master">
                   		 <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>用户列表</h5>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table1">
	                          	<thead id="tem">
	               					<th id="handle" width="30%">操作</th>
									<th id="firstName" width="5%">FirstName</th>
									<th id="lastName" width="5%">LastName</th>
									<th id="address" width="15%">Address</th>
									<th id="email" width="15%">Email</th>
									<th id="customerId" width="15%">CustomerId</th>
									<th id="lastUpdate" width="15%">LastUpdate</th>
								</thead>
								<tbody>
								</tbody>
	                        </table>
                        </div>
                    	
                    </div>

                </div>
            </div>
        </section>
        
    
      </div>
  </div>

        <div id="spinner" class="spinner" style="display:none;">
            Loading&hellip;
        </div>

        <footer class="application-footer">
            <div class="container">
                <p>Application Footer</p>
                <div class="disclaimer">
                    <p>This is an example disclaimer. All right reserved.</p>
                    <p>Copyright © keaplogik 2011-2012</p>
                </div>
            </div>
        </footer>
        
   <!--                 -----------111111111111111111--------------------------------------------- -->
   
   	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                    Customer编辑框
	                </h4>
	            </div>
	            <div class="modal-body">
			 		<form style="margin-left:180px;">
			 			Firstname:<input type ="text" name = "fistname"><br/>
			 			Lastname:<input type = "text" name = "lastname"> <br/>
			 			Address:           
						   <select>
							  <option value ="47 MySakila Drive">47 MySakila Drive</option>
							  <option value ="28 MySQL Boulevard">28 MySQL Boulevard</option>
							  <option value="23 Workhaven Lane">23 Workhaven Lane</option>
							  <option value="1913 Hanoi Way">1913 Hanoi Way</option>
							  <option value="1121 Loja Avenue">1121 Loja Avenue</option>
							  <option value="692 Joliet Street">692 Joliet Street</option>    
							</select><br/>
			 			Email:<input type = "text" name = "email"> <br/>
			 			CustomerId:<input type = "text" name = "customerId"> <br/>
			 			LastUpdate:<input type = "text" name = "lastUpdate"> <br/>
			 		</form>
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary">
	                		    提交更改
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                    Customer编辑框
	                </h4>
	            </div>
	            <div class="modal-body">
			 		是否确定删除该Customer信息？
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button"  id="dodel" class="btn btn-primary" onclick="del()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>


</body>
</html>