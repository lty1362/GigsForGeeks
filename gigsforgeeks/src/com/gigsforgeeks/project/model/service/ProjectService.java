package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.member.model.vo.Member;
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
	 * 2_1. 내 프로젝트 총 갯수 조회 서비스
	 * 
	 * @param userId      조회할 사용자 아이디
	 * @param listType    조회할 리스트 타입 ("E" 고용주 / "F" 프리랜서)
	 * @return            조회된 프로젝트의 총 갯수
	 */
	public int selectMyProjectCount(String userId, String listType) {
		
		Connection con = getConnection();
		int projectCount = new ProjectDAO().selectMyProjectCount(con, userId, listType);
		close(con);
		return projectCount;
		
	}
	
	/**
	 * 2_2. 내 프로젝트 목록 조회 서비스
	 * 
	 * @param userId      현재 로그인한 사용자 아이디
	 * @param userType    조회할 리스트 타입 ("E" 고용주 / "F" 프리랜서)
	 * @return            해당 사용자의 등록/진행 프로젝트 목록
	 */
	public ArrayList<Project> selectMyProjectList(String userId, String listType) {
		
		Connection con = getConnection();
		ArrayList<Project> myProjectList = new ProjectDAO().selectMyProjectList(con, userId, listType);
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
	 * 5_1. 프로젝트 업데이트 총 갯수 조회 서비스
	 * 
	 * @param userId      조회할 사용자 아이디
	 * @param listType    조회할 리스트 타입 ("E" 고용주 / "F" 프리랜서)
	 * @return            조회된 프로젝트 업데이트 총 갯수
	 */
	public int selectUpdateCount(String userId) {
		
		Connection con = getConnection();
		int projectCount = new ProjectDAO().selectUpdateCount(con, userId);
		close(con);
		return projectCount;
		
	}
	
	/**
	 * 5_2. 프로젝트 업데이트 목록 조회 서비스
	 * 
	 * @param userId      현재 로그인한 사용자 아이디
	 * @param pi          페이징 정보를 담은 PageInfo 객체
	 * @return            업데이트 된 입찰 프로젝트 목록
	 */
	public ArrayList<Project> selectUpdateList(String userId, PageInfo pi) {
		
		Connection con = getConnection();
		ArrayList<Project> myProjectList = new ProjectDAO().selectUpdateList(con, userId, pi);
		close(con);
		return myProjectList;
		
	}
	
	/**
	 * 프로젝트 전체리스트 조회용 서비스
	 * 
	 * @return
	 */
	public ArrayList<Project> projectSelectList(){
		
		Connection conn = getConnection();
		
		ArrayList<Project> list = new ProjectDAO().searchListProject(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 프리랜서 전체리스트 조회용 서비스
	 * 
	 * @return
	 */
	public ArrayList<Member> freelancerSelectList(){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new ProjectDAO().freelancerSelectList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 탐색 클릭시 프로젝트 상세보기 서비스
	 * 
	 * @param projectId
	 * @param userId
	 * @return
	 */
	public Project projectSelectDetail(int projectId) {
		
		Connection conn = getConnection();
		
		Project myProject = new ProjectDAO().projectSelectDetail(conn, projectId);
		
		close(conn);
		
		return myProject;
		
	}
	
	/**
	 * 우수프리랜서만 조회하는 리스트 서비스
	 * @return
	 */
	public ArrayList<Member> excellentSelectList(){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new ProjectDAO().excellentSelectList(conn);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 진섭) 멤버 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ProjectDAO().selectProjectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 진섭) 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Project> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Project> list = new ProjectDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	
}
