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

/**
 * Servlet implementation class MessageKeepNotReadServlet
 */
@WebServlet("/keepNotRead.ms")
public class MessageKeepNotReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageKeepNotReadServlet() {
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
		
		if(loginUser != null) { // 현재 사용자가 회원인 경우
		
			String[] keeps = request.getParameterValues("keeps"); 
			String keep = "";
		
			if(keeps != null) {
				keep = String.join(",", keeps); 
			}
			
			int result = new MessageService().updateKeep(keep);
			
				if(result > 0) {	
					session.setAttribute("alertMsg", "보관하였습니다.");
					response.sendRedirect(request.getContextPath()+"/notRead.ms?currentPage=1");
				}else {
					request.setAttribute("errorMsg", "보관처리 실패하였습니다.");
					
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				}
		}else { // 비회원인 경우
			request.getSession().setAttribute("alertMsg", "로그인 후에 이용하세요.");
			RequestDispatcher view = request.getRequestDispatcher("views/member/login.jsp");
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
