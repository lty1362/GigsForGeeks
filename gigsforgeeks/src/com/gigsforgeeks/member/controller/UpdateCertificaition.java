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
import com.gigsforgeeks.member.model.vo.Certificate;
import com.gigsforgeeks.member.model.vo.Member;

/**
 * Servlet implementation class UpdateCertificaition
 */
@WebServlet("/updateCertificaition.up")
public class UpdateCertificaition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCertificaition() {
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
		
		String CertifiTitle = request.getParameter("CertifiTitle");
		String CertifiAuth = request.getParameter("CertifiAuth");
		String CertifiDate = request.getParameter("CertifiDate");
		
		Certificate updateCertificate = new Certificate(CertifiTitle, CertifiAuth, CertifiDate);
		
		int result = new MemberService().updateCertificate(userId, updateCertificate);
		
		if(result == 1) {
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
