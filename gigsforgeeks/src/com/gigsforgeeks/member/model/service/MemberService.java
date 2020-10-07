package com.gigsforgeeks.member.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.member.model.dao.MemberDAO;
import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Portfolio;
import com.gigsforgeeks.member.model.vo.Publication;
import com.gigsforgeeks.project.model.vo.PageInfo;

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



	public int updateProfile(String userId, Member updateMember) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updateUser(userId, updateMember, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}

	public int updatePortfolio(String userId, Portfolio updatePortfolio) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updatePortfolio(userId, updatePortfolio, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}

	public int updateCareer(String userId, Career updateCareer) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updateCareer(userId, updateCareer, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}

	public int updateEducation(String userId, Education updateEducation) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updateEducation(userId, updateEducation, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}

	public int updateCertificate(String userId, Certificate updateCertificate) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updateCertificate(userId, updateCertificate, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}

	public int updatePublication(String userId, Publication updatePublication) {
		Connection conn = getConnection();
		
		int result  =0;
		
		result = new MemberDAO().updatePublication(userId, updatePublication, conn);
		
		if(result <0) {
			result = 0;
		}
		
		return result;
	}
	
	
	
	
	
	/**
	 * 진섭) 멤버 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MemberDAO().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/**
	 * 진섭) 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	/**
	 * 성희) 탐색 프리랜서 클릭시 상세조회 서비스
	 * @return
	 */
	public Member freelancerSelectDetail(String userId) {
		
		Connection conn = getConnection();
		
		Member member = new MemberDAO().freelancerSelectDetail(conn, userId);
		
		close(conn);
		
		return member;
		
	}
	
	
}