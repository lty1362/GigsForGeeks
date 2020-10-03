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

import com.gigsforgeeks.project.model.vo.Project;

public class ProjectDAO {
	
	private Properties properties = new Properties();
	
	/**
	 * 외부 Properties에 담긴 SQL문을 필요한 메서드에서 꺼내쓸 수 있게 하는 DAO 생성자
	 */
	public ProjectDAO() {
		
		String fileName = ProjectDAO.class.getResource("/sql/project/project-mapper.xml").getPath();
		try {
			properties.loadFromXML(new FileInputStream(fileName));
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
	public int insertProject(Connection connection, Project project) {
		
		int result = 0;
		
		PreparedStatement statement = null;
		String sql = properties.getProperty("insertProject");
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, project.getClientId());
			statement.setString(2, project.getRequiredSkill());
			statement.setString(3, project.getProjectName());
			statement.setString(4, project.getDescription());
			statement.setDate(5, java.sql.Date.valueOf(project.getExpectStart()));
			statement.setDate(6, java.sql.Date.valueOf(project.getExpectEnd()));
			statement.setString(7, project.getMeansOfPayment());
			statement.setInt(8, project.getMinBid());
			statement.setInt(9, project.getMaxBid());
			statement.setDate(10, java.sql.Date.valueOf(project.getEndBid()));
			// System.out.println(statement); // test code
			result = statement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(statement);
			
		}
		
		return result;
		
	}
	
	/**
	 * 2. 내 프로젝트 조회 DAO
	 * 
	 * @param con       Service로부터 받은 DB Connection 객체
	 * @param userId    현재 로그인한 사용자 아이디
	 * @return          해당 사용자의 등록/진행 프로젝트 목록
	 */
	public ArrayList<Project> selectMyProject(Connection con, String userId) {
		
		ArrayList<Project> myProject = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = properties.getProperty("selectMyProject");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				myProject.add(new Project(rs.getString("project_id"),
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
		
		return myProject;
		
	}
	
	
	public ArrayList<Project> searchListProject(Connection conn, Project project) {
		
		// select문 => 여러행조회
		ArrayList<Project> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = properties.getProperty("searchListProject");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, project.getMinBid());
			pstmt.setInt(2, project.getMaxBid());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Project(rset.getString("project_id"),
									 rset.getString("project_name"),
									 rset.getString("project_status"),
									 rset.getString("description"),
									 rset.getDate("end_bid").toLocalDate(),
									 rset.getInt("min_bid"),
									 rset.getInt("max_bid"),
									 rset.getInt("count_bid")));
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
