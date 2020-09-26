package com.gigsforgeeks.project.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.gigsforgeeks.common.JDBCTemplate.*;
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
	 * @param project       사용자로부터 전달받은 프로젝트 객체
	 * @param connection    Service로부터 받은 DB Connection 객체
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
			System.out.println(statement); // test code
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
	 * @param con
	 * @param userId
	 * @return
	 */
	public ArrayList<Project> selectMyProject(Connection con, String userId) {
		
		ArrayList<Project> myProject = null;
		
		
		
		return myProject;
		
	}
	
}
