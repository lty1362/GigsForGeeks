package com.gigsforgeeks.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.service.model.service.EnquiryService;
import com.gigsforgeeks.service.model.vo.Enquiry;

/**
 *  문의 페이지 넘기는 역할
 */
@WebServlet("/answer.enq")
public class adminAnswerEnqServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminAnswerEnqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String ansContent = request.getParameter("ansContent");
		int enqNo = Integer.parseInt(request.getParameter("enqNo"));
		
		Enquiry enq = new Enquiry();
		
		enq.setEnquiryNo(enqNo);
		enq.setEnquiryContent(ansContent);
		
		int result = new EnquiryService().updateAnswer(enq);
		
		if(result > 0) { // 성공 => 공지사항리스트 페이지
			
			request.getSession().setAttribute("alertMsg", "회원 문의에 답장하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/enqlist.bo?currentPage=1");
			
		}else { // 실패 => 에러페이지
			
			request.setAttribute("errorMsg", "문의 등록에 실패하였습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
