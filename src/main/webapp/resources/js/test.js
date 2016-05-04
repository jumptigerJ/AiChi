function test(basePath){
	 var imgPath = basePath + "resources/images/products/";
	 console.log(basePath);
	 var pageNum = 1;
	 $.ajax({    
		 type: "POST",  
		 async: false,  
		 url: "frontList", 
		 data:{  
			 "pageNum":pageNum,
			 },   
		 dataType:"json", 
		 success: function (data) {
			 for(var i=0;i<data.length;i++){
				 var row = $("#div").clone();
				 $("#div").attr("id",div+i+1);
				 row.find("#title").text(data[i].productName);
				 row.find("#price").html("<span>￥</span>"+data[i].price);
				 row.find("#img").attr("src",imgPath+data[i].photo);
				 row.find("#buy").attr("href","product.jsp?id="+data[i].productId+"");
				 row.appendTo("#box");
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

