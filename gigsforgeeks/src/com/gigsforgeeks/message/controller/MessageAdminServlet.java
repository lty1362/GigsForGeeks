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
 * Servlet implementation class MessageAdminServlet
 */
@WebServlet("/admin.ms")
public class MessageAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageAdminServlet() {
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
		int adminCount; //keepCount에 넣을수없어 여기에 보관후 jsp에 keepCount로 변환
		int fullCount;
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		pageLimit =10;
		
		boardLimit = 10;
		
		Message messageReceiver = new MessageService().messageReceiver(userId);
		
        listCount = new MessageService().selectAdminCount(userId);
        notReadCount = new MessageService().selectNotReadCount(userId);
        adminCount = new MessageService().selectKeepCount(userId);
        fullCount = new MessageService().selectListCount(userId);
        
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
	
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage ,notReadCount,adminCount, fullCount);
		
		ArrayList<Message> adminMs = new MessageService().selectMessageAdmin(pi,userId);
		
		request.setAttribute("messageReceiver", messageReceiver);
		request.setAttribute("pi", pi);
		request.setAttribute("adminMs", adminMs);
	
		RequestDispatcher view = request.getRequestDispatcher("views/message/messageAdmin.jsp");
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
