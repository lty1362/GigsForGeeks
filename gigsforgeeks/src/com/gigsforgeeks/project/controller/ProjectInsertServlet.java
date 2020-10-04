package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.project.model.service.ProjectService;
import com.gigsforgeeks.project.model.vo.Project;

/**
 * Servlet implementation class ProjectInsertServlet
 * 
 * 프로젝트 등록 서블릿
 */
@WebServlet("/insert.proj")
@SuppressWarnings("serial")
public class ProjectInsertServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 현재 사용자가 회원인 경우
			
			String clientId = loginUser.getUserId();
			String[] requriedSkills = request.getParameterValues("requriedSkill");
			String projectName = request.getParameter("projectName");
			String description = request.getParameter("description");
			LocalDate expectStart = LocalDate.parse(request.getParameter("expectStart"), formatter);
			LocalDate expectEnd = LocalDate.parse(request.getParameter("expectEnd"), formatter);
			String meansOfPayment = request.getParameter("meansOfPayment");
			String bidding = request.getParameter("bidding");
			LocalDate endBid = LocalDate.parse(request.getParameter("endBid"), formatter);
			
			String requriedSkill = String.join(",", requriedSkills);
			
			String[] splitBid = bidding.split("-");
			String minBid = splitBid[0];
			String maxBid = splitBid[1];
			
			Project project = null;
			try {
				project = new Project(clientId,
									  requriedSkill,
									  projectName,
									  description,
									  expectStart,
									  expectEnd,
									  meansOfPayment,
									  Integer.parseInt(minBid),
									  Integer.parseInt(maxBid),
									  endBid);
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
			int result = new ProjectService().insertProject(project);
			if(result > 0) { // 프로젝트 등록 요청 성공 시
				session.setAttribute("alertMsg", "프로젝트가 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath());
				
			}else { // 실패 시
				request.getSession().setAttribute("errorMsg", "프로젝트 등록에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}else { // 비회원인 경우
			request.getSession().setAttribute("alertMsg", "로그인 후에 이용하세요.");
			RequestDispatcher view = request.getRequestDispatcher("views/member/login.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
