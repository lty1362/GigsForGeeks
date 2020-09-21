package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;

import com.gigsforgeeks.project.model.dao.ProjectDAO;
import com.gigsforgeeks.project.model.vo.Project;

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
	
}
