//删除功能
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


//下一步 
function next()
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
	search(); 
} 

//上一步 
function previous()
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
	search();
} 

function search(){
	 //获取查询的title值
	 var title = $("input[name='title']").val();
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
			 var pager = data[data.length-1];
			
			// alert(data);
			 $("thead").eq(0).nextAll().remove(); 
		//	 console.log(basePath);
		//	 console.log(data);
			 //将获取到的数据动态的加载到table中   
			 for (var i = 0; i < data.length; i++) { 
				 var handler = "<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#edit'>编辑</a>|<a class='btn btn-primary btn-xs' data-toggle='modal'  data-target='#delete' href='javascript:void(0)' onclick='dodel("+data[i].customerId+")'>删除</a>"
				 //获取模板行，复制一行   
				 var row = $("#tem").clone();       
				 //给每一行赋值    
				 row.find("#handle").html(handler);
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
