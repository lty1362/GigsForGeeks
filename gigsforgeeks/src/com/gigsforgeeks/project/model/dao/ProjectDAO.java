package com.gigsforgeeks.project.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.project.model.vo.Project;

public class ProjectDAO {
	
	private Properties prop = new Properties();
	
	/**
	 * 외부 Properties에 담긴 SQL문을 필요한 메서드에서 꺼내쓸 수 있게 하는 DAO 생성자
	 */
	public ProjectDAO() {
		
		String fileName = ProjectDAO.class.getResource("/sql/project/project-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 1. 프로젝트 등록 DAO
	 * 
	 * @param connection    Service로부터 받은 DB Connection 객체
	 * @param project       사용자로부터 전달받은 프로젝트 객체
	 * @return              사용자가 요청한 프로젝트 객체 등록 성공/실패 여부
	 */
	public int insertProject(Connection con, Project project) {
		
		int result = 0;
		
		PreparedStatement stmt = null;
		String sql = prop.getProperty("insertProject");
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, project.getClientId());
			stmt.setString(2, project.getRequiredSkill());
			stmt.setString(3, project.getProjectName());
			stmt.setString(4, project.getDescription());
			stmt.setDate(5, java.sql.Date.valueOf(project.getExpectStart()));
			stmt.setDate(6, java.sql.Date.valueOf(project.getExpectEnd()));
			stmt.setString(7, project.getMeansOfPayment());
			stmt.setInt(8, project.getMinBid());
			stmt.setInt(9, project.getMaxBid());
			stmt.setDate(10, java.sql.Date.valueOf(project.getEndBid()));
			result = stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(stmt);
		}
		
		return result;
		
	}
	
	/**
	 * 2. 내 프로젝트 목록 조회 DAO
	 * 
	 * @param con       Service로부터 받은 DB Connection 객체
	 * @param userId    현재 로그인한 사용자 아이디
	 * @return          해당 사용자의 등록/진행 프로젝트 목록
	 */
	public ArrayList<Project> selectMyProjectList(Connection con, String userId, String userType) {
		
		ArrayList<Project> myProjectList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		if(userType.equals("F")) { // 프리랜서의 경우
			sql = prop.getProperty("selectMyBidProjectList");
		}else { // 고용주의 경우
			sql = prop.getProperty("selectMyProjectList");
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				myProjectList.add(new Project(rs.getInt("project_id"),
						                      rs.getString("client_id"),
						                      rs.getString("required_skill"),
						                      rs.getString("project_name"),
						                      rs.getString("description"),
						                      rs.getString("project_status"),
						                      rs.getDate("expect_start").toLocalDate(),
						                      rs.getDate("expect_end").toLocalDate(),
						                      rs.getString("means_of_payment"),
						                      rs.getInt("min_bid"),
						                      rs.getInt("max_bid"),
						                      rs.getDate("start_bid").toLocalDate(),
						                      rs.getDate("end_bid").toLocalDate(),
						                      rs.getInt("count_bid"),
						                      rs.getInt("average_bid"),
						                      rs.getString("winner_id"),
						                      rs.getInt("winning_bid"),
						                      (rs.getDate("start_date") == null ? null : rs.getDate("start_date").toLocalDate()),
						                      (rs.getDate("end_date") == null ? null : rs.getDate("start_date").toLocalDate())));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return myProjectList;
		
	}
	
	/**
	 * 3. 내 프로젝트 상세조회 DAO
	 * 
	 * @param con          Service로부터 받은 DB Connection 객체
	 * @param projectId    상세조회 요청한 프로젝트 아이디
	 * @param userId       해당 프로젝트의 고용주 / 낙찰자 아이디
	 * @return             해당 프로젝트 아이디와 일치하는 조회된 내 Project 객체
	 */
	public Project selectMyProject(Connection con, int projectId, String userId) {
		
		Project myProject = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectMyProject");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, projectId);
			pstmt.setString(2, userId);
			pstmt.setString(3, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				myProject = new Project(rs.getInt("project_id"),
										rs.getString("client_id"),
										rs.getString("required_skill"),
										rs.getString("project_name"),
										rs.getString("description"),
										rs.getString("project_status"),
										rs.getDate("expect_start").toLocalDate(),
										rs.getDate("expect_end").toLocalDate(),
										rs.getString("means_of_payment"),
										rs.getInt("min_bid"),
										rs.getInt("max_bid"),
										rs.getDate("start_bid").toLocalDate(),
										rs.getDate("end_bid").toLocalDate(),
										rs.getInt("count_bid"),
										rs.getInt("average_bid"),
										rs.getString("winner_id"),
										rs.getInt("winning_bid"),
										(rs.getDate("start_date") == null ? null : rs.getDate("start_date").toLocalDate()),
										(rs.getDate("end_date") == null ? null : rs.getDate("start_date").toLocalDate()));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return myProject;
		
	}
	
	/**
	 * 4. 내 프로젝트 삭제 DAO
	 * 
	 * @param con        Service로부터 받은 DB Connection 객체
	 * @param project    삭제 요청한 프로젝트 객체
	 * @param userId     해당 프로젝트의 고용주 / 낙찰자 아이디
	 * @return           해당 프로젝트 삭제 성공/실패 여부
	 */
	public int deleteMyProject(Connection con, Project project, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "";
		if(userId.equals(project.getClientId())) {
			sql = prop.getProperty("deleteMyProject");
		}else if(userId.equals(project.getWinnerId())) {
			sql = prop.getProperty("deleteMyBid");
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, project.getProjectId());
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int selectListCount(Connection conn, Project project) {
		// select=> 한행조회
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, project.getMinBid());
			pstmt.setInt(2, project.getMaxBid());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
		
	}
	
	
	public ArrayList<Project> searchListProject(Connection conn, PageInfo pi, Project project) {
		// select문 => 여러행조회
		ArrayList<Project> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM (";
		sql += prop.getProperty("searchListProject");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		sql += " ORDER BY PLAN_NO DESC) A) WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, project.getMinBid());
			pstmt.setInt(2, project.getMaxBid());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
						Project p = new Project();
						p.setProjectId(rset.getInt("project_id"));
						p.setProjectName(rset.getString("project_name"));
						p.setProjectStatus(rset.getString("project_status"));
						p.setDescription(rset.getString("description"));
						p.setEndBid(rset.getDate("end_bid").toLocalDate());
						p.setMinBid(rset.getInt("min_bid"));
						p.setMaxBid(rset.getInt("max_bid"));
						p.setCountBid(rset.getInt("count_bid"));
						
						list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
			
		return list;
		
	}
	
}
