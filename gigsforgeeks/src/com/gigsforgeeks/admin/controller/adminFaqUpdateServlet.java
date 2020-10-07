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
 * Servlet implementation class adminFaqUpdateServlet
 */
@WebServlet("/update.faq")
public class adminFaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminFaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int faqNo = Integer.parseInt(request.getParameter("faqNo")); 
		
		int result = new FaqService().updateCheckFaq(faqNo);
		
		if(result > 0) { // 성공
			
			request.getSession().setAttribute("alertMsg", "FAQ 등록 성공");
			
			response.sendRedirect(request.getContextPath() + "/faqList.bo?currentPage=1");
			
		}else { // 실패
			
			request.setAttribute("errorMsg", "공지사항 수정 실패");
			
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
