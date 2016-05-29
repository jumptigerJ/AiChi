/* ------------ MyOrder ----------------*/
function myOrder(customerId){
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "myOrder", 
		 data:{  
			 customerId:customerId
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productEdit' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#productDelete' href='javascript:void(0)' onclick='subProductId("+data[i].productId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
				 row.find("#orderId").text(data[i].orderId); 
				 row.find("#productName").text(data[i].productName); 
				 row.find("#num").text(data[i].num); 
				 row.find("#remark").text(data[i].remark);  
				 row.find("#receiver").text(data[i].receiver);  
				 row.find("#orderTime").text(data[i].orderTime);

				 //将新行添加到表格中  
				 row.appendTo("#table");  
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

/*----------------------myCart--------------------*/
function queryMyCart(customerId){
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "myCart", 
		 data:{  
			 customerId:customerId
			 },   
		 dataType:"json", 
		 success: function (data) { 
			// alert(data);
			 $("#tem1").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a href='cartReceiverInfo?id="+data[i].productId+"&product="+data[i].productName+"&price="+data[i].price+"&buyNum="+data[i].num+"&cartId="+data[i].cartId+"'>立即购买</a>|<a href='deleteCartProduct?cartId="+data[i].cartId+"'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem1").clone();       
				 //给每一行赋值    
				 row.find("#handler").html(handler); 
				 row.find("#productName").text(data[i].productName); 
				 row.find("#num").text(data[i].num); 
				 row.find("#price").text(data[i].price);  

				 //将新行添加到表格中  
				 row.appendTo("#table1");  
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