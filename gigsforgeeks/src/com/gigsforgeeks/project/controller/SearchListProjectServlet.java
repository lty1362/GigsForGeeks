package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.project.model.service.ProjectService;
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
		
		HttpSession session = request.getSession();
		
		// session영역에 있는거 갖고오기 
		Project projectId = (Project)session.getAttribute("projectId");
		Project projectName = (Project)session.getAttribute("projectName");
		Project projectStatus = (Project)session.getAttribute("projectStatus");
		Project description = (Project)session.getAttribute("description");
		Project endBid = (Project)session.getAttribute("endBid");
		Project minBid = (Project)session.getAttribute("minBid");
		Project maxBid = (Project)session.getAttribute("maxBid");
		Project countBid = (Project)session.getAttribute("countBid");
		System.out.println(projectId);
		System.out.println(projectName);
		
		// 프로젝트의 목록조회 요청하기
		String pId = projectId.getProjectId();				// 프로젝트 아이디
		String pTitle = projectName.getProjectName();		// 프로젝트 제목
		String pStatus = projectStatus.getProjectStatus();	// 프로젝트 상태
		String pInfo = description.getDescription();  		// 프로젝트 내용
		LocalDate pEndBid = endBid.getEndBid();				// 프로젝트 입찰마감일
		int pMinBid = minBid.getMinBid();					// 프로젝트 최소가격
		int pMaxBid= maxBid.getMaxBid();					// 프로젝트 최대가격
		int pCount = countBid.getCountBid();				// 입찰수
			
		
		// Project에 다시 담기
		Project project = null;
		project = new Project(pId, pTitle, pStatus, pInfo, pEndBid, pMinBid, pMaxBid, pCount);
		
		// Projectservice로 값보내기
		ArrayList<Project> list = new ProjectService().searchListProject(project);
		
		// searchListProject.jsp로 보내기
		request.setAttribute("list", list);
		
		// 사용자가 보게될 응답페이지
		RequestDispatcher view = request.getRequestDispatcher("views/project/searchListProject.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
