package com.gigsforgeeks.service.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.service.model.dao.FaqDao;
import com.gigsforgeeks.service.model.vo.FAQ;

public class FaqService {

	
	/**
	 * 1_1. 총 일반게시글 갯수 조회용 서비스
	 * @return		총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 1_2. 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi		현재요청한페이지, 게시글최대갯수가 담겨있는 PageInfo 객체
	 * @return			조회된 결과가 담겨있는 list
	 */
	public ArrayList<FAQ> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = new FaqDao().selectList(conn, pi);
		
		close(conn);
		
		return list;		
	}
	
	
	
}
