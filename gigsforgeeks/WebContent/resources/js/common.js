/* Project Table */
$(function(){
	
	// 내 프로젝트 보기 유형(reqType) 버튼 클릭 시 Ajax로 내 프로젝트 목록 조회하는 함수
	$(".myProjectHeader .btn.setReqType").click(function(){
		
		$(this).addClass("btn-primary").removeClass("btn-default");
		$(this).siblings().addClass("btn-default").removeClass("btn-primary");
		
		var $reqType = "";
		if($(this).hasClass("e")){ // "E(고용주)" 유형으로 요청 시
			$reqType = "E";
			
		}else{ // "F(프리랜서)" 유형으로 요청 시
			$reqType = "F";
		}
		sessionStorage.setItem("reqType", $reqType);
		
		$.ajax({
			url: $contextPath + "/list.proj",
			data: {reqType:$reqType},
			type: "post",
			success: function(myProjectList){ // 요청한 유형의 내 프로젝트 목록 조회 성공 시
				
				var colSize = $(".projectTable>thead>tr>th").length;
				$(".projectTable>tbody").empty();
				
				var result = "";
				if(myProjectList != null){ // 내 프로젝트 목록이 존재하고
				
					if($reqType == "E"){ // 유형이 E(고용주)일 때
						for(var i in myProjectList){
							if(myProjectList[i].projectStatus == "OPEN"){
								result += "<tr>" +
												    "<td>" + 
												        "<a href=''>" + myProjectList[i].projectName + "</a>" + 
												        "<span style='visibility: hidden;'>" + myProjectList[i].projectId + "</span>" + 
												    "</td>" +
												    "<td>" + myProjectList[i].countBid + "</td>" +
												    "<td>" + myProjectList[i].averageBid + "</td>" +
												    "<td>" + myProjectList[i].expectEnd + "</td>" +
												    "<td>" + 
												    "<select name='projectStatus'>" + 
												        "<option value='" + myProjectList[i].projectStatus + "'>" + myProjectList[i].projectStatus + "</option>"
												    "</select>" + 
												    "</td>" + 
											"</tr>";
								}
							}
					
						}else{ // 유형이 F(프리랜서)일 때
							for(var i in myProjectList){
								if(myProjectList[i].projectStatus == "START"){
									result += "<tr>" +
												        "<td>" + 
												            "<a href=''>" + myProjectList[i].projectName + "</a>" + 
												            "<span style='visibility: hidden;'>" + myProjectList[i].projectId + "</span>" +
												        "</td>" +
												        "<td>" + myProjectList[i].clientId + "</td>" +
												        "<td>" + myProjectList[i].winningBid + "</td>" +
												        "<td>" + myProjectList[i].endDate + "</td>" +
												        "<td>" + 
												            "<select name='projectStatus'>" + 
												                "<option value='" + myProjectList[i].projectStatus + "'>" + myProjectList[i].projectStatus + "</option>"
												            "</select>" + 
												        "</td>" + 
											     "</tr>";
								}
							}
						}
					
				}else{ // 내 프로젝트 목록이 존재하지 않을 때
					result = ("<td colspan='" + colSize + "'>입찰 중인 프로젝트가 없습니다.</td>");
				}
				$(".projectTable>tbody").html(result);
				
			},
			error: function(){ // 조회 실패 시
				alert("요청한 목록을 가져오는데 실패했습니다. 다시 이용해 주세요.");
				location.href = $contextPath;
			}
		});
			
	});
	
	// 프로젝트 상세보기 시 쿼리 스트링 (ProjectId 값)
	$(document).on('click', ".projectTable>tbody>tr>td>a", function(){
	
		var $projectId = $(this).next().text();
		sessionStorage.setItem("projectId", $projectId);
		$(this).attr("href", $contextPath + "/detail.proj?projectId=" + $projectId);
		
	});
	
	// 프로젝트 삭제하기 시 쿼리 스트링 (projectId값)
	$(document).on('click', ".deleteProject", function(){
		var $projectId = sessionStorage.getItem("projectId");
		$(this).attr("href", $contextPath + "/delete.proj?projectId=" + $projectId);
		
	});
	
});