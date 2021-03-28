package com.kgitbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.UserInfo;

public class UserInterceptor extends HandlerInterceptorAdapter {

	// controller로 보내기 전에 처리하는 인터셉터
	// 반환이 false라면 controller로 요청을 안함
	// 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler )

	// 컨트롤러가 호출되기 전에 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {

		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		AdminInfo adminInfo = (AdminInfo) session.getAttribute("Admin");
		System.out.println("인터셉터 userInfo : " + userInfo);
		if (userInfo != null) {
			return true;
		} else if(adminInfo != null) {
			response.sendRedirect("/wymarket/admin");
		} else {
			response.sendRedirect("/wymarket/login");
		}

		return false;
	}

	// controller의 handler가 끝나면 처리됨
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
	}

	// view까지 처리가 끝난 후에 처리됨
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}

}
