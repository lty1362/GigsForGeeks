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
import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.project.model.vo.Project;

/**
 * Servlet implementation class MyUpdateListServlet
 */
@SuppressWarnings("serial")
@WebServlet("/update.proj")
public class MyUpdateListServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		String curPage = request.getParameter("currentPage");
		
		// 페이징 처리
		int projectCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = curPage != null ? Integer.parseInt(curPage) : 1;
		pageLimit =10;
		boardLimit = 10;
		
		projectCount = new ProjectService().selectUpdateCount(userId);
		maxPage = (int)Math.ceil((double)projectCount / boardLimit); 			
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(projectCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		request.setAttribute("pi", pi);
		
		ArrayList<Project> myProjectList = new ProjectService().selectUpdateList(userId, pi);
		request.setAttribute("myProjectList", myProjectList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/project/update.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
	}

}
