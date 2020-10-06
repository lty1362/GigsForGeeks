package com.gigsforgeeks.message.controller;

import java.io.IOException;
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
 * Servlet implementation class MessageSendServlet
 */
@WebServlet("/send.ms")
public class MessageSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int notReadCount;
		int keepCount;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Message messageReceiver = new MessageService().messageReceiver(userId);
		notReadCount = new MessageService().selectNotReadCount(userId);
		keepCount = new MessageService().selectKeepCount(userId);
		PageInfo pi = new PageInfo(notReadCount,keepCount);
		
		request.setAttribute("messageReceiver", messageReceiver);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/message/messageSend.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
