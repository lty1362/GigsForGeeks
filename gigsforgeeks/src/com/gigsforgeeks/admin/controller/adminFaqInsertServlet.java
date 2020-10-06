package com.gigsforgeeks.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.service.model.service.FaqService;
import com.gigsforgeeks.service.model.vo.FAQ;

/**
 * Servlet implementation class adminFaqInsertServlet
 */
@WebServlet("/insert.faq")
public class adminFaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminFaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String enqType = request.getParameter("enqType");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		FAQ enq = new FAQ();
		
		enq.setFaqCategory(enqType);
		enq.setFaqTitle(title);
		enq.setFaqContent(content);
		
		int result = new FaqService().insertFaq(enq);
		
		if(result > 0) { // 성공 => 공지사항리스트 페이지
			
			request.getSession().setAttribute("alertMsg", "FAQ가 성공적으로 추가되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/faqList.bo?currentPage=1");
			
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
