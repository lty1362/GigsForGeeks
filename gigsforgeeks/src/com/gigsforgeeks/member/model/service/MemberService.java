package com.gigsforgeeks.member.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.gigsforgeeks.member.model.dao.MemberDAO;
import com.gigsforgeeks.member.model.vo.Member;


public class MemberService {

	/*login*/
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginUser;
	}
}
