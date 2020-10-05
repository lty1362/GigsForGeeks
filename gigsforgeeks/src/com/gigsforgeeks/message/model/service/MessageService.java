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

		Message messageRecepient = new MessageDAO().messageRecepient(userId, conn);

		close(conn);

		return messageRecepient;
	}
	
	/**
	 *메세지 상세보기 
	 * @param messageNo
	 * @return
	 */
	public Message selectMessage(int messageNo) {
		Connection conn = getConnection();
		
		Message ms = new MessageDAO().selectMessage(conn,messageNo);
		
		close(conn);
		
		return ms;
	}

	/**
	 *  메세지 읽음 표시
	 * @param ms
	 * @return
	 */
	public int updateMessage(int messageNo) {
		Connection conn = getConnection();
		
		int result  = new MessageDAO().updateMessage(conn, messageNo);
		
		if(result  > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	/**
	 * 읽지않은 메세지 보기
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageNotRead(PageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDAO().selectMessageNotRead(conn,pi,userId);
		
		close(conn);
		
		return list;	
	}
	
	/**
	 * 읽지않은 메세지 갯수
	 * @param userId
	 * @return
	 */
	public int selectNotReadCount(String userId) {
		Connection conn = getConnection();
		
		int NotReadCount = new MessageDAO().selectNotReadCount(conn,userId);
		
		close(conn);
		
		return NotReadCount;
	}
	
	/**
	 * 고객지원 메세지 갯수
	 * @param userId
	 * @return
	 */
	public int selectAdminCount(String userId) {
		Connection conn = getConnection();
		
		int listCount = new MessageDAO().selectAdminCount(conn,userId);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 고객지원메세지 조회
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageAdmin(PageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDAO().selectMessageAdmin(conn,pi,userId);
		
		close(conn);
		
		return list;
	}

	
	public int updateKeep(int messageNo) {
		Connection conn = getConnection();
		
		int result  = new MessageDAO().updateKeep(conn, messageNo);
		
		if(result  > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}




	
}
