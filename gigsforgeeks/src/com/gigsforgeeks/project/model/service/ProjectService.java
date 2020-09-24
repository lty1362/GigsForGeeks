package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;

import com.gigsforgeeks.project.model.dao.ProjectDAO;
import com.gigsforgeeks.project.model.vo.Project;
import com.gigsforgeeks.project.model.vo.Proposal;

public class ProjectService {
	
	/**
	 * 사용자로부터 등록할 프로젝트의 정보를 전달받아서 
	 * 해당 프로젝트 정보를 DB에 등록하고 성공 여부를 반환하는 메서드
	 * 
	 * @param project 클라이언트 서버의 사용자로부터 전달받은 프로젝트 객체
	 * @return 클라이언트 서버가 요청한 프로젝트 객체 DB서버 등록 성공여부
	 */
	public int insertProject(Project project) {
		
		Connection connection = getConnection();
		int result = new ProjectDAO().insertProject(project, connection);
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
		
	}
	
	
	/**
	 * 사용자에게서 전달받은 입찰견적서 제안내용  
	 * 
	 * @param proposalInfo		   사용자가 입력한 제안내용
	 * @param proposalPrice		   사용자가 입력한 제안가격
	 * @param proposalStart		   사용자가 입력한 작업시작날짜
	 * @param proposalEnd		  사용자가 입력한 작업마감날짜
	 * @return					  처리된 행수
	 */
	public int insertProposal(Proposal proposal) {
		
		Connection conn = getConnection();
		
		int result = new ProjectDAO().insertProposal(conn, proposal);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}
	
}
