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
				$(".projectTable>tbody, .myProjectNav").empty();
				
				var result = "";
				
				if(myProjectList != null){ // 내 프로젝트 목록이 존재하고
				
					if($reqType == "E"){ // 유형이 E(고용주)일 때
					
						$(".myProjectNav").empty();
						$(".myProjectNav").append("<a href=''>열린 프로젝트</a> | ");
						$(".myProjectNav").append("<a style='font-weight: bolder'>시작 프로젝트</a> | ");
						$(".myProjectNav").append("<a href=''>피드백</a> | ");
						$(".myProjectNav").append("<a href=''>과거 프로젝트</a>");
						
						$(".projectTable > thead").empty();
						$(".projectTable > thead").append("<th>프로젝트명</th>");
						$(".projectTable > thead").append("<th>입찰</th>");
						$(".projectTable > thead").append("<th>평균입찰가</th>");
						$(".projectTable > thead").append("<th>입찰마감일</th>");
						$(".projectTable > thead").append("<th>실행옵션</th>");
						
						for(var i in myProjectList){
							if(myProjectList[i].projectStatus == "START" || myProjectList[i].projectStatus == "PROCESS" || myProjectList[i].projectStatus == "HOLD"){
								result += "<tr>" +
												"<td>" + 
												    "<a href=''>" + myProjectList[i].projectName + "</a>" + 
												    "<span style='visibility: hidden;'>" + myProjectList[i].projectId + "</span>" + 
												"</td>" +
												"<td>" + myProjectList[i].countBid + "</td>" +
												"<td>₩" + comma(myProjectList[i].averageBid) + "</td>" +
												"<td>" + myProjectList[i].expectEnd + "</td>" +
												"<td>" + 
												"<select name='projectStatus'>" + 
												    "<option value='" + myProjectList[i].projectStatus + "'>" + myProjectList[i].projectStatus + "</option>"
												"</select>" + 
												"</td>" + 
										  "</tr>";
								}
							}
					
						}else if($reqType == "F") { // 유형이 F(프리랜서)일 때
							
							$(".myProjectNav").empty();
							$(".myProjectNav").append("<a href=''>제안 작업</a> | ");
							$(".myProjectNav").append("<a style='font-weight: bolder'>현재 작업</a> | ");
							$(".myProjectNav").append("<a href=''>과거 작업</a>");
							
							$(".projectTable > thead").empty();
							$(".projectTable > thead").append("<th>프로젝트명</th>");
							$(".projectTable > thead").append("<th>고용주</th>");
							$(".projectTable > thead").append("<th>낙찰가</th>");
							$(".projectTable > thead").append("<th>종료일</th>");
							$(".projectTable > thead").append("<th>실행옵션</th>");
							
							
							for(var i in myProjectList){
								if(myProjectList[i].projectStatus == "START" || myProjectList[i].projectStatus == "PROCESS" || myProjectList[i].projectStatus == "HOLD"){
									result += "<tr>" +
													"<td>" + 
													    "<a href=''>" + myProjectList[i].projectName + "</a>" + 
													    "<span style='visibility: hidden;'>" + myProjectList[i].projectId + "</span>" +
													"</td>" +
													"<td>" + myProjectList[i].clientId + "</td>" +
													"<td>₩" + comma(myProjectList[i].winningBid) + "</td>" +
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
		
		var result = confirm("정말로 삭제하겠습니까?");
		
		if(result){ // yes
			var $projectId = sessionStorage.getItem("projectId");
			var $listType = sessionStorage.getItem("reqType");
			$(this).attr("href", $contextPath + "/delete.proj?projectId=" + $projectId + "&listType=" + $listType);
		}
		
	});
	
	// 숫자 3자리 마다 쉼표 찍어주는 함수
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
});