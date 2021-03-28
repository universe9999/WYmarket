package com.kgitbank.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kgitbank.model.Inquiry;
import com.kgitbank.model.InquiryAdminToUser;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.DateCalc;
import com.kgitbank.service.PageService;
import com.kgitbank.service.WYmarketService;

@Controller
@SessionAttributes({ "users", "lists", "searchs" })
public class AdminController implements Serializable {

	@Autowired
	WYmarketService wyMarketService;

	@Autowired
	DateCalc dateCalc;

	String category = null;
	String categorySearch = null;

	// 관리자 로그인

	@GetMapping(value = "/admin")
	public String adminLoginPage(HttpServletRequest request, Model model, Pagination pagination, HttpSession session) {

		String list = request.getParameter("list");
		String search = request.getParameter("search");

		// 검색을 눌렀을 때 세션에 정보 저장
		if (list != null) {
			session.setAttribute("listSession", list);
			category = (String) session.getAttribute("listSession");
			session.setAttribute("searchSession", search);
			categorySearch = (String) session.getAttribute("searchSession");
		}

		// select tag 및 input 유지
		model.addAttribute("searchs", search);
		pagination.setSearch(categorySearch);
		model.addAttribute("lists", list);

		// 카테고리를 뭘 눌렀냐에 따라 검색
		// 검색 카테고리 선택에 따라 해당 쿼리 실행 (10줄씩 자른) 그리고 그것을 jsp 테이블에 표현 ("users")
		if (category == null) {
			pagination.setTotal(wyMarketService.selectUserCount());
			model.addAttribute("users", wyMarketService.selectUserList(pagination));
		} else if (category.equals("userId")) {
			pagination.setTotal(wyMarketService.selectUserCountId(categorySearch));
			List<UserInfo> selectUserById = wyMarketService.selectUserById(pagination);
			model.addAttribute("users", selectUserById);
		} else if (category.equals("userNick")) {
			pagination.setTotal(wyMarketService.selectUserCountNick(categorySearch));
			List<UserInfo> selectUserByNick = wyMarketService.selectUserByNick(pagination);
			model.addAttribute("users", selectUserByNick);
		} else if (category.equals("address")) {
			pagination.setTotal(wyMarketService.selectUserCountAddress(categorySearch));
			List<UserInfo> selectUserByAddress = wyMarketService.selectUserByAddress(pagination);
			model.addAttribute("users", selectUserByAddress);
		}

		model.addAttribute("rowCount", pagination.getTotal());

		PageService pageService;

		// 위 정보로 pagination 생성
		pageService = new PageService(pagination);
		model.addAttribute("pagination", pagination);

		model.addAttribute("pageService", pageService);

		model.addAttribute("inquiryCount", wyMarketService.selectInquiryCountTotal());

		return "/admin/admin";
	}

	@GetMapping("/admin/all")
	public String adminSearchAll(HttpSession session, Model model) {
		session.removeAttribute("listSession");
		session.removeAttribute("searchSession");
		model.addAttribute("lists", "");
		model.addAttribute("searchs", "");
		category = null;
		categorySearch = null;

		return "redirect:/admin";
	}

	@GetMapping("/admin/usercount")
	public String adminUserCount(HttpSession session, HttpServletRequest req, Pagination pagination, Model model) {
		session.removeAttribute("selectedYear");
		session.removeAttribute("selectedMonth");
		session.removeAttribute("selectedDay");
		
		session.removeAttribute("listSession");
		session.removeAttribute("searchSession");
		model.addAttribute("lists", "");
		model.addAttribute("searchs", "");
		category = null;
		categorySearch = null;

		// 누적 접속자 수를 view에 띄움
		int userCountTotal = wyMarketService.selectUserCountTotal();
		session.setAttribute("userCountTotal", userCountTotal);

		dateCalc = new DateCalc();

		// 현재 연도
		session.setAttribute("currentYear", dateCalc.getYear());

		String year = (String) session.getAttribute("ys");
		String month = (String) session.getAttribute("ms");
		String day = (String) session.getAttribute("ds");

		if (session.getAttribute("accessFlag") == "1") {

			dateCalc = new DateCalc(year, month, day);

			int accessCount = 0;

			accessCount = wyMarketService.selectAccessCountByDate(dateCalc.getTotalDate());
			session.setAttribute("dateTransfer", dateCalc.getTotalDate());
			session.setAttribute("accessCount", accessCount);
			session.setAttribute("selectedYear", year);
			session.setAttribute("selectedMonth", month);
			session.setAttribute("selectedDay", day);
		} else if (session.getAttribute("accessFlag") == "2") {

			dateCalc = new DateCalc(year, month, day);

			session.setAttribute("signupFlag", true);

			int signupCount = 0;

			signupCount = wyMarketService.selectSignupCountByDate(dateCalc.getTotalDate());
			session.setAttribute("dateTransfer", dateCalc.getTotalDate());
			session.setAttribute("accessCount", signupCount);
			session.setAttribute("selectedYear", year);
			session.setAttribute("selectedMonth", month);
			session.setAttribute("selectedDay", day);
		}

		// 가입자 수 보기
		if (session.getAttribute("signupFlag") != null) {
			pagination.setSearch((String) session.getAttribute("dateTransfer"));
			pagination.setTotal(wyMarketService.selectSignupCountByDate((String) session.getAttribute("dateTransfer")));
			List<UserInfo> selectUserByDate = wyMarketService.selectUserBySignupDate(pagination);
			model.addAttribute("users", selectUserByDate);
		} else {
			// 전체
			if (session.getAttribute("dateTransfer") == null) {
				session.removeAttribute("accessFlag");
				pagination.setTotal(wyMarketService.selectUserCount());
				model.addAttribute("users", wyMarketService.selectUserList(pagination));
				session.setAttribute("accessCount", pagination.getTotal());
			}
			// 접속자 수 보기
			else {
				pagination.setSearch((String) session.getAttribute("dateTransfer"));
				int cnt = wyMarketService.selectAccessCountByDate((String) session.getAttribute("dateTransfer"));
				pagination.setTotal(cnt);
				List<UserInfo> selectUserByDate = wyMarketService.selectUserByAccessDate(pagination);
				System.out.println(selectUserByDate);
				model.addAttribute("users", selectUserByDate);
			}
		}

		PageService pageService;

		// 위 정보로 pagination 생성
		pageService = new PageService(pagination);
		model.addAttribute("pagination", pagination);

		model.addAttribute("pageService", pageService);

		session.removeAttribute("signupFlag");

		return "/admin/usercount";
	}

	
	@GetMapping("/admin/usercount/first")
	public String adminUserCountFirst(HttpSession session, Model model) {
		session.removeAttribute("accessFlag");
		session.removeAttribute("dateTransfer");
		
		return "redirect:/admin/usercount";
	}
	
	@GetMapping("/admin/usercount/all")
	public String adminUserCountSearchAll(HttpSession session, Model model) {
		session.removeAttribute("accessFlag");
		session.removeAttribute("dateTransfer");
		
		return "redirect:/admin/usercount";
	}

	@GetMapping("/admin/accessUserCount")
	public String accessUserCount(HttpServletRequest request, Model model, HttpSession session) {
		session.setAttribute("accessFlag", "1");

		session.setAttribute("ys", request.getParameter("yearSelect"));
		session.setAttribute("ms", request.getParameter("monthSelect"));
		session.setAttribute("ds", request.getParameter("daySelect"));

		return "redirect:/admin/usercount";
	}

	@GetMapping("admin/signupUserCount")
	public String signupUserCount(HttpServletRequest request, Model model, HttpSession session) {
		session.setAttribute("accessFlag", "2");

		session.setAttribute("ys", request.getParameter("yearSelect"));
		session.setAttribute("ms", request.getParameter("monthSelect"));
		session.setAttribute("ds", request.getParameter("daySelect"));

		return "redirect:/admin/usercount";
	}

	// 사용자가 관리자에게 문의 보내기 버튼 누를 때
	@GetMapping("/sendInquiry")
	public String sendInquiry(HttpServletRequest request, Model model, HttpSession session) {

		String inquiryCategory = request.getParameter("inquirySelect");
		String inquiryContent = request.getParameter("textArea");

		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		String userNick = userInfo.getUserNick();

		Inquiry inquiry = new Inquiry();
		inquiry.setUserNick(userNick);
		inquiry.setInquiryCategory(inquiryCategory);
		inquiry.setInquiryContent(inquiryContent);

		wyMarketService.insertInquiryInfo(inquiry);

		session.setAttribute("inquiryFlag", 1);

		wyMarketService.updateInquiryCountTotal();

		return "redirect:/board/notice/c";
	}

	// 관리자가 문의 보기 버튼 누를 때
	@GetMapping("admin/seeInquiry")
	public String seeInquiry(Model model, HttpSession session) {

		List<Inquiry> inquiries = wyMarketService.selectInquiryInfo();
		session.setAttribute("inquiries", inquiries);

		wyMarketService.resetInquiryCountTotal();
		session.setAttribute("inquiryCount", wyMarketService.selectInquiryCountTotal());

		List<InquiryAdminToUser> adUserVO = wyMarketService.selectInquiryAdminToUser();

		session.setAttribute("inqAdminToUser", adUserVO);

		return "/admin/inquiry";
	}

	// 사용자가 관리자가 보낸 답장 페이지 볼 때
	@GetMapping("/seeInquiryFromAdmin")
	public String seeInquiryFromAdmin(Model model, HttpSession session) {

		UserInfo userInfo = (UserInfo) session.getAttribute("user");

		List<Inquiry> i = wyMarketService.selectInquiryByUserNick(userInfo.getUserNick());
		List<InquiryAdminToUser> iatu = wyMarketService.selectInquiryAdminToUserByUserNick(userInfo.getUserNick());
		session.setAttribute("myInquiry", i);
		session.setAttribute("replyFromAdmin", iatu);

		wyMarketService.resetInquiryUserCountTotal();

		return "/board/inquiryFromAdmin";
	}

}
