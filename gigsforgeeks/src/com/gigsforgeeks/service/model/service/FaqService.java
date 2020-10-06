package com.gigsforgeeks.service.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.service.model.dao.FaqDao;
import com.gigsforgeeks.service.model.vo.FAQ;

public class FaqService {

	
	/**
	 * 화면 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/**
	 * 관리자 조회
	 * @return
	 */
	public int adminSelectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new FaqDao().adminSelectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 화면>> 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<FAQ> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = new FaqDao().selectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	
	/**
	 * 관리자화면>> 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<FAQ> adminSelectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = new FaqDao().adminSelectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	/**
	 * FAQ 추가하기
	 * @param enq
	 * @return
	 */
	public int insertFaq(FAQ enq) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().insertFaq(conn, enq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 5. 공지사항 수정용 서비스
	 * @param n		수정할 제목, 수정할 내용, 수정하고자하는글번호 담겨있는 Notice 객체
	 * @return		처리된 행 수
	 */
	public int updateCheckFaq(int faqNo) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().updateCheckFaq(conn, faqNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
