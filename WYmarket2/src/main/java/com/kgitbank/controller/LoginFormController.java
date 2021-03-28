package com.kgitbank.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kgitbank.model.KakaoProfile;
import com.kgitbank.model.OAuthToken;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.ChattingService;
import com.kgitbank.service.UserService;
import com.kgitbank.service.WYmarketService;

@Controller
@SessionAttributes(names = { "lat", "lon", "address" })
public class LoginFormController {

	OAuthToken oauthToken = null;
	String mail = "";
	UserInfo user;
	@Autowired
	private WYmarketService wyMarketService;

	@Autowired
	ChattingService chattingService;

	@Autowired
	private UserService service;

	@GetMapping("/location")
	public String location() {
		return "location";
	}

	@GetMapping("/address")
	public String address() {
		return "address";
	}

	int ch = 0;

	private boolean withFlag = false;

	// 회원 탈퇴
	@RequestMapping("/withdrawal")
	public String withdrawal() {
		return "withdrawal";
	}

	// 회원 탈퇴
	@RequestMapping("/userDelete")
	public String userDelete(HttpSession session, String ncontent) {
		user = (UserInfo) session.getAttribute("user");

		// 유저 정보 + 탈퇴 사유 등록
		service.insertWithdrawal(user.getUserNick(), ncontent, user.getPhoneNumber(), user.getKakaoMail());

		// 유저 관련 정보 삭제
		service.deleteUserInfo(user.getUserNick());

		session.removeAttribute("user");

		return "redirect:/main";
	}

	// 로그인
	@GetMapping("/login")
	public String loginPage(Model model, HttpSession session) {
		
		if (ch == 0) {
			chattingService.resetCountAll();// 카운트db 초기화
			ch++;

		}
		System.out.println("로그인쪽 : " + session.getAttribute("kakaoWithdrawal"));
		System.out.println("여기 with : " + withFlag);
		if (!withFlag) {
			session.removeAttribute("kakaoWithdrawal");

		}
		withFlag = false;
//		if (session.getAttribute("Admin") != null) {
//			System.out.println("관리자페이지 세션에 든 값 : " + session.getAttribute("Admin"));
//			return "redirect:/admin";
//		}
//		if (session.getAttribute("user") != null) {
//			System.out.println("메인페이지 세션에 든 값 : " + session.getAttribute("user"));
//			return "redirect:/main";
//		} else {
//			System.out.println("로그인페이지 세션에 든 값 : " + session.getAttribute("user"));
//			return "/login/login";
//		}
		return "/login/login";
	}

	@GetMapping("/auth/kakao")
	public String loginForm() {
		return "loginForm";
	}

	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {

		session.removeAttribute("Admin");
		session.removeAttribute("user");
		System.out.println("왜 안 읽혀" + session.getAttribute("user"));
		System.out.println("adminInfo in loginformcontroller" + session.getAttribute("Admin"));

		return null;
	}

	// 로그아웃
	@GetMapping("/auth/kakao/logout")
	public String logout(String code, HttpSession session, Model model) {
		// 지워야 하는 코드------------------------아래로

		RestTemplate rt3 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers3 = new HttpHeaders();
		headers3.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers3.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params2 = new LinkedMultiValueMap<>();
		params2.add("grant_type", "authorization_code");
		params2.add("client_id", "f5c99e47d61ce4b7e521d120e1f04199");
		params2.add("redirect_uri", "http://localhost:8080/wymarket/auth/kakao/logout");
		params2.add("code", code);

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest3 = new HttpEntity<>(params2, headers3);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response3 = rt3.exchange("https://kapi.kakao.com/v1/user/logout", HttpMethod.POST,
				kakaoProfileRequest3, String.class);

		ObjectMapper objectMapper3 = new ObjectMapper();
		KakaoProfile kakaoprofile = null;

		try {
			kakaoprofile = objectMapper3.readValue(response3.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		// 지워야 하는 코드------------------------위로
		session.removeAttribute("user");
		System.out.println(session.getAttribute("user"));

		return "logout";
	}

	// 로그인
	@GetMapping(value = "/auth/kakao/login")
	public String kakaoLogin(String code, Model model, HttpSession session) {

		// post방식으로 key=value 데이터를 요청(카카오쪽으로)

		// session.removeAttribute("kakaoWithdrawal");

		RestTemplate rt = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "f5c99e47d61ce4b7e521d120e1f04199");
		params.add("redirect_uri", "http://localhost:8080/wymarket/auth/kakao/login");
		params.add("code", code);

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());
		 

		// -------------------------------profile--------------------------------
		// 카카오로부터 정보 받기

		RestTemplate rt2 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");

		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		// Http 요청 - POST방식으로 - response 변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);

		ObjectMapper objectMapper2 = new ObjectMapper();

		KakaoProfile kakaoprofile = null;

		try {
			kakaoprofile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		mail = kakaoprofile.getKakao_account().getEmail();

		String userNick = wyMarketService.getUserNickByMail(mail); 

		int result = service.selectKakaoMail(mail); 

		model.addAttribute("confirm", result);

		// User 오브젝트 : username, password, email 

		if (userNick != null) {
			UserInfo userInfo = (UserInfo) wyMarketService.selectUserInfoByMail(mail);

			userInfo.setUserID(wyMarketService.selectIdByUserNick(userInfo.getUserNick()));

			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
			Date now = new Date();
			Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());

			if (wyMarketService.selectUserAccessCount(userInfo.getUserNick()) >= 1) {
				if (!format.format(now).equals(format.format(userAccessDate))) {
					wyMarketService.insertUserAccessDate(userInfo.getUserNick());
					// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
					wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
				}
			} else {
				wyMarketService.insertUserAccessDate(userInfo.getUserNick());
				// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
				wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
			}

			session.setAttribute("user", userInfo);
		} // 수정 필요하면 고쳐야 됨..

		// 가입유무 : 1이면 바로 메인페이지로 리턴
		if (result == 1) {
			return "redirect:/main";
		} else {
			return "kakaousernick";
		} 
	}

	@PostMapping(value = "auth/kakao/kakaonick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String join(@RequestBody UserInfo userInfo, Model model, HttpSession session) {

		int kakaoCnt = wyMarketService.selectCountFromWithdrawByKakaoMail(mail);
		System.out.println("kakakoCnt : " + kakaoCnt);

		String reSignUp = null;

		if (kakaoCnt == 1) {

			reSignUp = wyMarketService.selectReSignUpByMail(mail);
			if (reSignUp.equals("N")) {
				session.setAttribute("kakaoWithdrawal", 1);
				withFlag = true;
			}
			Date banDate = wyMarketService.selectBanDateByMail(mail);
			System.out.println(banDate);
			if (banDate != null) {
				Calendar getToday = Calendar.getInstance();
				getToday.setTime(new Date()); // 현재 날짜

				Calendar cmpDate = Calendar.getInstance();
				cmpDate.setTime(banDate); // 특정 일자

				long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
				diffSec = -diffSec;
				long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

				if (diffDays <= 0) {
					if (kakaoCnt == 1) {
						wyMarketService.updateReSignUpByMail(mail);
					} else if (kakaoCnt >= 2) {
						wyMarketService.updateReSignUpByMailAndMaxDate(mail);
					}
					withFlag = false;
					userInfo.setLatitude((double) model.getAttribute("lat"));
					userInfo.setLongitude((double) model.getAttribute("lon"));
					userInfo.setAddress((String) model.getAttribute("address"));
					userInfo.setKakaoMail(mail);
					userInfo.setUserNick(userInfo.getUserNick());

					System.out.println("db에 넣을 메일: " + mail);
					System.out.println("db에 넣을 닉네임: " + userInfo.getUserNick());
					System.out.println(userInfo);

					int rs = service.insertUser(userInfo);
					System.out.println("자동가입 확인 유무: " + rs);

					SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
					// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
					Date now = new Date();
					Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());

					if (wyMarketService.selectUserAccessCount(userInfo.getUserNick()) >= 1) {
						if (!format.format(now).equals(format.format(userAccessDate))) {
							wyMarketService.insertUserAccessDate(userInfo.getUserNick());
							// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
							wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
						}
					} else {
						wyMarketService.insertUserAccessDate(userInfo.getUserNick());
						// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
						wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
					}

					userInfo.setUserID(wyMarketService.selectIdByUserNick(userInfo.getUserNick()));

					session.setAttribute("user", userInfo);

					return "redirect:/main";
				} else {
					session.setAttribute("penaltyTimeKakao", diffDays);
				}
			}

			return "/login/login";
		} else if (kakaoCnt >= 2) {

			reSignUp = wyMarketService.selectReSignUpByMailAndMaxDate(mail);
			if (reSignUp.equals("N")) {
				session.setAttribute("kakaoWithdrawal", 1);
				withFlag = true;
			}
			Date banDate = wyMarketService.selectBanDateByMail(mail);
			System.out.println(banDate);
			if (banDate != null) {
				Calendar getToday = Calendar.getInstance();
				getToday.setTime(new Date()); // 현재 날짜

				Calendar cmpDate = Calendar.getInstance();
				cmpDate.setTime(banDate); // 특정 일자

				long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
				diffSec = -diffSec;
				long diffDays = diffSec / (24 * 60 * 60);// 일자수 차이

				if (diffDays <= 0) {
					if (kakaoCnt == 1) {
						wyMarketService.updateReSignUpByMail(mail);
					} else if (kakaoCnt >= 2) {
						wyMarketService.updateReSignUpByMailAndMaxDate(mail);
					}
					withFlag = false;
					userInfo.setLatitude((double) model.getAttribute("lat"));
					userInfo.setLongitude((double) model.getAttribute("lon"));
					userInfo.setAddress((String) model.getAttribute("address"));
					userInfo.setKakaoMail(mail);
					userInfo.setUserNick(userInfo.getUserNick());

					System.out.println("db에 넣을 메일: " + mail);
					System.out.println("db에 넣을 닉네임: " + userInfo.getUserNick());
					System.out.println(userInfo);

					int rs = service.insertUser(userInfo);
					System.out.println("자동가입 확인 유무: " + rs);

					SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
					// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
					Date now = new Date();
					Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());

					if (wyMarketService.selectUserAccessCount(userInfo.getUserNick()) >= 1) {
						if (!format.format(now).equals(format.format(userAccessDate))) {
							wyMarketService.insertUserAccessDate(userInfo.getUserNick());
							// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
							wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
						}
					} else {
						wyMarketService.insertUserAccessDate(userInfo.getUserNick());
						// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
						wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
					}

					userInfo.setUserID(wyMarketService.selectIdByUserNick(userInfo.getUserNick()));

					session.setAttribute("user", userInfo);

					return "redirect:/main";
				} else {
					session.setAttribute("penaltyTimeKakao", diffDays);
				}
			}

			return "/login/login";
		}

		userInfo.setLatitude((double) model.getAttribute("lat"));
		userInfo.setLongitude((double) model.getAttribute("lon"));
		userInfo.setAddress((String) model.getAttribute("address"));
		userInfo.setKakaoMail(mail);
		userInfo.setUserNick(userInfo.getUserNick());

		System.out.println("db에 넣을 메일: " + mail);
		System.out.println("db에 넣을 닉네임: " + userInfo.getUserNick());
		System.out.println(userInfo);

		int rs = service.insertUser(userInfo);
		System.out.println("자동가입 확인 유무: " + rs);

		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
		Date now = new Date();
		Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());

		if (wyMarketService.selectUserAccessCount(userInfo.getUserNick()) >= 1) {
			if (!format.format(now).equals(format.format(userAccessDate))) {
				wyMarketService.insertUserAccessDate(userInfo.getUserNick());
				// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
				wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
			}
		} else {
			wyMarketService.insertUserAccessDate(userInfo.getUserNick());
			// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
			wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
		}

		userInfo.setUserID(wyMarketService.selectIdByUserNick(userInfo.getUserNick()));

		session.setAttribute("user", userInfo);

		return "redirect:/main";
	}

}