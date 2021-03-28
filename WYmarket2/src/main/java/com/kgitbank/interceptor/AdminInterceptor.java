package com.kgitbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.UserInfo;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		AdminInfo adminInfo = (AdminInfo) session.getAttribute("Admin");

		if (adminInfo != null) {
			return true;
		} else if (userInfo != null) {
			response.sendRedirect("/wymarket/main");
		} else {
			response.sendRedirect("/wymarket/login");
		}

		return false;
	}

}
