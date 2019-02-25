package com.tns.healing.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tns.healing.admin.service.AdminService;
import com.tns.healing.member.vo.MemberVO;
import com.tns.healing.shopping.vo.ProductVO;

@Controller
public class AdminController {

	private ModelAndView mav;

	@Autowired
	private AdminService as;

	// 관리자 모드 페이지 요청
	@RequestMapping(value = "/adminModeForm", method = RequestMethod.GET)
	public String adminModeForm() {
		System.out.println("adminModeForm 메소드 호출");
		return "admin/adminModeForm";
	}

	// 회원관리 페이지 요청
	@RequestMapping(value = "/memberManagementForm", method = RequestMethod.GET)
	public ModelAndView memberManagementForm(HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("memberManagementForm 메소드 호출");
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		int MEMBER_DIVISION = (int) session.getAttribute("MEMBER_DIVISION");
		if (MEMBER_ID == null || MEMBER_DIVISION != 4) {
			// 로그인 상태 재확인
			mav.setViewName("member/loginForm");
		} else {
			mav = as.memberManagementForm(response);
		}
		return mav;
	}

	// 회원 삭제 메소드
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("MEMBER_ID") String MEMBER_ID) {
		as.memberDelete(MEMBER_ID);
		// 삭제 후 다시 회원 관리 페이지 요청 메소드 호출
		return "redirect:memberManagementForm";
	}

	// 상품등록 페이지 요청
	@RequestMapping(value = "/productUpdateForm", method = RequestMethod.GET)
	public String productUpdateForm() {
		return "admin/productUpdateForm";
	}

	// 상품등록 요청 메소드
	@RequestMapping(value = "/productUpdate")
	public ModelAndView productUpdate(@ModelAttribute ProductVO productVO, HttpServletResponse response)
			throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile bFile = productVO.getPRODUCT_IMAGE();
		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\uploadFile\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}
		productVO.setPRODUCT_IMAGE_NAME(bFile.getOriginalFilename());
		mav = as.productUpdate(productVO, response);
		return mav;
	}

	// 업자회원 승인
	@RequestMapping(value = "/memberApprove", method = RequestMethod.GET)
	public void memberApprove(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		as.memberApprove(memberVO, response);
	}

	// 상품등록 페이지 요청
	@RequestMapping(value = "/companyApproveForm", method = RequestMethod.GET)
	public ModelAndView companyApproveForm() {
		mav = new ModelAndView();
		mav=as.companyApproveForm();
		return mav;
	}

	// 회사 승인 요청
	@RequestMapping(value = "/companyApprove", method = RequestMethod.GET)
	public ModelAndView companyApprove(@RequestParam("companyNum") String company_num) {
		mav = new ModelAndView();
		mav= as.companyApprove(company_num);
		return mav;
	}
}
