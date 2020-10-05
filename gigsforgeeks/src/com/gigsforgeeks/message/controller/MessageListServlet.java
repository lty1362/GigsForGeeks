package com.gigsforgeeks.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.message.model.service.MessageService;
import com.gigsforgeeks.message.model.vo.Message;
import com.gigsforgeeks.project.model.vo.PageInfo;


/**
 * Servlet implementation class MessageListServlet
 */
@WebServlet("/list.ms")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		int notReadCount;
		int keepCount;
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit =10;
		
		boardLimit = 10;
		
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		Message messageReceiver = new MessageService().messageReceiver(userId);
		
        listCount = new MessageService().selectListCount(userId);
        notReadCount = new MessageService().selectNotReadCount(userId);
        keepCount = new MessageService().selectKeepCount(userId);
        
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
	
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage,notReadCount,keepCount);
		
		ArrayList<Message> list = new MessageService().selectMessageList(pi,userId);
		
		request.setAttribute("messageReceiver", messageReceiver);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	
		RequestDispatcher view = request.getRequestDispatcher("views/message/message.jsp");
		view.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
