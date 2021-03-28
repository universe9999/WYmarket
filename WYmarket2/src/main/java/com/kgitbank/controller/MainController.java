package com.kgitbank.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kgitbank.mapper.breakdownMapper;
import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.SearchInDistance;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.BreakdownService;
import com.kgitbank.service.GoodsService;
import com.kgitbank.service.GpsDistance;
import com.kgitbank.service.WYmarketService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes({ "userNick", "lat", "lon", "address" })
public class MainController {

	@Autowired
	GoodsService gservice;
	
	@Autowired
	BreakdownService bservice;
	
	@Autowired
	WYmarketService wyMarketService;

	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(HttpSession session, Model model, String search, String category) {
		log.info("메인 페이지");
		System.out.println("메인페이지 세션 값 : " + session.getAttribute("user"));

		UserInfo userInfo = (UserInfo) session.getAttribute("user");

		model.addAttribute("userNick", userInfo.getUserNick());

		List<String> userNickList = wyMarketService.selectUserNickFromItem();

		List<String> userNickList6km = new ArrayList<String>();

		for (String userNick : userNickList) {

			UserInfo latLong = wyMarketService.selectLatLong(userNick);

			double distanceKiloMeter = GpsDistance.distance(userInfo.getLatitude(), userInfo.getLongitude(),
					latLong.getLatitude(), latLong.getLongitude(), "kilometer");

			System.out.println("두 지점 간의 거리 : " + distanceKiloMeter);

			if (distanceKiloMeter < 6) {
				userNickList6km.add(userNick);
			}
		}

		List<GoodsVO> distance6km = new ArrayList<GoodsVO>();
		// 거리 이내의 상품 띄우는 리스트
		for (String userNick : userNickList6km) {
			List<GoodsVO> items = wyMarketService.selectItemByUserNick(userNick);
			for (GoodsVO item : items) {
				distance6km.add(item);
			}
		} 
		
		// 날짜 정렬
		Collections.sort(distance6km, new Comparator<GoodsVO>() {
		    @Override
		    public int compare(GoodsVO o1, GoodsVO o2) {
		        return o1.getRefreshtime().compareTo(o2.getRefreshtime());
		    }
		});
	 
	  
		if (search == null) {// 메인페이지
			// List<SearchInDistance> sid = wyMarketService.selectSearchInDistance();
			model.addAttribute("goods", distance6km);		
			// System.out.println(sid);
		} else {// 검색창에 검색 했을때
				// List<SearchInDistance> sid = wyMarketService.selectSearchGoods(search);
			List<GoodsVO> distance6kmSearch = new ArrayList<GoodsVO>();
			for (String userNick : userNickList6km) {
				List<GoodsVO> items = wyMarketService.selectItemByUserNickSearch(userNick, search);
				for (GoodsVO item : items) {
					distance6kmSearch.add(item);
				}
			}
			// 날짜 정렬
			Collections.sort(distance6kmSearch, new Comparator<GoodsVO>() {
			    @Override
			    public int compare(GoodsVO o1, GoodsVO o2) {
			        return o1.getRefreshtime().compareTo(o2.getRefreshtime());
			    }
			});
	
			model.addAttribute("goods", distance6kmSearch);
			
			// System.out.println(sid);
		}

		if (category != null) {// 카테고리에서 선택 했을때
			// List<SearchInDistance> sid = wyMarketService.selectCategoryGoods(category);
			List<GoodsVO> distance6kmCategory = new ArrayList<GoodsVO>();
			for (String userNick : userNickList6km) {
				List<GoodsVO> items = wyMarketService.selectItemByUserNickCategory(userNick, category);
				for (GoodsVO item : items) {
					distance6kmCategory.add(item);
				}
			}
			// 날짜 정렬
			Collections.sort(distance6kmCategory, new Comparator<GoodsVO>() {
			    @Override
			    public int compare(GoodsVO o1, GoodsVO o2) {
			        return o1.getRefreshtime().compareTo(o2.getRefreshtime());
			    }
			});
			model.addAttribute("goods", distance6kmCategory);
			
			// System.out.println(sid);
		}

		return "/main";
	}

	@GetMapping("/main/refreshAddress")
	public String refreshAddress(Model model, HttpSession session) {

		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		userInfo.setLatitude((double) model.getAttribute("lat"));
		userInfo.setLongitude((double) model.getAttribute("lon"));
		userInfo.setAddress((String) model.getAttribute("address"));

		wyMarketService.updateLatLonAddress(userInfo);
		userInfo = wyMarketService.selectUserInfoByUserNick(userInfo.getUserNick());
		wyMarketService.updateAddressFromItem(userInfo);
		wyMarketService.updateAddressFromSearchInDistance(userInfo);

		session.setAttribute("user", userInfo);

		return "redirect:/main";
	}

}
