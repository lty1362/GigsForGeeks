package com.gigsforgeeks.member.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.gigsforgeeks.member.model.dao.MemberDAO;
import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Member;


public class MemberService {


	/**
	 * 1. 로그인기능
	 * @param userId 	회원아이디
	 * @param userPwd	회원비밀번호
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginUser;
	}

	
	
	
	
	
	/**
	 * userId 기반 carrer 객체 전달
	 * @param userId 	회원아이디
	 * @param userCareer	회원 경력 객체
	 * @return 
	 */
	public Career searchCareer(String userId) {
		
		Connection conn = getConnection();
		
		Career userCareer = new MemberDAO().seachCareer(userId, conn);
				
		close(conn);
		
		return userCareer;
	}
}
