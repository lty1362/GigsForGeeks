package com.gigsforgeeks.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.message.model.service.MessageService;

/**
 * Servlet implementation class MessageDeleteServlet
 */
@WebServlet("/delete.ms")
public class MessageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int messageNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new MessageService().deleteMessage(messageNo);
		if(result > 0) {	
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "메세지를 삭제하였습니다.");
			response.sendRedirect(request.getContextPath()+"/list.ms?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "메세지삭제를 실패하였습니다.");
			
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
