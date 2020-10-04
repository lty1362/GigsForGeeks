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
 * Servlet implementation class MyProjectListServlet
 */
@SuppressWarnings("serial")
@WebServlet("/list.proj")
public class MyProjectListServlet extends HttpServlet {
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 현재 사용자가 회원인 경우
			
			String userId = loginUser.getUserId();
			String userType = loginUser.getUserType();
			
			ArrayList<Project> myProjectList = new ProjectService().selectMyProjectList(userId);
			request.setAttribute("myProjectList", myProjectList);
			
			if(userType.equals("F")) { // 현재 로그인한 사용자가 프리랜서인 경우
				RequestDispatcher view = request.getRequestDispatcher("views/project/myBidList.jsp");
				view.forward(request, response);
				
			}else if(userType.equals("E")) { // 현재 로그인한 사용자가 고용주인 경우
				RequestDispatcher view = request.getRequestDispatcher("views/project/myList.jsp");
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
