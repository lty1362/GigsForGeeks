package com.gigsforgeeks.member.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;
import java.sql.Connection;

import com.gigsforgeeks.member.model.dao.MemberDAO;
import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Portfolio;
import com.gigsforgeeks.member.model.vo.Publication;

public class MemberService {

	/**
	 * 1. 로그인기능
	 * 
	 * @param userId  회원아이디
	 * @param userPwd 회원비밀번호
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {

		Connection conn = getConnection();

		Member loginUser = new MemberDAO().loginMember(conn, userId, userPwd);

		close(conn);

		return loginUser;
	}

	/**
	 * 2. 회원가입
	 * 
	 * @param m (아이디,이메일,비밀번호,회원유형)
	 * @return
	 */
	public int insertMember(Member m) {

		Connection conn = getConnection();

		int result = new MemberDAO().insertMember(conn, m);
		
		int result2 = new MemberDAO().insertCareer(conn, m);
		int result3 = new MemberDAO().insertCertificate(conn, m);
		int result4 = new MemberDAO().insertEducation(conn, m);
		int result5 = new MemberDAO().insertPortfolio(conn, m);
		int result6 = new MemberDAO().insertPublication(conn, m);

		if (result > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0) {
			commit(conn);
			
			result = 1;
		} else {
			rollback(conn);
			result = 0;
		}

		close(conn);

		return result;
	}

	/**
	 * 2_1. 아이디 중복검사
	 * 
	 * @param checkId
	 * @return
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();

		int count = new MemberDAO().idCheck(conn, checkId);

		close(conn);

		return count;
	}

	
	
	
	/**
	 * userId 기반 userEducation 객체 전달
	 * 
	 * @param userId     회원아이디
	 * @param userEducation 회원 경력 객체
	 * @return
	 */
	public Education searchEducation(String userId) {

		Connection conn = getConnection();

		Education userEducation = new MemberDAO().seachEducation(userId, conn);

		close(conn);

		return userEducation;
	}

	/**
	 * userId 기반 userCertficate 객체 전달
	 * 
	 * @param userId     회원아이디
	 * @param userCertficate 회원 자격증정보 객체
	 * @return
	 */
	public Certificate searchCertificate(String userId) {
		Connection conn = getConnection();

		Certificate userCertficate = new MemberDAO().seachCertficate(userId, conn);

		close(conn);

		return userCertficate;
	}

	/**
	 * userId 기반 userPortfolio 객체 전달
	 * 
	 * @param userId     회원아이디
	 * @param userPortfolio 회원 포트폴리오정보 객체
	 * @return
	 */
	public Portfolio searchPortfolio(String userId) {
		Connection conn = getConnection();

		Portfolio userPortfolio = new MemberDAO().seachPortfolio(userId, conn);

		close(conn);

		return userPortfolio;
	}

	/**
	 * userId 기반 userPublication 객체 전달
	 * 
	 * @param userId     회원아이디
	 * @param userPublication 회원 출판물정보 객체
	 * @return
	 */
	public Publication searchPublication(String userId) {
		Connection conn = getConnection();

		Publication userPublication = new MemberDAO().seachPublication(userId, conn);

		close(conn);

		return userPublication;
	}

	/**
	 * userId 기반 userCareer 객체 전달
	 * 
	 * @param userId     회원아이디
	 * @param userCareer 회원 경력 객체
	 * @return
	 */
	public Career searchCareer(String userId) {

		Connection conn = getConnection();

		Career userCareer = new MemberDAO().seachCareer(userId, conn);

		close(conn);

		return userCareer;
	}
}