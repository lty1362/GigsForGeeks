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

/**
 * Servlet implementation class MessageInsertServlet
 */
@WebServlet("/insert.ms")
public class MessageInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		String meUserId = request.getParameter("meUserId");
		String meTitle = request.getParameter("meTitle");
		String meContent = request.getParameter("meContent");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Message messageRecepient = new MessageService().messageRecepient(userId);
		
		Message m = new Message();
		m.setMessageReceiver(meUserId);
		m.setMessageTitle(meTitle);
		m.setMessageContent(meContent);
		
		int result = new MessageService().insertMessage(m,userId);
		
		if(result > 0) { 
			//request.setAttribute("messageRecepient", messageRecepient);
			//request.getSession().setAttribute("alertMsg", "성공적으로 메세지를 전송하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/list.ms?currentPage=1");
			
		}else {
			
			request.setAttribute("errorMsg", "메세지 전송 실패");
			
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
