package com.gigsforgeeks.member.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.gigsforgeeks.member.model.dao.MemberDAO;
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
}
