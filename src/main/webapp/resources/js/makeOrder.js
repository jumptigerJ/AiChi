function orderSubmit1(id,buyNum){
		var receiver = $("input[name='receiver']").val();
		var receiverAddress = $("input[name='receiverAddress']").val();
		var receiverPhone = $("input[name='receiverPhone']").val();
		
		$.ajax({
		type:"POST",
		url:"makeorderrr",
	    data:{
	    	receiver:receiver,
			receiverAddress:receiverAddress,
			receiverPhone:receiverPhone,
			productId:id,
			num:buyNum
	    },
	    success:function(){
	    
	    },
	    error :function(){
	         alert("222");
	     },
       complete:function(jqXHR,textStatus){
     	  	console.log("textStatus:%s",textStatus);
       }
	})

	}