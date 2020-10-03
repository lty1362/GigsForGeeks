package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ListProjectServlet
 */
@SuppressWarnings("serial")
@WebServlet("/myProject.do")
public class MyProjectServlet extends HttpServlet {
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			
			String userId = loginUser.getUserId();
			ArrayList<Project> myProject = new ProjectService().selectMyProject(userId);
			
			request.setAttribute("myProject", myProject);
			RequestDispatcher view = request.getRequestDispatcher("views/project/myProject.jsp");
			view.forward(request, response);
			
		}else {
			
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
