package com.kgitbank.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kgitbank.model.Pageination;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.BreakdownService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/")
@Log4j
public class MyPageController {

	@Setter(onMethod_ = { @Autowired })
	BreakdownService bservice;

	@GetMapping("/products")
	public String myProductsPage(Model model, HttpSession session, Pageination paging) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		String userNick = user.getUserNick();
		model.addAttribute("usernick", userNick);
		model.addAttribute("userTime", bservice.getShuserInfoCdate(userNick));
		model.addAttribute("shitemCount", bservice.shitemVOCount(userNick)); // 판매 등록된 상품 갯수
		model.addAttribute("saleCount", bservice.purchasedetailsCount(userNick)); // 상품 판매 횟수
		model.addAttribute("itemvo" , bservice.getShitemVO(userNick));
		
		model.addAttribute("products", "products");
		paging.setUsernick(userNick);
		model.addAttribute("pageList", bservice.getUserItemList(paging));			
		model.addAttribute("page", paging.getPageData(10, bservice.getCount(userNick)));
		return "/myPage";
	}

	@GetMapping("/comments")
	public String myCommentsPage(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		String userNick = user.getUserNick();

		model.addAttribute("userTime", bservice.getShuserInfoCdate(userNick));
		model.addAttribute("shitemCount", bservice.shitemVOCount(userNick)); // 판매 등록된 상품 갯수
		model.addAttribute("saleCount", bservice.purchasedetailsCount(userNick)); // 상품 판매 횟수
		model.addAttribute("itemvo" , bservice.getShitemVO(userNick));
		model.addAttribute("comments", "comments");
		return "/myPage";
	}

	@GetMapping("/favorites")
	public String myFavoritesPage(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		String userNick = user.getUserNick();

		model.addAttribute("userTime", bservice.getShuserInfoCdate(userNick));
		model.addAttribute("shitemCount", bservice.shitemVOCount(userNick)); // 판매 등록된 상품 갯수
		model.addAttribute("saleCount", bservice.purchasedetailsCount(userNick)); // 상품 판매 횟수
		model.addAttribute("itemvo" , bservice.getShitemVO(userNick));
		model.addAttribute("favorites", "favorites");
		return "/myPage";
	}

	@GetMapping("/reviews")
	public String myReviewssPage(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		String userNick = user.getUserNick();

		model.addAttribute("userTime", bservice.getShuserInfoCdate(userNick));
		model.addAttribute("shitemCount", bservice.shitemVOCount(userNick)); // 판매 등록된 상품 갯수
		model.addAttribute("saleCount", bservice.purchasedetailsCount(userNick)); // 상품 판매 횟수
		model.addAttribute("itemvo" , bservice.getShitemVO(userNick));
		model.addAttribute("reviews", "reviews");
		return "/myPage";
	}
	
	@GetMapping("/Productmanagement")
	public String ProductManagement(Model model, HttpSession session, Pageination paging, HttpServletRequest request){
		UserInfo user = (UserInfo) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}
		String userNick = user.getUserNick();
		model.addAttribute("itemvo" , bservice.getShitemVO(userNick));	
		paging.setUsernick(userNick);
		String search = request.getParameter("psearch");
		

		if(search == null || search.equals("")) {		
		model.addAttribute("pageList", bservice.getUserItemList(paging));			
		model.addAttribute("page", paging.getPageData(10, bservice.getCount(userNick)));		
		log.fatal("이프");
		return "/myPageSuperintend";
		
		}else {
			model.addAttribute("pageList", bservice.searchUserItemList(paging));			
			model.addAttribute("page", paging.getPageData(10, bservice.searchCount(paging)));
			log.fatal("엘스");
			
			
			return "/myPageSuperintend";			
		}
	}
}
