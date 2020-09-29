package com.gigsforgeeks.message.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.message.model.dao.MessageDAO;
import com.gigsforgeeks.message.model.vo.Message;
import com.gigsforgeeks.project.model.vo.PageInfo;



public class MessageService {
	
	/**
	 * Message조회에 userId대입
	 */
	public Message messageReceiver(String userId) {
		Connection conn = getConnection();

		Message messageReceiver = new MessageDAO().messageReceiver(userId, conn);

		close(conn);

		return messageReceiver;
	}
	
	/**
	 * 메세지 전체 불러오기 및 페이징
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageList(PageInfo pi,String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDAO().selectMessageList(conn,pi,userId);
		
		close(conn);
		
		return list;
		
	}

	
	/**
	 * 조회갯수
	 */
	public int selectListCount(String userId) {
		Connection conn = getConnection();
		
		int listCount = new MessageDAO().selectListCount(conn,userId);
		
		close(conn);
		
		return listCount;
	}

	/**
	 * 메세지 작성
	 * @param m
	 * @return
	 */
	public int insertMessage(Message m,String userId) {

		Connection conn = getConnection();
		
		int result = new MessageDAO().insertMessage(conn, m,userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	/**
	 * 메세지 작성 받는 userId
	 * @param userId
	 * @return
	 */
	public Message messageRecepient(String userId) {
		Connection conn = getConnection();

		Message messageReceiver = new MessageDAO().messageRecepient(userId, conn);

		close(conn);

		return messageReceiver;
	}


	
}
