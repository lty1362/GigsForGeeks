package com.gigsforgeeks.service.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.gigsforgeeks.service.model.vo.Enquiry;

public class EnquiryDao {
	
	private Properties prop = new Properties();
	
	/**
	 *  sql문 불러오기
	 */
	public EnquiryDao() {
		
		String fileName = EnquiryDao.class.getResource("/sql/service/enquiry-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * @param conn
	 * @param enq
	 * @return
	 */
	public int insertEnquiry(Connection conn, Enquiry enq) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEnquiry");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			
			pstmt.setString(1, enq.getUserId());
			pstmt.setString(2, enq.getEnquiryType());
			pstmt.setString(3, enq.getEnquiryTitle());
			pstmt.setString(4, enq.getEnquiryContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println(result);
		return result;
		
	}
	
		
}
