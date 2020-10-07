package com.gigsforgeeks.project.controller;

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
 * Servlet implementation class FreelancerDetailServlet
 */
@WebServlet("/freelancerDetail.do")
public class FreelancerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreelancerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId = "user01";
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) { // 사용자가 로그인 회원일 때
			
			Member member = new MemberService().freelancerSelectDetail(userId);
			
			if(member != null) {
				
				request.setAttribute("member", member);
				RequestDispatcher view = request.getRequestDispatcher("views/member/userAccount.jsp");
				view.forward(request, response);
				
			}else {
				
				request.getSession().setAttribute("alertMsg", "프리랜서 상세조회에 실패하셨습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}else { // 비회원일 때
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "로그인 후 이용하세요.");
			response.sendRedirect(request.getContextPath() + "/login.me");
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
