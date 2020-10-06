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
 * Servlet implementation class MessageKeepAdminServelt
 */
@WebServlet("/keepAdmin.ms")
public class MessageKeepAdminServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageKeepAdminServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String[] keeps = request.getParameterValues("keeps"); 
		String keep = "";
	
		if(keeps != null) {
			keep = String.join(",", keeps); 
		}
		
		HttpSession session = request.getSession();
		int result = new MessageService().updateKeep(keep);
		
		if(result > 0) {	
			session.setAttribute("alertMsg", "보관하였습니다.");
			response.sendRedirect(request.getContextPath()+"/admin.ms?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "보관처리 실패하였습니다.");
			
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
