//删除功能
/**
 * 

var cid;
function dodel(id){
	//console.log(id);
		cid = id;
		console.log(cid);
}

function del(){
	$("#delete").modal('hide');
	 $.ajax({
         type: "POST",
         url: "delete",
         data: {customerId:cid},
         success: function(data){
        	 search(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
	
}
 */
/*    --------------------- ------  customer     ---------------------  */
//下一步 
function customerNext()
{  
	//得到当前选中项的页号   
	var id=$("#pageNum option:selected").val();   
	//计算下一页的页号   
	var nextPage=parseInt(id)+1;   
	//得到select的option集合   
	var list=document.getElementById("pageNum").options;   
	//得到select中，下一页的option 
	var nextOption=list[nextPage-1];   
	//修改select的选中项   
	nextOption.selected=true;  
	//调用查询方法   
	customerSearch(); 
} 

//上一步 
function customerPrevious()
{ 
	//得到当前选中项的页号  
	var id=$("#pageNum option:selected").val();   
	//计算上一页的页号  
	var previousPage=parseInt(id)-1; 
	//得到select的option集合 
	var list=document.getElementById("pageNum").options;   
	//得到select中，上一页的option 
	var previousOption=list[previousPage-1]; 
	//修改select的选中项 
	previousOption.selected=true;   
	//调用查询方法 
	customerSearch();
} 

function customerSearch(){
	 //得到显示第几页   
	 var pageNum=$("#pageNum").val();
	// console.log(pageNum);
	 
	//alert("111");
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "customerQuery", 
		 data:{  
			 "pageNum":pageNum,
			 },   
		 dataType:"json", 
		 success: function (data) { 
			
			// alert(data);
			 //要加上这个条件要不然列表会一直累加
			 $("#tem").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 //获取模板行，复制一行   
				 var row = $("#tem").clone();       
				 //给每一行赋值    
				 row.find("#customerId").text(data[i].customerId); 
				 row.find("#customerName").text(data[i].customerName); 
				 row.find("#email").text(data[i].email); 
				 row.find("#sex").text(data[i].sex);  
				 row.find("#phone").text(data[i].phone); 
				 row.find("#birthDate").text(data[i].birthDate);  
				 //将新行添加到表格中  
				 row.appendTo("#table");  
			}  
			 var pageSize = 6;
			 //当前记录总数    
			 var pageNumCount=data[0].pageTotalNum;     
			 //当前记录开始数 
			 var pageNumBegin=(pageNum-1)*pageSize+1;   
			 //当前记录结束数  
			 var pageNumEnd=pageNum*pageSize  
			 //如果结束数大于记录总数，则等于记录总数  
			 if(pageNumEnd>pageNumCount){   
				 pageNumEnd=pageNumCount;   
			} 
			// alert(pageNumCount);
			//得到总页数
			var pageCount; 
			if(pageNumCount/pageSize==0){  
				 pageCount=pageNumCount/pageSize;  
			}else{    
				 pageCount=Math.ceil(pageNumCount/pageSize);   
	   	    }
			
			//输出"显示第 1 至 10 项记录，共 57 项"     
			document.getElementById("DataTables_Table_0_info").innerHTML= 
				"显示第"+pageNumBegin.toString()      
				+" 至 "+pageNumEnd.toString()     
				+" 项记录，共 "+pageNumCount.toString()+" 项";
			
			//显示所有的页码数 
			var pageSelect =document.getElementById("page");  
			var pageOption="";    
			var flag;
			
			//删除select下所有的option，清除所有页码  
			document.getElementById("pageNum").options.length=0;
			for(var i=0;i<pageCount;i++){      
				flag=(i+1).toString();    
				var option;    
				//如果等于当前页码 
				if(flag==pageNum){       
					//实例化一个option,则当前页码为选中状态   
					option=new Option(flag, flag, false, true);      
				}else{       
					option=new Option(flag, flag, false, false); 
				}   
				//将option加入select中   
				document.getElementById("pageNum").options.add(option); 
			}
			
			//如果总记录数小于5条，则不显示分页   
			if((pageNumCount-5)<0){      
				document.getElementById("bottomTool").style.display="none";  
			}else{    
				document.getElementById("bottomTool").style.display=""; 
			} 
			
			 /**给上一步下一步加颜色**/  
			 //判断是否只有一页  
			 if(pageCount==1){    
				 //如果只有一页，上一步，下一步都为灰色  
				 $("#previousPage").css("color","#AAA"); //给上一步加灰色   
				 $("#nextPage").css("color","#AAA"); //给下一步加灰色 
			 }else if(pageNum-1<1){   
				 //如果是首页,则给上一步加灰色，下一步变蓝 
				 $("#previousPage").css("color","#AAA");//给上一步加灰色   
				 $("#nextPage").css("color","#00F");//给下一步加蓝色  
			 }else if(pageNum==pageCount){   
				 //如果是尾页,则给上一步加蓝色，下一步灰色
				 $("#previousPage").css("color","#00F"); //给上一步标签加蓝色   
				 $("#nextPage").css("color","#AAA");//给下一步标签加灰色 
			 }else{ 
				 //上一步为蓝色，下一步为绿色    
				 $("#previousPage").css("color","#00F");//给上一步加蓝色    
				 $("#nextPage").css("color","#00F"); //给下一步加蓝色  
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

/*      order       */
var orderId;
function subOrderId(id){
	//console.log(id);
		orderId = id;
	//	console.log(orderId);
}

function orderDel(){
	//console.log(orderId);
	$("#orderDelete").modal('hide');
	 $.ajax({
         type: "POST",
         url: "orderDelete",
         data: {orderId:orderId},
         success: function(data){
        	 orderSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
}
function orderEdit(){
	console.log(orderId);
	$("#orderEdit").modal('hide');
	var productName = $("input[name='productName']").val();
	var num = $("input[name='num']").val();
	var remark = $("input[name='remark']").val();
	
	 $.ajax({
         type: "POST",
         url: "orderEdit",
         data: {productName:productName,
        	    num:num,
        	    remark:remark,
        	    orderId:orderId
         },
         success: function(data){
        	 orderSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
	
}
function orderNext()
{  
	//得到当前选中项的页号   
	var id=$("#pageNum4 option:selected").val();   
	//计算下一页的页号   
	var nextPage=parseInt(id)+1;   
	//得到select的option集合   
	var list=document.getElementById("pageNum4").options;   
	//得到select中，下一页的option 
	var nextOption=list[nextPage-1];   
	//修改select的选中项   
	nextOption.selected=true;  
	//调用查询方法   
	orderSearch(); 
} 

//上一步 
function orderPrevious()
{ 
	//得到当前选中项的页号  
	var id=$("#pageNum option:selected").val();   
	//计算上一页的页号  
	var previousPage=parseInt(id)-1; 
	//得到select的option集合 
	var list=document.getElementById("pageNum").options;   
	//得到select中，上一页的option 
	var previousOption=list[previousPage-1]; 
	//修改select的选中项 
	previousOption.selected=true;   
	//调用查询方法 
	customerSearch();
} 

function orderSearch(){
	 //得到显示第几页   
	 var pageNum=$("#pageNum4").val();
	// console.log(pageNum);
	 
	//alert("111");
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "orderList", 
		 data:{  
			 "pageNum":pageNum,
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem1").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#orderEdit' href='javascript:void(0)' onclick='subOrderId("+data[i].orderId+")'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#orderDelete' href='javascript:void(0)' onclick='subOrderId("+data[i].orderId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem1").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
				 row.find("#orderId").text(data[i].orderId); 
				 row.find("#productId").text(data[i].productId); 
				 row.find("#productName").text(data[i].productName); 
				 row.find("#num").text(data[i].num); 
				 row.find("#remark").text(data[i].remark);  
				 row.find("#orderTime").text(data[i].orderTime);  
				 //将新行添加到表格中  
				 row.appendTo("#table1");  
			}  
			 var pageSize = 6;
			 //当前记录总数    
			 var pageNumCount=data[0].pageTotalNum;     
			 //当前记录开始数 
			 var pageNumBegin=(pageNum-1)*pageSize+1;   
			 //当前记录结束数  
			 var pageNumEnd=pageNum*pageSize  
			 //如果结束数大于记录总数，则等于记录总数  
			 if(pageNumEnd>pageNumCount){   
				 pageNumEnd=pageNumCount;   
			} 
			// alert(pageNumCount);
			//得到总页数
			var pageCount; 
			if(pageNumCount/pageSize==0){  
				 pageCount=pageNumCount/pageSize;  
			}else{    
				 pageCount=Math.ceil(pageNumCount/pageSize);   
	   	    }
			
			//输出"显示第 1 至 10 项记录，共 57 项"     
			document.getElementById("DataTables_Table_0_info").innerHTML= 
				"显示第"+pageNumBegin.toString()      
				+" 至 "+pageNumEnd.toString()     
				+" 项记录，共 "+pageNumCount.toString()+" 项";
			
			//显示所有的页码数 
			var pageSelect =document.getElementById("page");  
			var pageOption="";    
			var flag;
			
			//删除select下所有的option，清除所有页码  
			document.getElementById("pageNum4").options.length=0;
			for(var i=0;i<pageCount;i++){      
				flag=(i+1).toString();    
				var option;    
				//如果等于当前页码 
				if(flag==pageNum){       
					//实例化一个option,则当前页码为选中状态   
					option=new Option(flag, flag, false, true);      
				}else{       
					option=new Option(flag, flag, false, false); 
				}   
				//将option加入select中   
				document.getElementById("pageNum4").options.add(option); 
			}
			
			//如果总记录数小于5条，则不显示分页   
			if((pageNumCount-5)<0){      
				document.getElementById("bottomTool").style.display="none";  
			}else{    
				document.getElementById("bottomTool").style.display=""; 
			} 
			
			 /**给上一步下一步加颜色**/  
			 //判断是否只有一页  
			 if(pageCount==1){    
				 //如果只有一页，上一步，下一步都为灰色  
				 $("#previousPage").css("color","#AAA"); //给上一步加灰色   
				 $("#nextPage").css("color","#AAA"); //给下一步加灰色 
			 }else if(pageNum-1<1){   
				 //如果是首页,则给上一步加灰色，下一步变蓝 
				 $("#previousPage").css("color","#AAA");//给上一步加灰色   
				 $("#nextPage").css("color","#00F");//给下一步加蓝色  
			 }else if(pageNum==pageCount){   
				 //如果是尾页,则给上一步加蓝色，下一步灰色
				 $("#previousPage").css("color","#00F"); //给上一步标签加蓝色   
				 $("#nextPage").css("color","#AAA");//给下一步标签加灰色 
			 }else{ 
				 //上一步为蓝色，下一步为绿色    
				 $("#previousPage").css("color","#00F");//给上一步加蓝色    
				 $("#nextPage").css("color","#00F"); //给下一步加蓝色  
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

/*   ----------------------------------product----------------------------                   */
var productId1;
function subProductId(id){
	productId1 = id;
}

function productAdd(){
	$("#productAdd").modal('hide');
	var productName1 = $("input[name='productName1']").val();
	var desciption = $("input[name='desciption']").val();
	var price = $("input[name='price']").val();
	var storeNum = $("input[name='storeNum']").val();
	var photo = $("input[name='photo']").val();
	
	 $.ajax({
         type: "POST",
         url: "productAdd",
         data: {
        	 productName:productName1,
	 		 desciption:desciption,
	 		 price:price,
	 		 num:storeNum,
	 		 photo:photo
         },
         success: function(data){
        	 productSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
}
//编辑产品
function productEdit(){
	$("#productEdit").modal('hide');
	var productName1 = $("input[name='productName2']").val();
	var desciption = $("input[name='desciption1']").val();
	var price = $("input[name='price1']").val();
	var storeNum = $("input[name='storeNum1']").val();
	var photo = $("input[name='photo1']").val();
	
	 $.ajax({
         type: "POST",
         url: "productEdit",
         data: {
        	 productName:productName1,
	 		 desciption:desciption,
	 		 price:price,
	 		 num:storeNum,
	 		 photo:photo,
	 		 productId:productId1
         },
         success: function(data){
        	 productSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
}
//删除产品
function productDelete(){
	$("#productDelete").modal('hide');
	 $.ajax({
        type: "POST",
        url: "productDelete",
        data: {productId:productId1},
        success: function(data){
       	 	productSearch(); 
         },
         error :function(data){
       	  alert("error");
         },

         complete:function(jqXHR,textStatus){
          	  console.log("textStatus:%s",textStatus);
         }
    });
}


function productNext()
{  
	//得到当前选中项的页号   
	var id=$("#pageNum option:selected").val();   
	//计算下一页的页号   
	var nextPage=parseInt(id)+1;   
	//得到select的option集合   
	var list=document.getElementById("pageNum1").options;   
	//得到select中，下一页的option 
	var nextOption=list[nextPage-1];   
	//修改select的选中项   
	nextOption.selected=true;  
	//调用查询方法   
	productSearch(); 
} 

//上一步 
function productPrevious()
{ 
	//得到当前选中项的页号  
	var id=$("#pageNum1 option:selected").val();   
	//计算上一页的页号  
	var previousPage=parseInt(id)-1; 
	//得到select的option集合 
	var list=document.getElementById("pageNum1").options;   
	//得到select中，上一页的option 
	var previousOption=list[previousPage-1]; 
	//修改select的选中项 
	previousOption.selected=true;   
	//调用查询方法 
	productSearch();
} 

function productSearch(){
	 //得到显示第几页   
	 var pageNum=$("#pageNum1").val();
	// console.log(pageNum);
	 
	//alert("111");
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "productList", 
		 data:{  
			 "pageNum":pageNum,
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem2").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productEdit' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productDelete' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem2").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
				 row.find("#productId").text(data[i].productId); 
				 row.find("#productName").text(data[i].productName); 
				 row.find("#desciption").text(data[i].desciption); 
				 row.find("#price").text(data[i].price);  
				 row.find("#num").text(data[i].num);  
				 row.find("#photo").text(data[i].photo);

				 //将新行添加到表格中  
				 row.appendTo("#table2");  
			}  
			 var pageSize = 6;
			 //当前记录总数    
			 var pageNumCount=data[0].pageTotalNum;     
			 //当前记录开始数 
			 var pageNumBegin=(pageNum-1)*pageSize+1;   
			 //当前记录结束数  
			 var pageNumEnd=pageNum*pageSize  
			 //如果结束数大于记录总数，则等于记录总数  
			 if(pageNumEnd>pageNumCount){   
				 pageNumEnd=pageNumCount;   
			} 
			// alert(pageNumCount);
			//得到总页数
			var pageCount; 
			if(pageNumCount/pageSize==0){  
				 pageCount=pageNumCount/pageSize;  
			}else{    
				 pageCount=Math.ceil(pageNumCount/pageSize);   
	   	    }
			
			//输出"显示第 1 至 10 项记录，共 57 项"     
			document.getElementById("DataTables_Table_0_info").innerHTML= 
				"显示第"+pageNumBegin.toString()      
				+" 至 "+pageNumEnd.toString()     
				+" 项记录，共 "+pageNumCount.toString()+" 项";
			
			//显示所有的页码数 
			var pageSelect =document.getElementById("page");  
			var pageOption="";    
			var flag;
			
			//删除select下所有的option，清除所有页码  
			document.getElementById("pageNum1").options.length=0;
			for(var i=0;i<pageCount;i++){      
				flag=(i+1).toString();    
				var option;    
				//如果等于当前页码 
				if(flag==pageNum){       
					//实例化一个option,则当前页码为选中状态   
					option=new Option(flag, flag, false, true);      
				}else{       
					option=new Option(flag, flag, false, false); 
				}   
				//将option加入select中   
				document.getElementById("pageNum1").options.add(option); 
			}
			
			//如果总记录数小于5条，则不显示分页   
			if((pageNumCount-5)<0){      
				document.getElementById("bottomTool").style.display="none";  
			}else{    
				document.getElementById("bottomTool").style.display=""; 
			} 
			
			 /**给上一步下一步加颜色**/  
			 //判断是否只有一页  
			 if(pageCount==1){    
				 //如果只有一页，上一步，下一步都为灰色  
				 $("#previousPage").css("color","#AAA"); //给上一步加灰色   
				 $("#nextPage").css("color","#AAA"); //给下一步加灰色 
			 }else if(pageNum-1<1){   
				 //如果是首页,则给上一步加灰色，下一步变蓝 
				 $("#previousPage").css("color","#AAA");//给上一步加灰色   
				 $("#nextPage").css("color","#00F");//给下一步加蓝色  
			 }else if(pageNum==pageCount){   
				 //如果是尾页,则给上一步加蓝色，下一步灰色
				 $("#previousPage").css("color","#00F"); //给上一步标签加蓝色   
				 $("#nextPage").css("color","#AAA");//给下一步标签加灰色 
			 }else{ 
				 //上一步为蓝色，下一步为绿色    
				 $("#previousPage").css("color","#00F");//给上一步加蓝色    
				 $("#nextPage").css("color","#00F"); //给下一步加蓝色  
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


/*   ----------------------------------master----------------------------                   */
var masterId1;
function subMasterId(id){
	masterId1 = id;
}

function masterAdd(){
	$("#masterAdd").modal('hide');
	var masterName = $("input[name='masterName']").val();
	var password = $("input[name='password']").val();
	var email = $("input[name='email']").val();
	var phone = $("input[name='phone']").val();
	
	 $.ajax({
         type: "POST",
         url: "addMaster",
         data: {
        	 masterName:masterName,
        	 password:password,
        	 email:email,
        	 phone:phone
         },
         success: function(data){
        	 masterSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
}
//编辑产品
function masterEdit(){
	$("#masterEdit").modal('hide');
	var masterName = $("input[name='masterName1']").val();
	var password = $("input[name='password1']").val();
	var email = $("input[name='email1']").val();
	var phone = $("input[name='phone1']").val();
	
	 $.ajax({
         type: "POST",
         url: "masterEdit",
         data: {
        	 masterName:masterName,
        	 password:password,
        	 email:email,
        	 phone:phone,
        	 masterId:masterId1
         },
         success: function(data){
        	 masterSearch(); 
          },
          error :function(data){
        	  alert("error");
          },

          complete:function(jqXHR,textStatus){
           	  console.log("textStatus:%s",textStatus);
          }
     });
}
//删除产品
function masterDelete(){
	$("#masterDelete").modal('hide');
	 $.ajax({
        type: "POST",
        url: "masterDelete",
        data: { masterId:masterId1},
        success: function(data){
       	 	masterSearch(); 
         },
         error :function(data){
       	  alert("error");
         },

         complete:function(jqXHR,textStatus){
          	  console.log("textStatus:%s",textStatus);
         }
    });
}

function masterNext()
{  
	//得到当前选中项的页号   
	var id=$("#pageNum2 option:selected").val();   
	//计算下一页的页号   
	var nextPage=parseInt(id)+1;   
	//得到select的option集合   
	var list=document.getElementById("pageNum2").options;   
	//得到select中，下一页的option 
	var nextOption=list[nextPage-1];   
	//修改select的选中项   
	nextOption.selected=true;  
	//调用查询方法   
	masterSearch(); 
} 

//上一步 
function masterPrevious()
{ 
	//得到当前选中项的页号  
	var id=$("#pageNum2 option:selected").val();   
	//计算上一页的页号  
	var previousPage=parseInt(id)-1; 
	//得到select的option集合 
	var list=document.getElementById("pageNum2").options;   
	//得到select中，上一页的option 
	var previousOption=list[previousPage-1]; 
	//修改select的选中项 
	previousOption.selected=true;   
	//调用查询方法 
	masterSearch();
} 

function masterSearch(){
	 //得到显示第几页   
	 var pageNum=$("#pageNum2").val();
	 console.log(pageNum);
	// console.log(pageNum);
	 
	//alert("111");
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "masterList", 
		 data:{  
			 "pageNum":pageNum,
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem3").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#masterEdit' href='javascript:void(0)' onclick='subMasterId("+data[i].masterId+")'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#masterDelete' href='javascript:void(0)' onclick='subMasterId("+data[i].masterId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem3").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
				 row.find("#masterId").text(data[i].masterId); 
				 row.find("#masterName").text(data[i].masterName); 
				 row.find("#password").text(data[i].password); 
				 row.find("#email").text(data[i].email);  
				 row.find("#phone").text(data[i].phone);  
				 //将新行添加到表格中  
				 row.appendTo("#table3");  
			}  
			 var pageSize = 6;
			 //当前记录总数    
			 var pageNumCount=data[0].pageTotalNum;     
			 //当前记录开始数 
			 var pageNumBegin=(pageNum-1)*pageSize+1;   
			 //当前记录结束数  
			 var pageNumEnd=pageNum*pageSize  
			 //如果结束数大于记录总数，则等于记录总数  
			 if(pageNumEnd>pageNumCount){   
				 pageNumEnd=pageNumCount;   
			} 
			// alert(pageNumCount);
			//得到总页数
			var pageCount; 
			if(pageNumCount/pageSize==0){  
				 pageCount=pageNumCount/pageSize;  
			}else{    
				 pageCount=Math.ceil(pageNumCount/pageSize);   
	   	    }
			
			//输出"显示第 1 至 10 项记录，共 57 项"     
			document.getElementById("DataTables_Table_0_info").innerHTML= 
				"显示第"+pageNumBegin.toString()      
				+" 至 "+pageNumEnd.toString()     
				+" 项记录，共 "+pageNumCount.toString()+" 项";
			
			//显示所有的页码数 
			var pageSelect =document.getElementById("page");  
			var pageOption="";    
			var flag;
			
			//删除select下所有的option，清除所有页码  
			document.getElementById("pageNum2").options.length=0;
			for(var i=0;i<pageCount;i++){      
				flag=(i+1).toString();    
				var option;    
				//如果等于当前页码 
				if(flag==pageNum){       
					//实例化一个option,则当前页码为选中状态   
					option=new Option(flag, flag, false, true);      
				}else{       
					option=new Option(flag, flag, false, false); 
				}   
				//将option加入select中   
				document.getElementById("pageNum2").options.add(option); 
			}
			
			//如果总记录数小于5条，则不显示分页   
			if((pageNumCount-5)<0){      
				document.getElementById("bottomTool").style.display="none";  
			}else{    
				document.getElementById("bottomTool").style.display=""; 
			} 
			
			 /**给上一步下一步加颜色**/  
			 //判断是否只有一页  
			 if(pageCount==1){    
				 //如果只有一页，上一步，下一步都为灰色  
				 $("#previousPage").css("color","#AAA"); //给上一步加灰色   
				 $("#nextPage").css("color","#AAA"); //给下一步加灰色 
			 }else if(pageNum-1<1){   
				 //如果是首页,则给上一步加灰色，下一步变蓝 
				 $("#previousPage").css("color","#AAA");//给上一步加灰色   
				 $("#nextPage").css("color","#00F");//给下一步加蓝色  
			 }else if(pageNum==pageCount){   
				 //如果是尾页,则给上一步加蓝色，下一步灰色
				 $("#previousPage").css("color","#00F"); //给上一步标签加蓝色   
				 $("#nextPage").css("color","#AAA");//给下一步标签加灰色 
			 }else{ 
				 //上一步为蓝色，下一步为绿色    
				 $("#previousPage").css("color","#00F");//给上一步加蓝色    
				 $("#nextPage").css("color","#00F"); //给下一步加蓝色  
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
