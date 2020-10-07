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
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/updateProfile.up")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
		
		
		
		String location = request.getParameter("location");
		String Company = request.getParameter("userCompany");
		String selfIntroduction = request.getParameter("self-Introduction");
		int payRate = Integer.parseInt(request.getParameter("pay-rate"));
		String jobTitle = request.getParameter("jobTitle");
		Member updateMember = new Member(location, Company, selfIntroduction, userId, payRate, jobTitle);
		
		int result = new MemberService().updateProfile(userId, updateMember);
		
		if(result>0) {
			
			session.setAttribute("loginUser", updateMember);
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
