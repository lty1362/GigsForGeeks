package com.gigsforgeeks.message.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.message.model.vo.Message;

public class MessageDAO {
	
	private Properties prop = new Properties();
	
	public MessageDAO() {
		String fileName = MessageDAO.class.getResource("/sql/message/message-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Message> selectMessageList(Connection conn,String userId) {
		ArrayList<Message> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Message(rset.getInt("MESSAGE_NO"),
			   		     rset.getString("MESSAGE_TITLE"),
			   		     rset.getString("MESSAGE_RECEIVER"),
					     rset.getString("MESSAGE_RECEPIENT"),
					     rset.getDate("MESSAGE_RECEIVE_TIME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Message messageReceiver(String userId, Connection conn) {
		Message m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("messageReceiver");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				m = new Message(rset.getInt("MESSAGE_NO"),			   		     
			   		     rset.getString("MESSAGE_RECEIVER"),
					     rset.getString("MESSAGE_RECEPIENT"),
					     rset.getString("MESSAGE_TITLE"),
					     rset.getString("MESSAGE_CONTENT"),
					     rset.getDate("MESSAGE_RECEIVE_TIME"),
					     rset.getDate("MESSAGE_SEND_TIME"),
					     rset.getString("MESSAGE_READ"),
					     rset.getString("MESSAGE_KEEP"),
					     rset.getString("MESSAGE_ADMIN"),
					     rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}

	
	

}
