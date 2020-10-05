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
 * Servlet implementation class ProjectDeleteServlet
 */
@SuppressWarnings("serial")
@WebServlet("/delete.proj")
public class ProjectDeleteServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 사용자가 로그인한 회원일 때
			
			String userId = loginUser.getUserId();
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			Project project = new ProjectService().selectMyProject(projectId, userId);
			
			int result = new ProjectService().deleteMyProject(project, userId);
			if(result > 0) { // 프로젝트 삭제 요청 성공 시 -> 목록으로 돌아가기
				String listType = request.getParameter("listType");
				session.setAttribute("alertMsg", "프로젝트가 성공적으로 삭제되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.proj?listType=" + listType);
				
			}else { // 프로젝트 삭제 요청 실패 시
				request.getSession().setAttribute("errorMsg", "프로젝트 삭제에 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		}else { // 비회원일 때
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
