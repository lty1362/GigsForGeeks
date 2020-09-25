package com.gigsforgeeks.project.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.gigsforgeeks.common.JDBCTemplate.*;
import com.gigsforgeeks.project.model.vo.Project;
import com.gigsforgeeks.project.model.vo.Proposal;

public class ProjectDAO {
	
	private Properties properties = new Properties();
	
	public ProjectDAO() {
		
		String fileName = ProjectDAO.class.getResource("/sql/project/project-mapper.xml").getPath();
		try {
			properties.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 사용자로부터 등록할 프로젝트의 정보를 전달받아서 
	 * 해당 프로젝트 정보를 DB에 등록하고 성공 여부를 반환하는 메서드
	 * 
	 * @param project 클라이언트 서버의 사용자로부터 전달받은 프로젝트 객체
	 * @param connection Service 클래스로부터 받은 DB서버와의 Connection 객체
	 * @return 클라이언트 서버가 요청한 프로젝트 객체 DB서버 등록 성공여부
	 */
	public int insertProject(Project project, Connection connection) {
		
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
	 * 사용자에게서 전달받은 입찰견적서 제안내용
	 */
	public int insertProposal(Connection conn, Proposal proposal) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = properties.getProperty("insertProposal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, proposal.getProposalInfo());
			pstmt.setInt(2, proposal.getProposalPrice());
			pstmt.setDate(3, proposal.getProposalStart());
			pstmt.setDate(4, proposal.getProposalEnd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
}
