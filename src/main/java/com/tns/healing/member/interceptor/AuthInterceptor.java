package com.tns.healing.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

//	private void saveDest(HttpServletRequest req) {
//		String uri = req.getRequestURI();
//
//		String query = req.getQueryString();
//
//		if (query == null || query.equals("null")) {
//			query = "";
//		} else {
//			query = "?" + query;
//		}
//
//		if (req.getMethod().equals("GET")) {
//			logger.info("dest: " + (uri + query));
//			req.getSession().setAttribute("dest", uri + query);
//		}
//	}

	@Override // 글쓰기 로그인 여부 확인 메소드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hander) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		if (session.getAttribute("MEMBER_ID") == null) {
			logger.info("current user is noet logined");
			out.println("<script>");
			out.println("alert('로그인 후 사용가능합니다.');");

			// response.sendRedirect("loginForm");
			out.println("location.href='loginForm';</script>");
			out.close();
			return false;
		}
		return true;
	}
}
