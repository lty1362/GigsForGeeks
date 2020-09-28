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

import com.gigsforgeeks.member.model.service.MemberService;
import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.message.model.service.MessageService;
import com.gigsforgeeks.message.model.vo.Message;

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
				request.setCharacterEncoding("utf-8");
		
				HttpSession session = request.getSession();

				Member loginUser = (Member)session.getAttribute("loginUser");
				String userId = loginUser.getUserId();
				Message messageReceiver = new MessageService().messageReceiver(userId);
				ArrayList<Message> list = new MessageService().selectMessageList(userId);
				
				request.setAttribute("list", list);
				request.setAttribute("messageReceiver", messageReceiver);
				
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
