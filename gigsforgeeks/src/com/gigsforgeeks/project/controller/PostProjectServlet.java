package com.gigsforgeeks.project.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.project.model.service.ProjectService;
import com.gigsforgeeks.project.model.vo.Project;

/**
 * Servlet implementation class PostProject
 * 
 * 프로젝트 등록 서블릿
 */
@WebServlet("/postProject.do")
@SuppressWarnings("serial")
public class PostProjectServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String requriedSkill = request.getParameter("requriedSkill");
		String projectName = request.getParameter("projectName");
		String description = request.getParameter("description");
		String expectStart = request.getParameter("expectStart");
		String expectEnd = request.getParameter("expectEnd");
		String meansOfPayment = request.getParameter("meansOfPayment");
		String minBid = request.getParameter("minBid");
		String maxBid = request.getParameter("maxBid");
		String endBid = request.getParameter("endBid");
		
		Project project = null;
		try {
			project = new Project(requriedSkill,
								  projectName,
								  description,
								  (Date)new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(expectStart),
								  (Date)new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(expectEnd),
								  meansOfPayment,
								  Integer.parseInt(minBid),
								  Integer.parseInt(maxBid),
								  (Date)new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(endBid));
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int result = new ProjectService().insertProject(project);
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "프로젝트가 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myProject.do");
			
		}else {
			request.getSession().setAttribute("alertMsg", "프로젝트 등록에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
