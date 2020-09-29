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

import com.gigsforgeeks.message.model.vo.Message;
import com.gigsforgeeks.project.model.vo.PageInfo;


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

	/**
	 * userId대입
	 * @param userId
	 * @param conn
	 * @return
	 */
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
	/**
	 * 전체메세지 및 페이징
	 * @param conn
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageList(Connection conn,PageInfo pi,String userId) {
		ArrayList<Message> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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

	
	/**
	 * 전체조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public int selectListCount(Connection conn, String userId) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT"); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	/**
	 * 메세지 작성
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertMessage(Connection conn, Message m,String userId) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMessageTitle());
			pstmt.setString(2, m.getMessageContent());
			pstmt.setString(3, m.getMessageReceiver());
			pstmt.setString(4, userId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 메세지 작성 받는 userId
	 * @param userId
	 * @param conn
	 * @return
	 */
	public Message messageRecepient(String userId, Connection conn) {
		Message m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("messageRecepient");
		

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
