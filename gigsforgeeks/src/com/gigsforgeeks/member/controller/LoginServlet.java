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

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginMe.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser != null) {
			
			// 관리자일경우 (진섭작성)
			if(loginUser.getAdmin().equals("Y")) {
				
				HttpSession session = request.getSession();
		    	session.setAttribute("loginUser", loginUser);
				
		    	response.sendRedirect(request.getContextPath() + "/memberList.bo?currentPage=1");
			}
			
			// 관리자 아닌경우(일반로그인)
			else {
			HttpSession session = request.getSession();
	    	session.setAttribute("loginUser", loginUser);
			
	    	response.sendRedirect(request.getContextPath());
			}
			
		}else {
			
			request.getSession().setAttribute("errorMsg", "로그인에 실패하셨습니다.");
			
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
