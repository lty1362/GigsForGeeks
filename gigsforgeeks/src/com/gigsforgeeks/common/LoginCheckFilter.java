package com.gigsforgeeks.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gigsforgeeks.member.model.vo.Member;

/**
 * LoginCheckFilter.java
 * 로그인 정보 확인 필터 클래스
 * 
 * @author 보늬
 *
 */
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		boolean isRedirect = false;
		String requestURI = req.getRequestURI();
		
		if(!requestURI.equals(req.getContextPath() + "/login.me")) {
			
			Member loginUser = (Member) req.getSession().getAttribute("loginUser");
			if(loginUser == null) {
				isRedirect = true;
			}
			
		}
		
		if(isRedirect == true) {
			resp.sendRedirect(req.getContextPath() + "/login.me");
		}else {
			chain.doFilter(req, resp);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("filter test");

	}

}
