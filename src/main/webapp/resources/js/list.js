/**
 * 
 */
function deleteBatch(basePath){
	console.log(1111);
	$("#mainForm").attr("action",basePath+"DeleteBatchServlet");
	$("#mainForm").submit();
	
}
