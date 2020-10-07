package com.gigsforgeeks.service.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gigsforgeeks.service.model.service.EnquiryService;
import com.gigsforgeeks.service.model.vo.Enquiry;

/**
 * Servlet implementation class EnquiryInsertServlet
 */
@WebServlet("/insert.enq")
public class EnquiryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달값 뽑기전에 utf-8
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String enqType = request.getParameter("enqType");
		String content = request.getParameter("content");
		
		Enquiry enq = new Enquiry();
		
		enq.setUserId(userId);
		enq.setEnquiryTitle(title);
		enq.setEnquiryType(enqType);
		enq.setEnquiryContent(content);
		
		int result = new EnquiryService().insertEnquiry(enq);
		
		if(result > 0) { // 성공 => 공지사항리스트 페이지
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "문의가 접수되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/views/service/faq?currentPage=1.jsp");
			
		}else { // 실패 => 에러페이지
			
			request.setAttribute("errorMsg", "문의 등록에 실패하였습니다.");
			
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
