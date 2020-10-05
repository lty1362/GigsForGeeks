package com.gigsforgeeks.project.controller;

import java.io.IOException;

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
 * Servlet implementation class MyProjectDetailServlet
 */
@SuppressWarnings("serial")
@WebServlet("/detail.proj")
public class MyProjectDetailServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 현재 사용자가 회원인 경우
			
			String userId = loginUser.getUserId();
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			
			Project myProject = new ProjectService().selectMyProject(projectId, userId);
			
			if(myProject != null) { // 프로젝트 상세조회 요청 성공 시
				request.setAttribute("myProject", myProject);
				RequestDispatcher view = request.getRequestDispatcher("views/project/detail.jsp");
				view.forward(request, response);
				
			}else { // 실패 시
				request.getSession().setAttribute("errorMsg", "프로젝트 상세조회에 실패했습니다.");
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
