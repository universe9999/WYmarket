package com.kgitbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.UserInfo;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		AdminInfo adminInfo = (AdminInfo) session.getAttribute("Admin");
		UserInfo userInfo = (UserInfo) session.getAttribute("user");

		if (adminInfo == null && userInfo == null) {
			return true;
		}

		if(adminInfo != null) {
			response.sendRedirect("/wymarket/admin");
		} else if(userInfo != null) {
			response.sendRedirect("/wymarket/main");
		}	
		return false;
	}
	
}
