package com.gigsforgeeks.member.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		
		String filName = MemberDAO.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 1. 로그인 기능
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("USER_ID"),
						       rset.getString("USER_EMAIL"),
						       rset.getString("USER_PWD"),
						       rset.getDate("ENROLL_DATE"),
						       rset.getDate("OUTROLL_DATE"),
						       rset.getString("STATUS"),
						       rset.getString("MEMBERSHIP"),
						       rset.getString("EXCELLENT_FREELANCE"),
						       rset.getString("BLACKLIST"),
						       rset.getString("IDENTIFY_EMAIL"),
						       rset.getString("ADMIN"),
						       rset.getString("USER_TYPE"),
						       rset.getString("JOB_TITLE"),
						       rset.getString("COMPANY"),
						       rset.getString("SKILL"),
						       rset.getInt("PAY_RATE"),
						       rset.getString("PROFILE_IMAGE"),
						       rset.getString("LOCATION")
							   );
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}


	
	/**
	 * 로그인한 유저의 경력 객체 db에서 가져오기
	 * @param userId 로그인한 유저아이디
	 * @param conn
	 * @return
	 */
	public Career seachCareer(String userId, Connection conn) {
		
		Career c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userCareer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c= new Career(rset.getInt("CAREER_NO"),
							  rset.getString("USER_ID"),
							  rset.getString("COMPANY_INFO"),
							  rset.getString("CAREER_TITLE"),
							  rset.getDate("RETIRE_DATE"),
							  rset.getDate("HIRE_DATE"),
							  rset.getString("CAREER_INFO"),
							  rset.getString("CAREER_STATUS")
						);
			}
				
			

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return c;
	}

	/**
	 * 2. 회원가입
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertMember(Connection conn, Member m) {
		
		   int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("insertMember");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        pstmt.setString(2, m.getUserEmail());
	        pstmt.setString(3, m.getUserPwd());
	        pstmt.setString(4, m.getUserType());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}
	
}
