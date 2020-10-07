package com.gigsforgeeks.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.member.model.service.MemberService;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Publication;

/**
 * Servlet implementation class UpdatePublication
 */
@WebServlet("/updatePublication.up")
public class UpdatePublication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePublication() {
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
		
		String BookTitle = request.getParameter("BookTitle");
		String BookContent = request.getParameter("BookContent");
		String Publisher  = request.getParameter("Publisher");
		String BookDate = request.getParameter("BookDate");
		
		Publication updatePublication = new Publication(BookTitle, BookContent, Publisher,  BookDate);
		
		int result = new MemberService().updatePublication(userId, updatePublication);
		
		if(result == 1) {
			session.setAttribute("Publication", updatePublication);
			RequestDispatcher view = request.getRequestDispatcher("LoadingUser.load");
			view.forward(request, response);
		}else {
			request.getSession().setAttribute("errorMsg", "정보수정에 실패했습니다.");
			
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
