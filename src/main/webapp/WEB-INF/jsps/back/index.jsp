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
                                <a id="customer" href="#Handle-customer">
                                    <i class="icon-chevron-right pull-right"></i>
                                		  客户管理
                                </a>
                            </li>
                        
                            <li>
                                <a id="order" href="#Handle-order">
                                    <i class="icon-chevron-right pull-right"></i>
                                		订单管理
                                </a>
                            </li>
                    		<li>
                                <a id="product" href="#Handle-product">
                                    <i class="icon-chevron-right pull-right"></i>
                                		产品管理
                                </a>
                            </li>
                            
                            <li>
                                <a id="master" href="#Handle-master">
                                    <i class="icon-chevron-right pull-right"></i>
                                		用户管理
                                </a>
                            </li>
   
                        </ul>
                    </div>
                </div>
                <div class="span12">
               		<!-- 第一个div不能显示页数，只能显示到table,要有一个bottomTool下一个div才能显示页数 -->
               		<div id="Handle-test" class="box">
                       <div class="box-content box-table">
                        <div id="bottomTool" class="row-fluid"> 
						</div>
                        </div>
               		</div>
               		
               		
                    <div id="Handle-customer" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>客户列表</h5>
                        </div>
                       
                       <div class="box-content box-table">
                        <table class="table table-hover tablesorter" id="table">
                          	<thead id="tem">
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
										<li onclick="customerPrevious()" class="prev disabled"><a
											id="previousPage" href="#">← 上一页</a></li>
										<div id="page" style="float: left;">
											<select id="pageNum" onchange="customerSearch()"
												style="width: 50PX; margin-right: 1px;"
												aria-controls="DataTables_Table_0" size="1"
												name="DataTables_Table_0_length">
												<option selected="selected" value="1">1</option>
											</select>
										</div>
										<li class="next" onclick="customerNext()"><a id="nextPage" href="#">下一页→ </a></li>
									</ul>
								</div>
							</div>
						</div>
                      </div>

                    </div>
                    
                    <div id="Handle-order" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>订单列表</h5>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table1">
	                          	<thead id="tem1">
	               					<th id="handle" width="20%">操作</th>
									<th id="orderId" width="10%">订单Id</th>
									<th id="productId" width="10%">产品Id</th>
									<th id="productName" width="15%">产品名称</th>
									<th id="num" width="15%">购买数量</th>
									<th id="remark" width="15%">备注</th>
									<th id="orderTime" width="15%">订单时间</th>
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
											<li onclick="orderPrevious()" class="prev disabled"><a
												id="previousPage" href="#">← 上一页</a></li>
											<div id="page" style="float: left;">
												<select id="pageNum4" onchange="orderSearch()"
													style="width: 50PX; margin-right: 1px;"
													aria-controls="DataTables_Table_0" size="1"
													name="DataTables_Table_0_length">
													<option selected="selected" value="1">1</option>
												</select>
											</div>
											<li class="next" onclick="orderNext()"><a id="nextPage" href="#">下一页→ </a></li>
										</ul>
									</div>
								</div>
							</div> 
                        </div>
                    	
                    </div>
                    
                     <div id="Handle-product"  class="box">
                    	<div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>产品列表</h5>
                            <a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productAdd' style="margin-left:150px;margin-bottom:10px;">添加产品</a>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table2">
	                          	<thead id="tem2">
	               					<th id="handle" width="25%">操作</th>
									<th id="productId" width="15%">产品Id</th>
									<th id="productName" width="15%">产品名称</th>
									<th id="desciption" width="15%">描述</th>
									<th id="price" width="15%">价格</th>
									<th id="num" width="15%">库存</th>
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
											<li onclick="productPrevious()" class="prev disabled"><a
												id="previousPage" href="#">← 上一页</a></li>
											<div id="page" style="float: left;">
												<select id="pageNum1" onchange="productSearch()"
													style="width: 50PX; margin-right: 1px;"
													aria-controls="DataTables_Table_0" size="1"
													name="DataTables_Table_0_length">
													<option selected="selected" value="1">1</option>
												</select>
											</div>
											<li class="next" onclick="productNext()"><a id="nextPage" href="#">下一页→ </a></li>
										</ul>
									</div>
								</div>
							</div> 
	                        
                        </div>
                    	
                    </div>
                     <div id="Handle-master"  class="box">
                   		 <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>管理员列表</h5>
                             <a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#masterAdd' style="margin-left:150px;margin-bottom:10px;">添加管理员</a>
                        </div>
                       
                        <div class="box-content box-table">
	                        <table class="table table-hover tablesorter" id="table3">
	                          	<thead id="tem3">
	               					<th id="handle" width="20%">操作</th>
									<th id="masterId" width="10%">管理员Id</th>
									<th id="masterName" width="15%">管理员名字</th>
									<th id="password" width="10%">密码</th>
									<th id="email" width="15%">邮件</th>
									<th id="phone" width="15%">电话</th>
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
										<ul id="masterNext" style="float: right">
											<li onclick="masterPrevious()" class="prev disabled"><a
												id="previousPage" href="#">← 上一页</a></li>
											<div id="page" style="float: left;">
												<select id="pageNum2" onchange="masterSearch()"
													style="width: 50PX; margin-right: 1px;"
													aria-controls="DataTables_Table_0" size="1"
													name="DataTables_Table_0_length">
													<option selected="selected" value="1">1</option>
												</select>
											</div>
											<li class="next" onclick="masterNext()"><a id="nextPage" href="#">下一页→ </a></li>
										</ul>
									</div>
								</div>
							</div> 
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
                    <p>aichi.com</p>
                </div>
            </div>
        </footer>
        
   <!--                 -----------111111111111111111  order--------------------------------------------- -->
   
   	<div class="modal fade" id="orderEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                 		  订单编辑框
	                </h4>
	            </div>
	            <div class="modal-body">
	            <!--  
			 		<form style="margin-left:180px;">
			 			
			 			产品名称：<input type = "text" name = "productName"> <br/>
			 			购买数量：<input type= "text" name="num"><br/>
			 			备注：       <input type = "text" name = "remark"> <br/>
			 		</form>    -->
			 		<form class="form-horizontal" role="form"  method="post" style="margin-left:30px;">
		
				        <div class="form-group">
				            <label class="col-sm-4 control-label">产品名称：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="产品名称" name="productName">
				            </div>
				        </div>
   						<div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">购买数量：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="购买数量" name="num">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">备注：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="备注" name="remark">
				            </div>
				        </div>
		    		</form>
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary" onclick="orderEdit()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<div class="modal fade" id="orderDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                    	订单删除框
	                </h4>
	            </div>
	            <div class="modal-body">
			 		是否确定删除该条订单？
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button"  id="dodel" class="btn btn-primary" onclick="orderDel()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>

  <!--                 -----------111111111111111111  product  --------------------------------------------- -->
  
     <div class="modal fade" id="productAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                 		  添加产品
	                </h4>
	            </div>
	            <div class="modal-body">
			 		<form class="form-horizontal" role="form"  method="post" style="margin-left:30px;">
		
				        <div class="form-group">
				            <label class="col-sm-4 control-label">产品名称：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="产品名称" name="productName1">
				            </div>
				        </div>
   						<div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">描述：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="描述" name="desciption">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">价格：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="价格" name="price">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">库存：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="库存" name="storeNum">
				            </div>
				        </div>
		    		</form>
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary" onclick="productAdd()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	 <div class="modal fade" id="productEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                 		  编辑产品
	                </h4>
	            </div>
	            <div class="modal-body">
			 		<form class="form-horizontal" role="form"  method="post" style="margin-left:30px;">
		
				        <div class="form-group">
				            <label class="col-sm-4 control-label">产品名称：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="产品名称" name="productName2">
				            </div>
				        </div>
   						<div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">描述：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="描述" name="desciption1">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">价格：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="价格" name="price1">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">库存：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="库存" name="storeNum1">
				            </div>
				        </div>
		    		</form>
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary" onclick="productEdit()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
  
  
  	<div class="modal fade" id="productDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                    	产品删除框
	                </h4>
	            </div>
	            <div class="modal-body">
			 		是否确定删除该产品？
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button"  class="btn btn-primary" onclick="productDelete()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<!--                 -----------111111111111111111  master  --------------------------------------------- -->
  
     <div class="modal fade" id="masterAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                 		  添加管理员
	                </h4>
	            </div>
	            <div class="modal-body">
			 		<form class="form-horizontal" role="form"  method="post" style="margin-left:30px;">
		
				        <div class="form-group">
				            <label class="col-sm-4 control-label">管理员名字：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="管理员名字" name="masterName">
				            </div>
				        </div>
   						<div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">密码：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="密码" name="password">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">邮件：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="邮件" name="email">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">电话：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="电话" name="phone">
				            </div>
				        </div>
		    		</form>
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary" onclick="masterAdd()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	 <div class="modal fade" id="masterEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                 		编辑管理员
	                </h4>
	            </div>
	            <div class="modal-body">
			 		<form class="form-horizontal" role="form"  method="post" style="margin-left:30px;">
				        <div class="form-group">
				            <label class="col-sm-4 control-label">管理员名字：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="管理员名字" name="masterName1">
				            </div>
				        </div>
   						<div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">密码：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="密码" name="password1">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">邮件：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="邮件" name="email1">
				            </div>
				        </div>
				        <div class="form-group" style="padding-top:8px;">
				            <label class="col-sm-4 control-label">电话：</label>
				            <div class="col-sm-4">
				                <input type="text" class="form-control" placeholder="电话" name="phone1">
				            </div>
				        </div>		    		
				      </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button" class="btn btn-primary" onclick="masterEdit()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
  
  
  	<div class="modal fade" id="masterDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close"
	                        data-dismiss="modal" aria-hidden="true">
	                    &times;
	                </button>
	                <h4 class="modal-title" id="myModalLabel">
	                    	管理员删除框
	                </h4>
	            </div>
	            <div class="modal-body">
			 		是否确定删除该管理员？
			
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default"
	                        data-dismiss="modal">关闭
	                </button>
	                <button type="button"  class="btn btn-primary" onclick="masterDelete()">
	                		    确定
	                </button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
  
  
<script src="<%= basePath%>resources/js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/jquery/jquery-chosen.js" type="text/javascript" ></script>
<script src="<%= basePath%>resources/js/jquery/virtual-tour.js" type="text/javascript" ></script>
<script type="text/javascript">
    $(function() {
        $('#handle-list.nav > li > a').click(function(e){
        	console.log($(this).attr('id'));
            if($(this).attr('id') == "view-all"){
                $('div[id*="Handle-"]').fadeIn('fast');
            }else{
                var aRef = $(this);
                var tablesToHide = $('div[id*="Handle-"]:visible').length > 1
                        ? $('div[id*="Handle-"]:visible') : $($('#handle-list > li[class="active"] > a').attr('href'));

                tablesToHide.hide();
                $(aRef.attr('href')).fadeIn('fast');
            }
            $('#handle-list > li[class="active"]').removeClass('active');
            $(this).parent().addClass('active');
            e.preventDefault();
            if($(this).attr('id')=="customer"){
            	customerSearch();
            }else if($(this).attr('id')=="order"){
            	orderSearch();
            }else if($(this).attr('id')=="product"){
            	productSearch();
            }else if($(this).attr('id')=="master"){
            	masterSearch();
            }
        });
    });
</script>
</body>
</html>