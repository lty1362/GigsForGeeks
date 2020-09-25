package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.project.model.service.ProjectService;
import com.gigsforgeeks.project.model.vo.Proposal;

/**
 * Servlet implementation class ProposalInsertServlet
 * 
 */
@WebServlet("/proposal.do")
public class ProposalInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 프로젝트 입찰견적서 입력시 실행될 서블릿
	
		request.setCharacterEncoding("utf-8");
		
		String proposalProjectId = request.getParameter("projectId");							// 프로젝트 아이디
		String proposalUserId = request.getParameter("loginUser");								// 사용자 회원아이디
		String proposalInfo = request.getParameter("proposalInfo");								// 사용자가 입력한 제안내용
		int proposalPrice = Integer.parseInt(request.getParameter("proposalPrice"));			// 사용자가 입력한 제안가격
		Date proposalStart =java.sql.Date.valueOf(request.getParameter("proposalStart"));		// 사용자가 입력한 작업시작일
		Date proposalEnd = java.sql.Date.valueOf(request.getParameter("proposalEnd"));			// 사용자가 입력한 작업마감일
		
		Proposal proposal = new Proposal(proposalProjectId, proposalUserId, proposalInfo, proposalInfo, proposalPrice, proposalStart, proposalEnd);
		
		int result = new ProjectService().insertProposal(proposal);
		
		if(result > 0) { // 입찰견적서 전달성공
			
			request.getSession().setAttribute("alertMsg", "입찰견적서가 성공적으로 보내졌습니다.");
			response.sendRedirect(request.getContextPath() + "/proposal.do");
		
		}else { // 전달실패
			
			request.setAttribute("errorMsg", "입찰견적서를 제대로 전달하지 못했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
