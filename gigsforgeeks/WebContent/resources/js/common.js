/* Project Table */
$(document).ready(function(){
	
	// 프로젝트 상세보기 시 쿼리 스트링 (ProjectId 값)
	$(".projectTable>tbody>tr>td>a").click(function(){
	
		var projectId = $(this).next().text();
		$(this).attr("href", contextPath + "/detail.proj?projectId=" + projectId);
		
	});
	
});