package com.gigsforgeeks.message.controller;

import java.io.IOException;

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
 * Servlet implementation class MessageDetailesServlet
 */
@WebServlet("/detail.ms")
public class MessageDetailesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDetailesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int messageNo = Integer.parseInt(request.getParameter("nno"));
		int notReadCount;
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Message messageReceiver = new MessageService().messageReceiver(userId);
		notReadCount = new MessageService().selectNotReadCount(userId);
		PageInfo pi = new PageInfo(notReadCount);
		
		int result = new MessageService().updateMessage(messageNo);
		Message m = new MessageService().selectMessage(messageNo);

		request.setAttribute("pi", pi);
		request.setAttribute("result", result);
		request.setAttribute("m", m);
		
		
		
		if(messageNo > 0 && result > 0) { 
			RequestDispatcher view = request.getRequestDispatcher("views/message/MessageDetailes.jsp");
			view.forward(request, response);
			
		}else { 
			
			request.setAttribute("errorMsg", "메세지 상세조회 실패");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
