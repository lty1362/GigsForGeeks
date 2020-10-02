package com.gigsforgeeks.service.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.service.model.dao.EnquiryDao;
import com.gigsforgeeks.service.model.vo.Enquiry;

public class EnquiryService {

	
	/**
	 * 1_1. 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new EnquiryDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/**
	 * 1_2. 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<Enquiry> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Enquiry> list = new EnquiryDao().selectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	
	/**
	 * 문의 추가하기
	 * @param enq
	 * @return
	 */
	public int insertEnquiry(Enquiry enq) {
		
		Connection conn = getConnection();
		
		int result = new EnquiryDao().insertEnquiry(conn, enq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 문의 답장하기
	 * @param enq
	 * @return
	 */
	public int updateAnswer(Enquiry enq) {
		
		Connection conn = getConnection();
		
		int result = new EnquiryDao().updateAnswer(conn, enq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 문의 상세조회
	 * @param noticeNo	 클릭한 공지사항 번호
	 * @return			 조회된 데이터가 담겨있는 Notice객체
	 */
	public Enquiry selectEnquiry(int enquiryNo) {
		
		Connection conn = getConnection();
		
		Enquiry enqNo = new EnquiryDao().selectEnquiry(conn, enquiryNo);
		
		close(conn);
		
		return enqNo;
		
	}
	
	
	
	
}
