package com.kgitbank.controller.rest;

import java.io.Serializable;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kgitbank.controller.LoginFormController;
import com.kgitbank.model.AdminInfo;
import com.kgitbank.model.Inquiry;
import com.kgitbank.model.InquiryAdminToUser;
import com.kgitbank.model.Pagination;
import com.kgitbank.model.UserIP;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GpsDistance;
import com.kgitbank.service.GpsToAddress;
import com.kgitbank.service.WYmarketService;
import com.kgitbank.service.CertificationService;
import com.kgitbank.service.DateCalc;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
@SessionAttributes({ "smscodes", "phonenumber", "check", "lat", "lon", "address", "user", "findph" })
public class RestControllerMain implements Serializable {

	@Autowired
	private WYmarketService wyMarketService;

	private String newAddress = null;

	private int result = 0;

	private boolean withFlag = false;

	// 위도 경도를 주소로 변환하고 DB에 저장하고 다시 메인페이지로 이동
	@GetMapping(value = { "/wymarket/address/{lat}/{lon:.+}" }, produces = "text/html; charset=UTF-8")
	public String gpsGet(@PathVariable("lat") double lat, @PathVariable("lon") double lon, Model model,
			HttpSession session) {
		System.out.println(lat);
		System.out.println(lon);
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);

		try {
			String address = new GpsToAddress(lat, lon).getAddress();
			System.out.println(address);
			model.addAttribute("address", address);
			String[] addressPart = address.split(" ");

			for (int i = 0; i < addressPart.length; i++) {
				for (int j = 0; j < addressPart[i].length(); j++) {
					if (addressPart[i].charAt(j) == '동' && j == addressPart[i].length() - 1) {
						newAddress = addressPart[i];
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "<p>가입하고 " + newAddress + "<br>중고 상품을 구경하세요!<p/>";
	}

	@PostMapping(value = { "/getsms/{sms}" }, produces = "text/html; charset=UTF-8")
	public String sendSMS(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model, HttpSession session,
			UserIP userIp) {

		// session.removeAttribute("kakaoWithdrawal");

		if (withFlag) {
			withFlag = false;
			return null;
		}

		String ip = null;

		try {
			ip = Inet4Address.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (wyMarketService.getIpCnt(ip) == 0) {
			int insertIp = wyMarketService.insertIp(ip);

		} else {
			int updateIpCnt = wyMarketService.updateIpCnt(ip);
		}

		if (wyMarketService.getSmsCnt(ip) >= 4) {

			userIp.setSmsExceedDate(new Date());

			Date getSmsExceedDate = wyMarketService.getSmsExceedDate(ip);

			Calendar getToday = Calendar.getInstance();
			getToday.setTime(userIp.getSmsExceedDate()); // 현재 날짜

			Calendar cmpDate = Calendar.getInstance();
			System.out.println(cmpDate + "/" + getSmsExceedDate);
			cmpDate.setTime(wyMarketService.getSmsExceedDate(ip)); // 특정 일자

			long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
			long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

			System.out.println(diffSec + "초 차이");
			System.out.println(diffDays + "일 차이");

			session.setAttribute("exceedTime", diffSec);
			
			if(diffSec > 300) {
				int exceedUpdate = wyMarketService.updateSmsExceedDate(ip);

				String dashPhoneNumber = getPhoneNumberMethod(phoneNumber);
				String numStr = getSmsMethod();
				// CertificationService.certifiedPhoneNumber(phoneNumber,numStr);
				result = wyMarketService.getAdminPhCount(dashPhoneNumber);

				if (result == 0) {
					result = wyMarketService.selectphonenumber(dashPhoneNumber);
				}

				return numStr;
			}
			
			return "4";
		} else {

			if (wyMarketService.getSmsCnt(ip) == 3) {
				wyMarketService.insertSmsExceedDate(ip);
			}

			String dashPhoneNumber = getPhoneNumberMethod(phoneNumber);
			String numStr = getSmsMethod();
			//CertificationService.certifiedPhoneNumber(phoneNumber,numStr);
			result = wyMarketService.getAdminPhCount(dashPhoneNumber);

			if (result == 0) {
				result = wyMarketService.selectphonenumber(dashPhoneNumber);
			}

			return numStr;
		}

		
	}

	@PostMapping(value = { "/getph/{sms}" }, produces = "text/html; charset=UTF-8")
	public String sendph(@PathVariable("sms") String phoneNumber, UserInfo userInfo, Model model) {

		return phoneNumber;
	}



	// 3회 초과했을 때 남은 시간 반환
	@PostMapping(value = { "/exceedTime" }, produces = "text/html; charset=UTF-8")
	public String exceedTime(Model model, HttpSession session) {

		long time = 300 - (long) session.getAttribute("exceedTime");
		String timeStr = String.valueOf(time);

		return timeStr;
	}

	@PostMapping(value = { "/toNick" }, produces = "text/html; charset=UTF-8")
	public String toNick(Model model) {

		System.out.println(result);
		String check = String.valueOf(result);

		return check;
	}

	@PostMapping(value = "/selectNick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String selectNick(@RequestBody UserInfo userInfo, Model model) {

		int nickCnt = wyMarketService.selectusernick(userInfo.getUserNick());
		String cntStr = String.valueOf(nickCnt);
		model.addAttribute("check", cntStr);

		return cntStr;
	}

	@PostMapping(value = "/updateNick", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String updateNick(@RequestBody UserInfo userInfo, Model model, HttpSession session) {

		userInfo.setLatitude((double) model.getAttribute("lat"));
		userInfo.setLongitude((double) model.getAttribute("lon"));
		userInfo.setAddress((String) model.getAttribute("address"));

		String dashPhoneNumber = userInfo.getPhoneNumber().substring(0, 3) + "-"
				+ userInfo.getPhoneNumber().substring(3, 7) + "-" + userInfo.getPhoneNumber().substring(7);
		userInfo.setPhoneNumber(dashPhoneNumber);

		int result = wyMarketService.insertUserPhNk(userInfo);

		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
		Date now = new Date();
		Date userAccessDate = wyMarketService.selectUserAccessDate(userInfo.getUserNick());
		if (wyMarketService.selectUserAccessCount(userInfo.getUserNick()) >= 1) {
			if (format.format(now) != format.format(userAccessDate)) {
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

		session.setAttribute("user", userInfo); // 중요, 닉네임에 VO 담음

		return null;
	}

	// 관리자 또는 사용자 메인 페이지로 넘어가기 전에 세션에 정보 담음
	@PostMapping(value = { "/ajaxToMain" }, consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String ajaxToMain(@RequestBody UserInfo userInfo, AdminInfo adminInfo, Model model, HttpSession session) {

		String dashPhoneNumber = userInfo.getPhoneNumber().substring(0, 3) + "-"
				+ userInfo.getPhoneNumber().substring(3, 7) + "-" + userInfo.getPhoneNumber().substring(7);

		// 관리자가 로그인하려는 것이라면
		if (wyMarketService.getAdminPhCount(dashPhoneNumber) == 1) {
			adminInfo = new AdminInfo();
			Map<String, Object> adminList = wyMarketService.getAdminInfo(dashPhoneNumber);
			AdminInfo topAdminInfo = wyMarketService.getAdminInfo2();
			adminInfo.setAdminMemo(topAdminInfo.getAdminMemo());
			adminInfo.setPhoneNumber((String) adminList.get("PHONENUMBER"));
			adminInfo.setAdminNick((String) adminList.get("ADMINNICK"));
			adminInfo.setAdminCreateDate((Date) adminList.get("ADMINCREATEDATE"));
			adminInfo.setAdminGrade((String) adminList.get("ADMINGRADE"));
//         adminInfo.setAdminMemo((String) adminList.get("ADMINMEMO"));
			session.setAttribute("Admin", adminInfo);
		}
		// 사용자가 로그인하려는 것이라면
		else {
			userInfo.setPhoneNumber(dashPhoneNumber);
			UserInfo info = wyMarketService.selectUserInfo(userInfo.getPhoneNumber());

			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			// 일자별 접속자 수 알기 위한 쿼리 (하루 동안 동일한 접속자 중복 수 제거)
			Date now = new Date();
			Date userAccessDate = wyMarketService.selectUserAccessDate(info.getUserNick());
			
			if (wyMarketService.selectUserAccessCount(info.getUserNick()) >= 1) {
				if (!format.format(now).equals(format.format(userAccessDate))) {
					wyMarketService.insertUserAccessDate(info.getUserNick());
					// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
					wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
				}
			} else {
				wyMarketService.insertUserAccessDate(info.getUserNick());
				// 누적 접속자 수 알기 위해 카운트 올리는 DB 쿼리
				wyMarketService.updateUserCountTotal(wyMarketService.selectAccessCount());
			}

			userInfo.setUserID(wyMarketService.selectIdByUserNick(info.getUserNick()));

			session.setAttribute("user", info);

		}

		return String.valueOf(wyMarketService.getAdminPhCount(dashPhoneNumber));
	}

	@PostMapping(value = "/saveMemo", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String saveMemo(@RequestBody AdminInfo adminInfo, Model model, HttpSession session) {
		int updateRow = wyMarketService.updateAdminMemo(adminInfo);
		adminInfo = (AdminInfo) session.getAttribute("Admin");
		adminInfo = (AdminInfo) wyMarketService.getAdminInfo2();

		session.setAttribute("Admin", adminInfo);
		System.out.println(session.getAttribute("Admin"));
		return null;
	}

	@GetMapping("/admin/ban/{userNick}")
	public String adminUserBan(@PathVariable("userNick") String userNick, Model model) {
		int updateBan = wyMarketService.updateUserBan(userNick);
		String selectBanResult = wyMarketService.selectUserBan(userNick);

		return selectBanResult;
	}

	@GetMapping(value = "/admin/unban/{userNick}", produces = "text/html; charset=UTF-8")
	public String adminUserUnBan(@PathVariable("userNick") String userNick, Model model) {
		int updateResult = wyMarketService.updateUserUnBan(userNick);
		String selectBanResult = wyMarketService.selectUserBan(userNick);

		return selectBanResult;
	}

	// 사용자가 보낸 문의를 관리자가 li를 클릭해서 modal 띄울 때
	@PostMapping(value = "/admin/inquiryModal", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String inquiryModal(@RequestBody Inquiry inquiry, Model model, HttpSession session) {

		inquiry = (Inquiry) wyMarketService.selectInquiryByID(inquiry.getInquiryID());

		session.setAttribute("inqVO", inquiry);
		System.out.println(session.getAttribute("inqVO"));

		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");

		return "					<div class=\"container\" id='inquiryContainer'>\r\n"
				+ "						<div class=\"container\" id='inquiryContainerInner'>\r\n"
				+ "							<p>닉네임 : " + inquiry.getUserNick() + "</p>\r\n" + "<p>카테고리 : "
				+ inquiry.getInquiryCategory() + "</p>\r\n" + "<p>날짜 : " + format.format(inquiry.getInquiryDate())
				+ "</p>"
				+ "							<textarea class=\"form-control\" aria-label=\"With textarea\"\r\n"
				+ "								\" name=\"textArea\"\r\n"
				+ "								readonly=\"readonly\">" + inquiry.getInquiryContent()
				+ "</textarea>\r\n" + "						</div>\r\n" + "					</div>";
	}

	// 답장하는 textarea 띄우는 버튼 누를 때
	@PostMapping(value = "/admin/adminToUser", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String adminToUser(@RequestBody Inquiry inquiry, Model model, HttpSession session) {

		return "		<textarea class=\"form-control\" aria-label=\"With textarea\"\r\n"
				+ "			placeholder=\"답장하실 내용을 여기에 입력해주세요 :)\" name=\"textArea\" id='text'></textarea>\r\n"
				+ "		<button class=\"btn btn-primary\" id='inquirybtn' data-bs-dismiss=\"modal\" onclick=\"ajaxReply("
				+ inquiry.getInquiryID() + ")\">답장\r\n" + "			보내기</button>";
	}

	// 사용자가 문의 내역 li를 클릭할 때 & 관리자가 송신함 li 클릭할 때
	@PostMapping(value = "/checkHistory", consumes = "application/json", produces = "text/html; charset=UTF-8")
	public String checkHistory(@RequestBody InquiryAdminToUser inq, Model model, HttpSession session) {
		InquiryAdminToUser iatu = wyMarketService.selectInquiryAdminToUserByID(inq.getInquiryID());
		Inquiry i = wyMarketService.selectInquiryByID(iatu.getUserInquiryID());
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");

		return "				<div class=\"modal-header\">\r\n"
				+ "					<h5 class=\"modal-title\" id=\"exampleModalLabel\">수신함</h5>\r\n"
				+ "					<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\"\r\n"
				+ "						aria-label=\"Close\"></button>\r\n" + "				</div>\r\n"
				+ "				<div class=\"modal-body\" id='modalContent'>\r\n"
				+ "					<div class=\"container\" id='inquiryContainer'>\r\n"
				+ "						<div class=\"container\" id='inquiryContainerInner'>\r\n"
				+ "							<p>닉네임 : " + i.getUserNick() + "</p>\r\n"
				+ "							<p>카테고리 : " + i.getInquiryCategory() + "</p>\r\n" + "<p>날짜 : "
				+ format.format(i.getInquiryDate()) + "</p>"
				+ "							<textarea class=\"form-control\" aria-label=\"With textarea\"\r\n"
				+ "								name=\"textArea\" readonly=\"readonly\">" + i.getInquiryContent()
				+ "\r\n" + "				</textarea>\r\n" + "						</div>\r\n"
				+ "					</div>\r\n" + "				</div>\r\n"
				+ "				<div class=\"modal-footer\">\r\n"
				+ "					<p>관리자가 보낸 답장</p><textarea class=\"form-control\" id=\"text1\"aria-label=\"With\r\n"
				+ "						textarea\"\r\n"
				+ "						name=\"textArea\" readonly=\"readonly\">" + iatu.getInquiryContent()
				+ "</textarea>\r\n" + "				</div>";
	}

	// 답장 보내기 확정 버튼 눌렀을 때
	@GetMapping(value = "/admin/sendInquiryAdminToUser/{textarea}/{inquiryID}", produces = "text/html; charset=UTF-8")
	public String sendInquiryAdminToUser(Model model, HttpSession session, @PathVariable String textarea,
			@PathVariable int inquiryID) {

		Inquiry inquiry = (Inquiry) session.getAttribute("inqVO");
		System.out.println("inquiry : " + inquiry);
		InquiryAdminToUser inquiryAdminToUser = new InquiryAdminToUser();
		inquiryAdminToUser.setUserInquiryID(inquiry.getInquiryID());
		inquiryAdminToUser.setUserNick(inquiry.getUserNick());
		inquiryAdminToUser.setInquiryCategory(inquiry.getInquiryCategory());
		inquiryAdminToUser.setInquiryContent(textarea);
		inquiryAdminToUser.setInquiryDate(new Date());
		wyMarketService.insertInquiryAdminToUser(inquiryAdminToUser);

		int maxiatu = wyMarketService.selectMaxInquiryAdminToUserByID();

		wyMarketService.updateInquiryUserCountTotal();

		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");
		String formatStr = format.format(new Date());
		System.out.println("이 아디" + inquiryAdminToUser.getInquiryID());

		return "<li class=\"list-group-item lili\" \r\n" + "							onclick=\"ajaxshowHistory("
				+ maxiatu + ")\">문의 번호 :\r\n" + "							" + inquiry.getInquiryID() + " <br> 닉네임 : "
				+ inquiry.getUserNick() + " <br>\r\n" + "							카테고리 : "
				+ inquiry.getInquiryCategory() + "<br> 날짜 : " + formatStr + "</li>";
	}

	@GetMapping("/dateWithdrawal/{ph}")
	public String dateWithdrawal(@PathVariable String ph, HttpSession session) {

		session.removeAttribute("penaltyTime");

		String dashPhoneNumber = ph.substring(0, 3) + "-" + ph.substring(3, 7) + "-" + ph.substring(7);

		int phCnt = wyMarketService.selectCountFromWithdrawByPhoneNumber(dashPhoneNumber);

		String reSignUp = null;

		if (phCnt == 1) {
			reSignUp = wyMarketService.selectReSignUpByPhoneNumber(dashPhoneNumber);
			if (reSignUp.equals("N")) {
				withFlag = true;
			}
		} else if (phCnt >= 2) {
			reSignUp = wyMarketService.selectReSignUpByPhoneNumberAndMaxDate(dashPhoneNumber);
			if (reSignUp.equals("N")) {
				withFlag = true;
			}
		}

		Date banDate = wyMarketService.selectBanDateByPhoneNumber(dashPhoneNumber);
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
				if (phCnt == 1) {
					wyMarketService.updateReSignUpByPhoneNumber(dashPhoneNumber);
					reSignUp = wyMarketService.selectReSignUpByPhoneNumber(dashPhoneNumber);
				} else if (phCnt >= 2) {
					wyMarketService.updateReSignUpByPhoneNumberAndMaxDate(dashPhoneNumber);
					reSignUp = wyMarketService.selectReSignUpByPhoneNumberAndMaxDate(dashPhoneNumber);
				}
				withFlag = false;
			} else {
				session.setAttribute("penaltyTime", diffDays);
			}
		}

		return reSignUp;
	}

	@GetMapping("/dateWithdrawalModal/{ph}")
	public String dateWithdrawalModal(@PathVariable String ph, HttpSession session, Model model) {

		return "" + session.getAttribute("penaltyTime");
	}

	@GetMapping("/dateWithdrawalModalKakao")
	public String dateWithdrawalModalKakao(HttpSession session, Model model) {

		return "" + session.getAttribute("penaltyTimeKakao");
	}

	@GetMapping("/admin/dayCheck/{year}/{month}")
	public String adminDayCheck(@PathVariable("year") int year, @PathVariable("month") int month, HttpSession session,
			HttpServletRequest req, Model model, Pagination page) {
		// 해당 일

		session.setAttribute("selectedYear", year);
		session.setAttribute("selectedMonth", month);

		return "" + new DateCalc(year, month).getDay() + "";
	}

	public static String getPhoneNumberMethod(String phoneNumber) {
		
		System.out.println("수신자 번호 : " + phoneNumber);

		String dashPhoneNumber = phoneNumber.substring(0, 3) + "-" 
		+ phoneNumber.substring(3, 7) + "-" + phoneNumber.substring(7);
		
		return dashPhoneNumber;
	}
	
	public static String getSmsMethod() {

		Random rand = new Random();

		String numStr = "";
		
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		System.out.println("인증번호 : " + numStr);
		
		return numStr;
	}
	
}