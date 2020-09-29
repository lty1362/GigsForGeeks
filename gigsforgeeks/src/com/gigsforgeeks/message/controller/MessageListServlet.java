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
		int listCount;		// 현재 총 게시글 갯수
		int currentPage;	// 현재 페이지(즉, 요청한 페이지)
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;		// 한 페이지내에 보여질 게시글 최대갯수
		
		int maxPage;		// 전체 페이지들 중에서의 가장 마지막 페이지
		int startPage;		// 현재 페이지에 하단에 보여질 페이징 바의 시작 수
		int endPage;		// 현재 페이지에 하단에 보여질 페이징 바의 끝 수
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit =10;
		
		boardLimit = 10;
		
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		Message messageReceiver = new MessageService().messageReceiver(userId);
		
        listCount = new MessageService().selectListCount(userId);
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
	
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
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
