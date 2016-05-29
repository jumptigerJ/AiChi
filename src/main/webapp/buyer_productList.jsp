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
<script src="<%= basePath%>resources/js/buyer_productList.js" type="text/javascript" ></script>
<link href="<%= basePath%>resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
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
	</nav>
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
                                	<input type="hidden" id="myCustomerId" value="<%=session.getAttribute("customerId")%>">
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
                        <table class="table table-hover tablesorter" id="table1">
                          	<thead id="tem1">
								<th id="productName" width="25%">产品名字</th>
								<th id="num" width="25%">购买数量</th>
								<th id="price" width="25%">价格</th>
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
            if($(this).attr('id')=="myOrder"){
            	var customerId = $("#myCustomerId")[0].value;
            	myOrder(customerId);
      
            }else if($(this).attr('id')=="myCart"){
            	var customerId = $("#myCustomerId")[0].value;
            	queryMyCart(customerId);
            }
        });
    });
</script>
</body>
</html>