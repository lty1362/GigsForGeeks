package com.gigsforgeeks.member.controller;

import java.io.IOException;
import java.sql.Date;

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

/**
 * Servlet implementation class UpdateCareer
 */
@WebServlet("/updateCareer.up")
public class UpdateCareer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCareer() {
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
		
		String companyInfo = request.getParameter("companyInfo");
		String CareerTitle = request.getParameter("CareerTitle");
		String CareerContent = request.getParameter("CareerContent");
		String CareerHire = request.getParameter("CareerHire");
		String CareerRetire = request.getParameter("CareerRetire");
		
		Career updateCareer = new Career(companyInfo, CareerTitle, CareerContent, CareerHire,CareerRetire);
		
		int result = new MemberService().updateCareer(userId, updateCareer);
				
		if(result>0) {
			session.setAttribute("Career", updateCareer);
			
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
