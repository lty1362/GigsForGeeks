package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.project.model.service.ProposalService;
import com.gigsforgeeks.project.model.vo.Project;
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
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		Project project = (Project)session.getAttribute("projectId");
		
		String inputPrice = (String)request.getParameter("proposalPrice");
		System.out.println("가격" + (String)request.getParameter("proposalPrice"));
		
		int proposalProjectId = project.getProjectId();														// 프로젝트 아이디를 불러옴		
		String proposalUserId = loginUser.getUserId();														// 사용자 아이디
		String proposalInfo = request.getParameter("proposalInfo");											// 사용자가 입력한 제안내용
		int proposalPrice = Integer.parseInt(inputPrice);													// 사용자가 입력한 제안가격
		LocalDate proposalStart = LocalDate.parse(request.getParameter("proposalStart"), formatter);		// 사용자가 입력한 작업시작일
		LocalDate proposalEnd = LocalDate.parse(request.getParameter("proposalEnd"), formatter);			// 사용자가 입력한 작업마감일
		
		Proposal proposal = new Proposal(proposalProjectId, proposalUserId, proposalInfo, proposalPrice, proposalStart, proposalEnd);
		
		int result = new ProposalService().insertProposal(proposal);
		
		if(result > 0) { // 입찰견적서 전달성공
			
			request.getSession().setAttribute("alertMsg", "입찰견적서가 성공적으로 보내졌습니다.");
			response.sendRedirect(request.getContextPath() + "/detailSelect.do?proposalProjectId =" + proposalProjectId);
		
		}else { // 전달실패
			
			request.setAttribute("errorMsg", "입찰견적서 전달에 실패하셨습니다 다시 시도해주세요.");
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
