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
import com.gigsforgeeks.member.model.vo.Career;
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Education;
import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.member.model.vo.Portfolio;
import com.gigsforgeeks.member.model.vo.Publication;

/**
 * Servlet implementation class LoadingUserServlet
 */
@WebServlet("/LoadingUser.load")
public class LoadingUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadingUserServlet() {
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
		
		if(loginUser !=null) {
		String userId = loginUser.getUserId(); 
		
		Career userCareer = new MemberService().searchCareer(userId);	          	  //userCareer = 회원 경력정보
		
		Education userEducation = new MemberService().searchEducation(userId);        //userEducation = 회원 교육정보
		
		Certificate userCertificate = new MemberService().searchCertificate(userId);  //userCertificate = 회원 자격증정보
		
		Portfolio userPortfolio = new MemberService().searchPortfolio(userId);	 	  //userProtfolio = 회원 포트폴리오 정보
		
		Publication userPublication = new MemberService().searchPublication(userId);  //userPublication = 회원 출판물 정보
		
		session.setAttribute("career", userCareer);
		
		session.setAttribute("education", userEducation);
		
		session.setAttribute("certificate", userCertificate);
		
		session.setAttribute("portfolio", userPortfolio);
		
		session.setAttribute("publication", userPublication);
		
		RequestDispatcher view = request.getRequestDispatcher("MyAccount.me");
		view.forward(request, response);}else {
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
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
