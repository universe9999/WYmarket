package com.kgitbank.controller;

import java.net.http.HttpRequest;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kgitbank.model.Pageination;
import com.kgitbank.model.PurchasedetailsVO;
import com.kgitbank.model.ShItemVO;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.BreakdownService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;
import oracle.net.aso.m;

@Controller
@RequestMapping("/param/")
@Log4j
public class BreakdownController {

	@Setter(onMethod_ = { @Autowired })
	BreakdownService bservice;

	@GetMapping("/myPage")

	public String test01(Model model, HttpSession session, Pageination paging, String myNick) {

		
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
	
		model.addAttribute("userNick", userNick);
		model.addAttribute("userTime", bservice.getShuserInfoCdate(userNick));
		model.addAttribute("shitemCount", bservice.shitemVOCount(userNick)); // 판매 등록된 상품 갯수
		model.addAttribute("saleCount", bservice.purchasedetailsCount(userNick)); // 상품 판매 횟수
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("products", "products");

		paging.setUsernick(userNick);
		model.addAttribute("pageList", bservice.getUserItemList(paging));
		model.addAttribute("page", paging.getPageData(10, bservice.getCount(userNick)));
		return "/myPage";
	}

	@GetMapping("/sale") // 판매중 화면
	public String sale(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();

		model.addAttribute("userNick", userNick);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("userinfo", bservice.getShuserInfo());
		return "/breakdown/sale/salePage";

	}

	// 거래 완료 화면
	@GetMapping("/salecomplete")
	public String gSalecomplete(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		model.addAttribute("purchasedetailsCount", bservice.purchasedetailsCount(userNick));
		model.addAttribute("userNick", userNick);
		model.addAttribute("SellerPhVO", bservice.getSellerPhVO(userNick));
		return "/breakdown/sale/saleCompletedPage";
	}

//	  거래 완료 버튼
	@PostMapping("/salecomplete/{ititle}/{usernick}/{istate}/{itemid}")
	public String pSalecomplete(Model model, PurchasedetailsVO puvo, @PathVariable("ititle") String ititle,
			@PathVariable("usernick") String purchaser, @PathVariable("istate") String istate,
			@PathVariable("itemid") String itemid, HttpSession session) {

		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		model.addAttribute("userNick", userNick);
		model.addAttribute("success", "success");
		bservice.completedIstate(istate, ititle, userNick, itemid);
		bservice.insertPurchase(puvo, purchaser, userNick, ititle, istate, itemid);
		model.addAttribute("SellerPhVO", bservice.getSellerPhVO(userNick));
		return "/breakdown/sale/saleCompletedPage";
	}

	// 숨김 화면
	@GetMapping("/salehidden")
	public String gSalehidden(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		model.addAttribute("userNick", userNick);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("userinfo", bservice.getShuserInfo());
		return "/breakdown/sale/hiddenPage";
	}

	// 숨기기 버튼 클릭 시
	@PostMapping("/salehidden/{istate}/{ititle}/{itemid}")
	public String pSalehidden(Model model, @PathVariable("istate") String istate, @PathVariable("ititle") String ititle,
			@PathVariable("itemid") String itemid, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		bservice.hiddenIstate(istate, ititle, userNick, itemid);
		if (istate.equals("Onsale")) {
			bservice.productPullUp(ititle, userNick, istate, itemid); // 숨김에서 판매중으로 바꿨을떄 등록시간 최신화
			model.addAttribute("success", "success");
		}
		model.addAttribute("userNick", userNick);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		return "redirect:/param/sale";
	}

	// 예약 하기 / 취소
	@PostMapping("/reservation/{iReservationState}/{ititle}/{itemid}")
	public String reservation(Model model, @PathVariable("iReservationState") String iReservationState,
			@PathVariable("ititle") String ititle, @PathVariable("itemid") String itemid, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		bservice.reservationStateChange(iReservationState, ititle, userNick, itemid);
		model.addAttribute("userNick", userNick);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		model.addAttribute("userinfo", bservice.getShuserInfo());
		return "/breakdown/sale/salePage";
	}

	// 구매내역 화면
	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		 model.addAttribute("usernick", userNick);
		model.addAttribute("PurchaserPhVO", bservice.getPurchaserPhVO(userNick));
		return "/breakdown/purchasePage";
	}

	// 상품 끌어올리기
	@PostMapping("/pullup/{ititle}/{itemid}/{istate}")
	public String productPullUp(Model model, HttpSession session, @PathVariable("ititle") String ititle,
			@PathVariable("itemid") String itemid, @PathVariable("istate") String istate) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		bservice.productPullUp(ititle, userNick, istate, itemid);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		return "redirect:/param/sale";
	}

	@PostMapping("/productDelete/{ititle}/{itemid}/{istate}")
	public String productDelete(Model model, HttpSession session, @PathVariable("ititle") String ititle,
			@PathVariable("itemid") String itemid, @PathVariable("istate") String istate) {
		UserInfo user = (UserInfo) session.getAttribute("user");
		String userNick = user.getUserNick();
		bservice.productDelete(ititle, userNick, istate, itemid);
		model.addAttribute("itemvo", bservice.getShitemVO(userNick));
		return "redirect:/param/sale";
	}

}
