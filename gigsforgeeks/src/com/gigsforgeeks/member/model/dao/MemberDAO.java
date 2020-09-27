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
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Portfolio;
import com.gigsforgeeks.member.model.vo.Publication;

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
						       rset.getString("LOCATION"),
						       rset.getString("SELF_INTRODUCTION")
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
	 * 경력부분 데이터 db에서 뽑아와서 Career 객체에 담기
	 * @param userId 로그인한 유저아이디
	 * @param conn
	 * @return c career 객체
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

	/**
	 * 2_1. 아이디 중복검사
	 * @param conn
	 * @param checkId
	 * @return
	 */
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	/**
	 * 경력부분 데이터 db에서 뽑아와서 Publication 객체에 담기
	 * @param  userId 로그인한 유저아이디
	 * @param  conn
	 * @return Publication p 객체
	 */
	public Publication seachPublication(String userId, Connection conn) {
		
		Publication p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userPublication");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				p = new Publication(rset.getInt("BOOK_NO"),
							  rset.getString("BOOK_NAME"),
							  rset.getString("BOOK_INFO"),
							  rset.getString("PUBLISHER"),
							  rset.getString("BOOK_DATE"),
							  rset.getString("USER_ID")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}

	
	/**
	 * 경력부분 데이터 db에서 뽑아와서 Portfolio 객체에 담기
	 * @param  userId 로그인한 유저아이디
	 * @param  conn
	 * @return Portfolio port 객체
	 */
	public Portfolio seachPortfolio(String userId, Connection conn) {
		
		Portfolio port = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userPortfolio");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				port= new Portfolio(rset.getInt("PORTFOLIO_NO"),
							  rset.getString("PORTFOLIO_TITLE"),
							  rset.getString("PORTFOLIO_CONTENTS"),
							  rset.getString("PORTFOLIO_LINK"),
							  rset.getString("PORTFOLIO_SKILL"),
							  rset.getDate("PORTFOLIO_START"),
							  rset.getDate("PORTFOLIO_END"),
							  rset.getString("USER_ID"),
							  rset.getString("PORTFOLIO_FILE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return port;
	}


	/**
	 * 경력부분 데이터 db에서 뽑아와서  Certificate 객체에 담기
	 * @param userId 로그인한 유저아이디
	 * @param conn
	 * @return Certificate certificate 객체
	 */
	public Certificate seachCertficate(String userId, Connection conn) {
		
		Certificate certificate = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userCertification");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				certificate= new Certificate(rset.getInt("CERTIFICATE_NO"),
							  rset.getString("CERTIFICATE_NAME"),
							  rset.getString("CERTIFICATE_AUTH"),
							  rset.getString("CERTIFICATE_DATE"),
							  rset.getString("USER_ID")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return certificate;
	}


	/**
	 * 경력부분 데이터 db에서 뽑아와서 Education 객체에 담기
	 * @param  userId 로그인한 유저아이디
	 * @param  conn
	 * @return Education edu 객체
	 */
	public Education seachEducation(String userId, Connection conn) {

		Education edu =null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userEducation");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				edu= new Education(rset.getInt("EDUCATION_NO"),
							  rset.getString("UNIVERSITY"),
							  rset.getString("MAJOR"),
							  rset.getString("DEGREE"),
							  rset.getString("ENROLL_DATE"),
							  rset.getString("GRAUATED_DATE"),
							  rset.getString("USER_ID")
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return edu;
	}
	
}
