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

import com.gigsforgeeks.member.model.vo.Member;
import com.gigsforgeeks.project.model.service.ProjectService;
import com.gigsforgeeks.project.model.vo.Project;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.gigsforgeeks.common.LocalDateDeserializer;
import com.gigsforgeeks.common.LocalDateSerializer;

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
			String userType = loginUser.getUserType(); // 유저 타입: 프리랜서 "F" / 고용주 "E"
			String reqType = request.getParameter("reqType"); // 리퀘스트 타입: 목록보기에서 사용자가 요청한 리퀘스트 타입
			if(request.getParameter("listType") != null) { // 목록 타입: 상세보기에서 메뉴 요청시 선택되어 있던 목록 타입
				userType = request.getParameter("listType");
			}
			
			if(reqType == null) { // 유저 타입 or 목록 타입으로 요청한 경우 -> 동기 처리
				
				ArrayList<Project> myProjectList = new ProjectService().selectMyProjectList(userId, userType);
				request.setAttribute("myProjectList", myProjectList);
				
				if(userType.equals("F")) { // 현재 로그인한 사용자가 프리랜서인 경우
					RequestDispatcher view = request.getRequestDispatcher("views/project/myBidList.jsp");
					view.forward(request, response);
					
				}else if(userType.equals("E")) { // 현재 로그인한 사용자가 고용주인 경우
					RequestDispatcher view = request.getRequestDispatcher("views/project/myList.jsp");
					view.forward(request, response);
				}
				
			}else { // 별도의 리퀘스트 타입으로 요청한 경우 -> 비동기 처리
				
				ArrayList<Project> myProjectList = new ProjectService().selectMyProjectList(userId, reqType);
				
				response.setContentType("application/json; charset=utf-8");
				
				GsonBuilder gsonBuilder = new GsonBuilder();
		        gsonBuilder.registerTypeAdapter(LocalDate.class, new LocalDateSerializer());
		        gsonBuilder.registerTypeAdapter(LocalDate.class, new LocalDateDeserializer());
		        
		        Gson gson = gsonBuilder.setPrettyPrinting().create();
				gson.toJson(myProjectList, response.getWriter());
				
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
