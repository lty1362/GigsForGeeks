package com.gigsforgeeks.member.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	/*login*/
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
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
	
}
