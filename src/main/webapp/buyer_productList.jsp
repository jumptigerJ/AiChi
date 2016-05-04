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
<title>我的清单</title>
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
                                <a id="myOrder" href="#Handle-myOrder">
                                    <i class="icon-chevron-right pull-right"></i>
                                		我的订单
                                </a>
                            </li>
                        
                            <li>
                                <a id="myCart" href="#Handle-myCart">
                                    <i class="icon-chevron-right pull-right"></i>
                                		我的购物车
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
               		
               	<!--                       我的订单                                                    -->
                    <div id="Handle-myOrder" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>订单列表</h5>
                        </div>
                       
                       <div class="box-content box-table">
                        <table class="table table-hover tablesorter" id="table">
                          	<thead id="tem">
								<th id="ORDER_ID" width="20%">订单号</th>
								<th id="PRODUCT_NAME" width="20%">产品名字</th>
								<th id="NUM" width="20%">购买数量</th>
								<th id="REMARK" width="20%">备注</th>
								<th id="ORDER_TIME" width="20%">订单时间</th>
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
                    <!--            我的购物车                                                            -->
					<div id="Handle-myCart" class="box">
                        <div class="box-header">
                            <i class="icon-user icon-large"></i>
                            <h5>购物车列表</h5>
                        </div>
                       
                       <div class="box-content box-table">
                        <table class="table table-hover tablesorter" id="table">
                          	<thead id="tem">
								<th id="ORDER_ID" width="15%">订单号</th>
								<th id="PRODUCT_NAME" width="15%">产品名字</th>
								<th id="NUM" width="15%">购买数量</th>
								<th id="REMARK" width="20%">备注</th>
								<th id="ORDER_TIME" width="20%">订单时间</th>
								<th id="handler" width="25">操作</th>
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