package com.gigsforgeeks.message.model.dao;

import static com.gigsforgeeks.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	 * 전체메세지조회
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
					     rset.getString("MESSAGE_TITLE"),		   		     
			   		     rset.getString("MESSAGE_RECEIVER"),
					     rset.getString("MESSAGE_RECEPIENT"),
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
	 * 메세지 상세보기
	 * @param conn
	 * @param messageNo
	 * @return
	 */
	public Message selectMessage(Connection conn,int messageNo) {
		Message ms = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, messageNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ms = new Message(rset.getInt("MESSAGE_NO"),	
					     rset.getString("MESSAGE_TITLE"),
			   		     rset.getString("MESSAGE_RECEIVER"),
					     rset.getString("MESSAGE_RECEPIENT"),
					     rset.getString("MESSAGE_CONTENT"),
					     rset.getDate("MESSAGE_RECEIVE_TIME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ms;
	}

	/**
	 * 메세지 읽음 표시
	 * @param conn
	 * @param ms
	 * @return
	 */
	public int updateMessage(Connection conn, int messageNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("messageUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1, messageNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 읽지않은 메세지 조회
	 * @param conn
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageNotRead(Connection conn, PageInfo pi, String userId) {
		ArrayList<Message> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageNotRead"); 
		
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
	 * 읽지않은 메세지 갯수
	 * @param conn
	 * @param userId
	 * @return
	 */
	public int selectNotReadCount(Connection conn, String userId) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotReadCount");
		
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
	 * 고객지원 메세지 갯수
	 * @param conn
	 * @param userId
	 * @return
	 */
	public int selectAdminCount(Connection conn, String userId) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminCount");
		
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
	 * 고객지원메세지 조회
	 * @param conn
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageAdmin(Connection conn, PageInfo pi, String userId) {
		ArrayList<Message> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageAdmin"); 
		
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
	 * 메세지 보관하기표시
	 * @param conn
	 * @param keep
	 * @return
	 */
	public int updateKeep(Connection conn, String keep) {
		int result = 0;
		
		Statement stmt = null;
	    String sql = prop.getProperty("messageKeep");
	    sql += "WHERE MESSAGE_NO IN (" + keep + ")";
	      
	      try {
	         stmt = conn.createStatement();
	         result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	/**
	 * 보관메세지 갯수
	 * @param conn
	 * @param userId
	 * @return
	 */
	public int selectKeepCount(Connection conn, String userId) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeepCount");
		
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
	 * 보관메세지 조회
	 * @param conn
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Message> selectMessageKeep(Connection conn, PageInfo pi, String userId) {
		ArrayList<Message> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMessageKeep"); 
		
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
	 * 메세지 보관 해제
	 * @param conn
	 * @param keep
	 * @return
	 */
	public int updateKeepOut(Connection conn, String keep) {
		int result = 0;
		
		Statement stmt = null;
	    String sql = prop.getProperty("messageKeepOut");
	    sql += "WHERE MESSAGE_NO IN (" + keep + ")";
	      
	      try {
	         stmt = conn.createStatement();
	         result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}

	
	

}
