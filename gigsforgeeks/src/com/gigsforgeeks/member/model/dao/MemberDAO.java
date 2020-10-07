package com.gigsforgeeks.member.model.dao;

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

import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Portfolio;
import com.gigsforgeeks.member.model.vo.Publication;
import com.gigsforgeeks.project.model.vo.PageInfo;

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
						       rset.getString("ENROLL_DATE"),
						       rset.getString("OUTROLL_DATE"),
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
	 * 출판물부분 데이터 db에서 뽑아와서 Publication 객체에 담기
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
							  rset.getString("RETIRE_DATE"),
							  rset.getString("HIRE_DATE"),
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
	 * 포트폴리오부분 데이터 db에서 뽑아와서 Portfolio 객체에 담기
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
							  rset.getString("PORTFOLIO_START"),
							  rset.getString("PORTFOLIO_END"),
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
	 * 자격증부분 데이터 db에서 뽑아와서  Certificate 객체에 담기
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
	 * 교육부분 데이터 db에서 뽑아와서 Education 객체에 담기
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


	
	/**
	 * 
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertCareer(Connection conn, Member m) {
		 int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("createCareer");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}

	/**
	 * 
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertCertificate(Connection conn, Member m) {
		 int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("createCertificate");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}

	/**
	 * 
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertEducation(Connection conn, Member m) {
		 int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("createEducation");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}

	/**
	 * 
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertPortfolio(Connection conn, Member m) {
		 int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("createPortfolio");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}

	/**
	 * 
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertPublication(Connection conn, Member m) {
		 int result =  0;
		   
		   PreparedStatement pstmt = null;
		   
		   String sql = prop.getProperty("createPublication");
		   
		   try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, m.getUserId());
	        
	        result = pstmt.executeUpdate();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				
			close(pstmt);
		}
		   
		return result;
	}


	public int updateUser(String userId, Member updateMember, Connection conn) {
		
		
		PreparedStatement pstmt = null;
		
		int result =0;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateMember.getLocation());
			pstmt.setString(2, updateMember.getCompany());
			pstmt.setString(3, updateMember.getSelfIntroduction());
			pstmt.setInt(4, updateMember.getPayRate());
			pstmt.setString(5, updateMember.getJobTitle());
			pstmt.setString(6, userId);
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	public int updatePortfolio(String userId, Portfolio updatePortfolio, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePortfolio");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePortfolio.getPortfolioTitle());
			pstmt.setString(2, updatePortfolio.getPortfolioLink());
			pstmt.setString(3, updatePortfolio.getPortfolioContent());
			pstmt.setString(4, updatePortfolio.getPortfolioStart());
			pstmt.setString(5, updatePortfolio.getPortfolioEnd());
			pstmt.setString(6, updatePortfolio.getPortfolioSkill());
			pstmt.setString(7, userId);
			
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	public int updateCareer(String userId, Career updateCareer, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCareer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateCareer.getCompanyInfo());
			pstmt.setString(2, updateCareer.getCareerTitle());
			pstmt.setString(3, updateCareer.getCareerInfo());
			pstmt.setString(4, updateCareer.getHireDate());
			pstmt.setString(5, updateCareer.getRetireDate());
			pstmt.setString(6, userId);
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	public int updateEducation(String userId, Education updateEducation, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateEducation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateEducation.getUniversity());
			pstmt.setString(2, updateEducation.getMajor());
			pstmt.setString(3, updateEducation.getDegree());
			pstmt.setString(4, updateEducation.getEnrollDate());
			pstmt.setString(5, updateEducation.getGrauatedDate());
			pstmt.setString(6, userId);
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	public int updateCertificate(String userId, Certificate updateCertificate, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCertificate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateCertificate.getcetificateName());
			pstmt.setString(2, updateCertificate.getcetificateAuth());
			pstmt.setString(3, updateCertificate.getcetificateDate());
			pstmt.setString(4, userId);
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	public int updatePublication(String userId, Publication updatePublication, Connection conn) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePublication");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePublication.getBookName());
			pstmt.setString(2, updatePublication.getBookInfo());
			pstmt.setString(3, updatePublication.getPublisher());
			pstmt.setString(4, updatePublication.getBookDate());
			pstmt.setString(5, userId);
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}


	/**
	 * 진섭 : 회원조회 페이징 ListCount
	 * @param conn
	 * @return
	 */
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
	 * 진섭: 회원조회 배열
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
		// select 문 => 여러행 조회
		ArrayList<Member> list = new ArrayList<>();
		
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
				list.add(new Member(rset.getString("USER_ID"),
							        rset.getString("USER_EMAIL"),
							        rset.getString("USER_PWD"),
							        rset.getString("ENROLL_DATE"),
							        rset.getString("OUTROLL_DATE"),
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
	
	public Member freelancerSelectDetail(Connection conn, String userId) {
		
		Member member = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("freelancerSelectDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("USER_ID"),
										rset.getString("USER_EMAIL"),
										rset.getString("USER_PWD"),
										rset.getString("ENROLL_DATE"),
										rset.getString("OUTROLL_DATE"),
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
										rset.getString("SELF_INTRODUCTION"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
		
	}
		
		
	

}
