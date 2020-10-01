package com.gigsforgeeks.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.service.model.service.EnquiryService;
import com.gigsforgeeks.service.model.vo.Enquiry;

/**
 * Servlet implementation class adminEnquiryDetailView
 */
@WebServlet("/detail.enq")
public class adminEnquiryDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminEnquiryDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int enquiryNo = Integer.parseInt(request.getParameter("nno"));
		
		if(enquiryNo > 0) { 
			Enquiry enq = new EnquiryService().selectEnquiry(enquiryNo);
			
			request.setAttribute("enq", enq);
			
			System.out.println(enq);
			
			RequestDispatcher view = request.getRequestDispatcher("views/admin/enqDetailView.jsp");
			view.forward(request, response);
			
		} else {
			request.setAttribute("errorMsg", "메세지 상세조회 실패");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
