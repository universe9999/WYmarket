package com.kgitbank.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.model.GoodsVO;
import com.kgitbank.model.SearchInDistance;
import com.kgitbank.model.UserInfo;
import com.kgitbank.service.GoodsService;
import com.kgitbank.service.WYmarketService;
import com.kgitbank.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
@SessionAttributes({ "userNick" })
public class GoodsController {

	@Autowired
	GoodsService gservice;

	@Autowired
	WYmarketService wyMarketService;

	@Autowired
	private String uploadPath;
	UserInfo user;

	// 상품등록페이지
	@GetMapping("register2")
	public void getGoodsRegister() throws Exception {
		log.info("상품등록페이지");
	}

	// 상품 등록
	@PostMapping("add")
	public String success(Model model, @ModelAttribute GoodsVO goods, MultipartFile file, HttpSession session)
			throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png"; // 미리 준비된 none.png파일을 대신 출력함

			goods.setIimagepath(fileName);
		}

		user = (UserInfo) session.getAttribute("user");
		model.addAttribute("userNick", user.getUserNick()); // 주의

		int result = gservice.createGoods(goods, user.getUserNick(), goods.getItitle(), goods.getIcategory(),
				goods.getIcontent(), goods.getPrice(), goods.getIimagepath());

		return "/goods/loading";
	}

	// 상품 조회
	@RequestMapping(value = "/view2", method = RequestMethod.GET)
	public void getList(@RequestParam("n") int itemid, Model model, HttpSession session) {
		// SearchInDistance sid = wyMarketService.selectSearchInDistanceById(itemid);
		GoodsVO item = gservice.getGoods(itemid);
		model.addAttribute("goods", item);
		// 구매자 시퀀스 필요
		String nick = gservice.getId(item.getUsernick());
		user = (UserInfo) session.getAttribute("user");
		session.setAttribute("buyerId", user.getUserID());
		session.setAttribute("buyerName", user.getUserNick());
		session.setAttribute("sellerId", nick);
	}

	// 상품 수정페이지
	@RequestMapping(value = "/modify2", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int itemid, Model model) {
		System.out.println(itemid);
		// SearchInDistance sid = wyMarketService.selectSearchInDistanceById(itemid);
		System.out.println(itemid);
		GoodsVO item = gservice.getGoods(itemid);
		model.addAttribute("goods", item);

	}
	
	//상품 수정
	@RequestMapping(value = "/modify2", method = RequestMethod.POST) 
	public String postGoodsModify(@ModelAttribute GoodsVO goods, MultipartFile file, HttpServletRequest req)
			throws Exception {
		// 새로운 파일이 등록되었는지 확인 
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") { 
			// 기존 파일을 삭제 
			System.out.println(req.getParameter("iimagepath"));
			System.out.println("ㅎㅎ");
			new File(uploadPath + req.getParameter("iimagepath")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			goods.setIimagepath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			System.out.println(goods.getIimagepath());

		} else { // 새로운 파일이 등록되지 않았다면 // 기존 이미지를 그대로 사용
			System.out.println(req.getParameter("iimagepath"));
			System.out.println("ㅠㅠ");
			goods.setIimagepath(req.getParameter("iimagepath"));
		}

		/*
		 * gservice.goodsModify(goods,goods.getItitle(), goods.getIcategory(),
		 * goods.getIcontent(), goods.getPrice(), goods.getIimagepath());
		 */
		gservice.goodsModify(goods);

		return "/goods/loading";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("n") int itemid) {
		gservice.goodsDelete(itemid);
		return "redirect:/main";
	}

	
}
