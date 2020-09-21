package com.gigsforgeeks.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		Connection connection = null;
		DataSource dataFactory = null;
		
		try {
			Context context = new InitialContext();
			Context envContext = (Context)context.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
			
		} finally {
			try {
				connection = dataFactory.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return connection;
		
	}
	
	public static void commit(Connection connection) {
		try {
			if(connection != null && connection.isClosed())
				connection.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection connection) {
		try {
			if(connection != null && !connection.isClosed())
				connection.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection connection) {
		try {
			if(connection != null && !connection.isClosed())
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement statement) {
		try {
			if(statement != null && !statement.isClosed())
				statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet resultSet) {
		try {
			if(resultSet != null && !resultSet.isClosed())
				resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
