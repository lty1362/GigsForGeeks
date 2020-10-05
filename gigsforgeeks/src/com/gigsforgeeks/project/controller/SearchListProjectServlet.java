package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.project.model.service.ProjectService;
import com.gigsforgeeks.project.model.vo.PageInfo;
import com.gigsforgeeks.project.model.vo.Project;

/**
 * Servlet implementation class SearchListProjectServlet
 */
@WebServlet("/searchList.do")
public class SearchListProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		int projectId = Integer.parseInt(request.getParameter("projectId"));			// 프로젝트 아이디
		String projectName = request.getParameter("projectName");						// 프로젝트 제목
		String projectStatus = request.getParameter("projectStatus");					// 프로젝트 상태
		String description = request.getParameter("description");  						// 프로젝트 내용
		LocalDate endBid = LocalDate.parse(request.getParameter("endBid"), formatter);	// 프로젝트 입찰마감일

		// 검색조건 뽑기
		int minBid = 0;
		if(request.getParameter("minBid") == null || Integer.parseInt(request.getParameter("minBid")) == 0) {
			minBid = 200000;
		}else {
			minBid = Integer.parseInt(request.getParameter("minBid"));
		}
		
		int maxBid = 0;
		if(request.getParameter("maxBid") == null || Integer.parseInt(request.getParameter("maxBid")) == 0) {
			maxBid = 5000000;
		}else {
			maxBid = Integer.parseInt(request.getParameter("MaxBid"));
		}

		int countBid = 0;
		if(request.getParameter("countBid") == null) {
			countBid = 0;
		}else {
			countBid = Integer.parseInt(request.getParameter("countBid"));
		}
		
		Project project = new Project(projectId, projectName, description, projectStatus, minBid, maxBid, endBid, countBid);
		
		// 페이징 조건
		int listCount;	
		int currentPage;
		int pageLimit;	
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		listCount = new ProjectService().selectListCount(project);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 5;
		
		if(listCount != 0) {
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
		}else {
			maxPage=1;
		}
		
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Project> list = new ProjectService().searchListProject(pi, project);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("filter", project);
		request.getRequestDispatcher("views/search/searchListProject.jsp").forward(request, response);
	
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
