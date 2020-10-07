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
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;

/**
 * Servlet implementation class UpdateEducation
 */
@WebServlet("/updateEducation.up")
public class UpdateEducation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEducation() {
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
		
		String University = request.getParameter("University");
		String Major = request.getParameter("Major");
		String Degree = request.getParameter("Degree");
		String EnrollDate = request.getParameter("EnrollDate");
		String GrauateDate = request.getParameter("GrauateDate");
		
		Education updateEducation = new Education(University, Major, Degree, EnrollDate, GrauateDate);
		
		int result = new MemberService().updateEducation(userId, updateEducation);
		
		if(result == 1) {
			
			session.setAttribute("Education", updateEducation);
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
