package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.project.model.dao.ProjectDAO;
import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.project.model.vo.Project;

public class ProjectService {
	
	/**
	 * 1. 프로젝트 등록 서비스
	 * 
	 * @param project       사용자로부터 전달받은 프로젝트 객체
	 * @return              사용자가 요청한 프로젝트 객체 등록 성공/실패 여부
	 */
	public int insertProject(Project project) {
		
		Connection con = getConnection();
		
		int result = new ProjectDAO().insertProject(con, project);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
		
	}
	
	/**
	 * 2. 내 프로젝트 목록 조회 서비스
	 * 
	 * @param userId    현재 로그인한 사용자 아이디
	 * @return          해당 사용자의 등록/진행 프로젝트 목록
	 */
	public ArrayList<Project> selectMyProjectList(String userId, String userType) {
		
		Connection con = getConnection();
		ArrayList<Project> myProjectList = new ProjectDAO().selectMyProjectList(con, userId, userType);
		close(con);
		return myProjectList;
		
	}
	
	/**
	 * 3. 내 프로젝트 상세조회 서비스
	 * 
	 * @param projectId    상세조회 요청한 프로젝트 아이디
	 * @param userId       해당 프로젝트의 고용주 / 낙찰자 아이디
	 * @return             해당 프로젝트 아이디와 일치하는 조회된 Project 객체
	 */
	public Project selectMyProject(int projectId, String userId) {
		
		Connection con = getConnection();
		Project myProject = new ProjectDAO().selectMyProject(con, projectId, userId);
		close(con);
		return myProject;
		
	}
	
	/**
	 * 4. 내 프로젝트 삭제 DAO
	 * 
	 * @param project    삭제 요청한 프로젝트 객체
	 * @param userId     해당 프로젝트의 고용주 / 낙찰자 아이디
	 * @return           해당 프로젝트 삭제 성공/실패 여부
	 */
	public int deleteMyProject(Project project, String userId) {
		
		Connection con = getConnection();
		
		int result = new ProjectDAO().deleteMyProject(con, project, userId);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
		
	}
	
	/**
	 * 프로젝트 상세검색시 한행 조회해오는 메소드
	 */
	public int selectListCount(Project project) {
		
		Connection conn = getConnection();
		
		int listCount = new ProjectDAO().selectListCount(conn, project);
		
		if(listCount > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return listCount;
		
	}
	
	
	/**
	 * 프로젝트 상세검색시 여러행 조회해오는 메소드
	 * 
	 * @param project	프로젝트의 목록객체
	 * @return
	 */
	public ArrayList<Project> searchListProject(PageInfo pi, Project project) {
		
		Connection conn = getConnection();
		
		ArrayList<Project> list = new ProjectDAO().searchListProject(conn, pi, project);
		
		close(conn);
		
		return list;
		
	}
	
}
