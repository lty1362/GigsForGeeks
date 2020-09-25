package com.gigsforgeeks.project.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.gigsforgeeks.project.model.vo.Proposal;

public class ProposalDAO {
	
	private Properties properties = new Properties();
	

	public ProposalDAO() {
		
		
		String fileName = ProposalDAO.class.getResource("/sql/project/proposal-mapper.xml").getPath();
		
		try {
			properties.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
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
			
			pstmt.setString(1, proposal.getProposalProjectId());
			pstmt.setString(2, proposal.getProposalUserId());
			pstmt.setString(3, proposal.getProposalInfo());
			pstmt.setInt(4, proposal.getProposalPrice());
			pstmt.setDate(5, java.sql.Date.valueOf(proposal.getProposalStart()));
			pstmt.setDate(6, java.sql.Date.valueOf(proposal.getProposalEnd()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
