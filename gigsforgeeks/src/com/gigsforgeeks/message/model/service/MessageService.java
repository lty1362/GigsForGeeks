package com.gigsforgeeks.message.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import com.gigsforgeeks.message.model.dao.MessageDAO;
import com.gigsforgeeks.message.model.vo.Message;

public class MessageService {

	public ArrayList<Message> selectMessageList(String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDAO().selectMessageList(conn,userId);
		
		close(conn);
		
		return list;
		
	}

	public Message messageReceiver(String userId) {
		Connection conn = getConnection();

		Message messageReceiver = new MessageDAO().messageReceiver(userId, conn);

		close(conn);

		return null;
	}

	
}
