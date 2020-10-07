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
import com.gigsforgeeks.service.model.vo.FAQ;

public class FaqDao {

	private Properties prop = new Properties();
	
	/**
	 *  sql문 불러오기
	 */
	public FaqDao() {
		
		String fileName = EnquiryDao.class.getResource("/sql/service/faq-mapper.xml").getPath();
		
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
	
	
	/**
	 * 관리자 리스트카운트
	 * @param conn
	 * @return
	 */
	public int adminSelectListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListCount");
		
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
	
	
	public ArrayList<FAQ> selectList(Connection conn, PageInfo pi){
		// select 문 => 여러행 조회
		ArrayList<FAQ> list = new ArrayList<>();
		
		// 바꿔야함
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("FAQ_NO"),
								 rset.getString("FAQ_CATEGORY"),
								 rset.getString("FAQ_TITLE"),
								 rset.getString("FAQ_CONTENT"),
								 rset.getInt("FAQ_COUNT"),
								 rset.getString("FAQ_STATE"),
								 rset.getDate("FAQ_REGISTER"),
								 rset.getDate("FAQ_UPDATE")
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
	 * 관리자 조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<FAQ> adminSelectList(Connection conn, PageInfo pi){
		// select 문 => 여러행 조회
		ArrayList<FAQ> list = new ArrayList<>();
		
		// 바꿔야함
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("FAQ_NO"),
								 rset.getString("FAQ_CATEGORY"),
								 rset.getString("FAQ_TITLE"),
								 rset.getString("FAQ_CONTENT"),
								 rset.getInt("FAQ_COUNT"),
								 rset.getString("FAQ_STATE"),
								 rset.getDate("FAQ_REGISTER"),
								 rset.getDate("FAQ_UPDATE")
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
	 * 회원 FAQ등록
	 * @param conn
	 * @param enq
	 * @return
	 */
	public int insertFaq(Connection conn, FAQ enq) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			
			pstmt.setString(1, enq.getFaqCategory());
			pstmt.setString(2, enq.getFaqTitle());
			pstmt.setString(3, enq.getFaqContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateCheckFaq(Connection conn, int faqNo) {
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCheckFaq");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql
			
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}	
	
}
