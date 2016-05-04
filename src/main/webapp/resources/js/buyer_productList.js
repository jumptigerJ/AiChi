/* ------------ MyOrder ----------------*/
function myOrder(){
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "productList", 
		 data:{  
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
			
		 },
		 error :function(data){
	         alert("222");
	     },
        complete:function(jqXHR,textStatus){
      	  	console.log("textStatus:%s",textStatus);
        }
	 });	
}