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
 * Servlet implementation class SignUpInsertServlet
 */
@WebServlet("/insert.me")
public class SignUpInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	request.setCharacterEncoding("UTF-8");
	      
	      String userId = request.getParameter("userId"); 
	      String email = request.getParameter("email"); 
	      String userPwd = request.getParameter("userPwd");
	      String userType = request.getParameter("userType");
	      

	      Member m = new Member(userId, userPwd, email, userType);
	      
	     int result = new MemberService().insertMember(m);
	      
	      if(result > 0) { 
				HttpSession session = request.getSession();
		    	session.setAttribute("alertMsg", "성공적으로 회원가입이 됐습니다.");
				
		    	response.sendRedirect(request.getContextPath());
	      }else { 
	    	  
				request.getSession().setAttribute("errorMsg", "회원가입에 실패하셨습니다.");
				
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
