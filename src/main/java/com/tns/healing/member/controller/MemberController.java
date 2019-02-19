package com.tns.healing.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.member.service.MemberSerivce;
import com.tns.healing.member.vo.MemberVO;

@Controller
public class MemberController {

	private ModelAndView mav;

	@Autowired
	private MemberSerivce ms;

	@Autowired
	private HttpSession session; // 세션 사용

	// 로그인 페이지 요청
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("loginForm 메소드 호출");
		return "member/loginForm";
	}

	// 회원가입 페이지 요청 메소드
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(@RequestParam("MEMBER_DIVISION") int MEMBER_DIVISION) {
		System.out.println("joinForm 메소드 호출");
		mav = new ModelAndView();
		mav.addObject("MEMBER_DIVISION", MEMBER_DIVISION);
		// 회원 구분 창에서 회원구분 번호를 받아서 회원가입 창으로 값을 넘겨줌
		mav.setViewName("member/joinForm");
		// 회원가입 창 요청
		return mav;
	}

	// 회원 구분 페이지 요청 메소드
	@RequestMapping(value = "/joinDivisionForm", method = RequestMethod.GET)
	public String joinDivisionForm() {
		System.out.println("joinDivisionForm 메소드 호출");
		return "member/joinDivisionForm";
	}

	// 회원가입 처리 메소드
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		System.out.println("memberJoin 메소드 호출");
		System.out.println(memberVO.toString());
		mav = new ModelAndView();
		mav = ms.memberJoin(memberVO, response);
		return mav;
	}

	// 로그인처리 메소드
	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws IOException {
		System.out.println("membrLogin 메소드 호출");
		System.out.println("MEMBER_ID == " + memberVO.getMEMBER_ID() + "  MEMBER_PASS == " + memberVO.getMEMBER_PASS());
		mav = new ModelAndView();
		mav = ms.memberLogin(memberVO, response);
		return mav;
	}

	// 로그아웃처리 메소드
	@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
	public String memberLogout() {
		System.out.println("memberLogout 메소드 호출");
		session.invalidate();
		return "home"; // home.jsp 호출
	}

	// 회원정보 페이지 요청 메소드
	@RequestMapping(value = "/memberInfoForm", method = RequestMethod.GET)
	public String memberInfoForm() {
		System.out.println("memberInfoForm 메소드 호출");
		return "member/memberInfoForm";
	}

	// 정보변경 처리 메소드
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws IOException {
		System.out.println("memberModify 메소드 호출");
		mav = new ModelAndView();
		mav = ms.memberModify(memberVO, response);
		return mav;
	}

	// 정보변경 전 비밀번호 확인 페이지 요청 메소드
	@RequestMapping(value = "/memberModifyCheckForm", method = RequestMethod.GET)
	public String memberModifyCheckForm() {
		System.out.println("memberModifyCheckForm 메소드 호출");
		return "member/memberModifyCheckForm";
	}

	// 정보변경 전 비밀번호 확인요청 메소드
	@RequestMapping(value = "/memberModifyCheck", method = RequestMethod.POST)
	public ModelAndView memberModifyCheck(@ModelAttribute MemberVO memberVO, HttpServletResponse response)
			throws IOException {
		System.out.println("비밀번호 체크 == " + memberVO.getMEMBER_PASS());
		System.out.println("memberModifyCheck 메소드 호출");
		mav = new ModelAndView();
		mav = ms.memberModifyCheck(memberVO, response);
		return mav;
	}

	// 내가 쓴 리뷰 페이지 요청
	@RequestMapping(value = "/myReview", method = RequestMethod.GET)
	public ModelAndView myReview() {
		mav = new ModelAndView();
		mav = ms.myReview();
		return mav;
	}

	// 내가 쓴 리뷰 정보공유게시판 리뷰
	@RequestMapping(value = "/memberMyReviewInfo", method = RequestMethod.GET)
	public ModelAndView memberMyReviewInfo() {
		mav = new ModelAndView();
		mav = ms.memberMyReviewInfo();
		return mav;
	}

	// 스크랩 페이지 요청
	@RequestMapping(value = "/myScrapForm", method = RequestMethod.GET)
	public ModelAndView myScrapForm() {
		mav = new ModelAndView();
		mav = ms.myScrapForm();
		return mav;
	}

	// 스크랩 삭제
	@RequestMapping(value = "/scrapDelete", method = RequestMethod.GET)
	public ModelAndView scrapDelete(@ModelAttribute BoardScrapVO boardScrapVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		mav = ms.scrapDelete(boardScrapVO, response);
		return mav;
	}

	// 아이디 중복확인
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("MEMBER_ID") String MEMBER_ID)
			throws IOException {
		// @Requestparam == Request.getParameter 가능
		System.out.println("중복확인 메소드 실행");
		ms.idOverlap(MEMBER_ID, response);
	}

	// 회원가입
	@RequestMapping(value = "/memberJoin2", method = RequestMethod.GET)
	public String memberJoin2() {
		System.out.println("memberJoin2 메소드 호출");
		return "member/memberJoin";
	}

	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/createKey", method = RequestMethod.POST) // get방식으로 넘겨 받는다.
	public String createKey(@RequestParam("MEMBER_EMAIL") String MEMBER_EMAIL) { //
		System.out.println("createKey 메소드 호출");
		String key = "";
		do {
			key = ms.createKey(30, false); // 인증키 생성
		} while (ms.overKey(key)); // 생성된 인증키 저장
		String title = "healing 메일 인증";
		ms.mailSending(MEMBER_EMAIL, title, key); // 이메일 전송
		return key;
	}

	// 이메일 인증 체크 부분
	@ResponseBody
	@RequestMapping(value = "/checkKey", method = RequestMethod.POST)
	public String checkKey(@RequestParam("key") String key) {
		System.out.println("checkKey 메소드 호출");
		String result = ms.checkKey(key);
		return result;
	}

}
