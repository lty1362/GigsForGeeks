package com.gigsforgeeks.message.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.close;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.message.model.dao.MessageDAO;
import com.gigsforgeeks.message.model.vo.Message;
import com.gigsforgeeks.project.model.vo.PageInfo;



public class MessageService {
	
	public Message messageReceiver(String userId) {
		Connection conn = getConnection();

		Message messageReceiver = new MessageDAO().messageReceiver(userId, conn);

		close(conn);

		return null;
	}

	public ArrayList<Message> selectMessageList(PageInfo pi,String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDAO().selectMessageList(conn,pi,userId);
		
		close(conn);
		
		return list;
		
	}

	
	/*조회갯수*/
	public int selectListCount(String userId) {
		Connection conn = getConnection();
		
		int listCount = new MessageDAO().selectListCount(conn,userId);
		
		close(conn);
		
		return listCount;
	}


	
}
