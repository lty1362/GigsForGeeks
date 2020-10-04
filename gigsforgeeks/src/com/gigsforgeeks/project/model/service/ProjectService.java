package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.project.model.dao.ProjectDAO;
import com.gigsforgeeks.project.model.vo.Project;

public class ProjectService {
	
	/**
	 * 1. 프로젝트 등록 서비스
	 * 
	 * @param project       사용자로부터 전달받은 프로젝트 객체
	 * @return              사용자가 요청한 프로젝트 객체 등록 성공/실패 여부
	 */
	public int insertProject(Project project) {
		
		Connection connection = getConnection();
		int result = new ProjectDAO().insertProject(connection, project);
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		close(connection);
		
		return result;
		
	}
	
	/**
	 * 2. 내 프로젝트 조회 서비스
	 * 
	 * @param userId    현재 로그인한 사용자 아이디
	 * @return          해당 사용자의 등록/진행 프로젝트 목록
	 */
	public ArrayList<Project> selectMyProjectList(String userId) {
		
		Connection con = getConnection();
		ArrayList<Project> myProjectList = new ProjectDAO().selectMyProjectList(con, userId);
		close(con);
		return myProjectList;
		
	}
	
	
	/**
	 * 프로젝트 검색목록을 조회해오는 메소드
	 * 
	 * @param project	프로젝트의 목록객체
	 * @return
	 */
	public ArrayList<Project> searchListProject(Project project) {
		
		Connection conn = getConnection();
		
		ArrayList<Project> list = new ProjectDAO().searchListProject(conn, project);
		
		close(conn);
		
		return list;
	}
	
}
