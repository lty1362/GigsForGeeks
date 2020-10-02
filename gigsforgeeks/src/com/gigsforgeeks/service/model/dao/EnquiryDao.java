package com.gigsforgeeks.service.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.gigsforgeeks.project.model.vo.PageInfo;
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
	
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}
	
	
	public ArrayList<Enquiry> selectList(Connection conn, PageInfo pi){
		// select 문 => 여러행 조회
		ArrayList<Enquiry> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * ex) boardLimit : 10 라는 가정하에 
			 * currentPage = 1		=> startRow : 1    endRow : 10
			 * currentPage = 2		=> startRow : 11   endRow : 20
			 * currentPage = 3		=> startRow : 21   endRow : 30
			 * 
			 * startRow = (currentPage - 1) * boardLimit + 1
			 * endRow   = startRow + boardLimit - 1
			 */
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Enquiry(rset.getInt("ENQ_NO"),
								     rset.getString("USER_ID"),
								     rset.getString("ENQUIRY_TYPE"),
								     rset.getString("ENQUIRY_TITLE"),
								     rset.getDate("ENQUIRY_DATE"),
								     rset.getString("ANSWER_STATE"),
								     rset.getDate("ANSWER_DATE")
								     )
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	
	/**
	 * 회원 문의등록
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
		
		return result;
		
	}
	
	
	/**
	 * 문의 조회-답장조회
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public Enquiry selectEnquiry(Connection conn, int enquiryNo) {
		// select문 => 한 행
		Enquiry enqNo = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEnquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, enquiryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				enqNo = new Enquiry(rset.getInt("ENQ_NO"),
									rset.getString("USER_ID"),
									rset.getString("ENQUIRY_TYPE"),
									rset.getString("ENQUIRY_TITLE"),
									rset.getDate("ENQUIRY_DATE"),
									rset.getString("ENQUIRY_CONTENT"),
									rset.getString("ANSWER_CONTENT"), 
									rset.getString("ANSWER_STATE"),
									rset.getDate("ANSWER_DATE")
								 	);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enqNo;
	}
	
	
	/**
	 * 관리자 문의 답장하기
	 * @param conn
	 * @param enq
	 * @return
	 */
	public int updateAnswer(Connection conn, Enquiry enq) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			
			pstmt.setString(1, enq.getAnswerContent());
			pstmt.setInt(2, enq.getEnquiryNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 회원 내 문의보기 Count
	 * @param conn
	 * @return
	 */
	public int enqSelectListCount(Connection conn, String userId) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("enqSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	/**
	 * 회원 내 문의내역 조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Enquiry> enqSelectList(Connection conn, PageInfo pi, String userId){
		// select 문 => 여러행 조회
		ArrayList<Enquiry> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("enqSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Enquiry(rset.getInt("ENQ_NO"),
								     rset.getString("USER_ID"),
								     rset.getString("ENQUIRY_TYPE"),
								     rset.getString("ENQUIRY_TITLE"),
								     rset.getDate("ENQUIRY_DATE"),
								     rset.getString("ENQUIRY_CONTENT"),
								     rset.getString("ANSWER_CONTENT"),
								     rset.getString("ANSWER_STATE"),
								     rset.getDate("ANSWER_DATE")
								     )
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(list);
		
		return list;
		
	}
	
		
}
