package com.tns.healing.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.member.dao.MemberDAO;
import com.tns.healing.member.vo.MemberVO;

@Service
public class MemberSerivce {

	private ModelAndView mav;

	private MemberVO memberVO;

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private HttpSession session; // 세션 사용

	// 회원가입처리 메소드
	public ModelAndView memberJoin(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		int MEMBER_DIVISION = memberVO.getMEMBER_DIVISION();

		if (MEMBER_DIVISION == 1) { // 일반회원
			int result = memberDAO.memberJoin(memberVO);

			if (result == 0) {
				// 회원 가입 실패
				out.println("<script>");
				out.println("alert('회원가입 실패');");
				out.println("history.go(-1);</script>");
				out.close();
			} else {
				// 회원 가입 성공
				mav.setViewName("home");
			}
		} else {
			int result = memberDAO.memberJoin2(memberVO);

			if (result == 0) {
				// 회원 가입 실패
				out.println("<script>");
				out.println("alert('회원가입 실패');");
				out.println("history.go(-1);</script>");
				out.close();
			} else {
				// 회원 가입 성공
				out.println("<script>");
				out.println("alert('관리자 승인을 기다려주세요');");
				out.println("location.href='home';</script>");
				out.close();
				mav.setViewName("home");
			}
		}

		return mav;
	}

	// 로그인 처리 메소드
	public ModelAndView memberLogin(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		MemberVO loginMember = memberDAO.memberLogin(memberVO);
		PrintWriter out = response.getWriter();

		if (loginMember == null) { // 로그인 실패
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 틀립니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else { // 로그인 성공
			int MEMBER_DIVISION = loginMember.getMEMBER_DIVISION();

			if (MEMBER_DIVISION == 2) {
				out.println("<script>");
				out.println("alert('관리자 승인을 기다려야됩니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			} else {
				session.setAttribute("MEMBER_ID", loginMember.getMEMBER_ID());
				session.setAttribute("MEMBER_DIVISION", loginMember.getMEMBER_DIVISION());
				mav.setViewName("home");
			}
		}
		return mav;
	}

	// 정보 변경 처리 메소드
	public ModelAndView memberModify(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		int memberModify = memberDAO.memberModify(memberVO);
		PrintWriter out = response.getWriter();

		if (memberModify == 0) {
			out.println("<script>");
			out.println("alert('정보 변경 실패');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("location.href='home';</script>");
			out.close();
		}
		return mav;
	}

	// 정보변경 전 비밀번호 확인 메소드
	public ModelAndView memberModifyCheck(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 세션 아이디 값 확인 없을 경우
			out.println("<script>");
			out.println("alert('정상적이지 않은 로그인 입니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 세션 아이디 값 확인 있는 경우
			memberVO.setMEMBER_ID(MEMBER_ID); // 세션에 저장된 아이디 세팅
			MemberVO memberModify = memberDAO.memberModifyCheck(memberVO);

			if (memberModify == null) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			} else {
				mav.addObject("memberModify", memberModify);
				mav.setViewName("member/memberModifyForm");
			}
		}
		return mav;
	}

	// 내가 쓴 리뷰 페이지 요청
	public ModelAndView myReview() {
		mav = new ModelAndView();
		mav.setViewName("member/memberMyReviewForm");
		return mav;
	}

	// 스크랩 페이지 요청
	public ModelAndView myScrapForm() {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		List<BoardScrapVO> boardScrapVO = memberDAO.myScrap(MEMBER_ID);

		mav.addObject("myScrap", boardScrapVO);
		mav.setViewName("member/memberScrapForm");
		return mav;
	}

	// 스크랩 삭제
	public ModelAndView scrapDelete(BoardScrapVO boardScrapVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인
			boardScrapVO.setMEMBER_ID(MEMBER_ID);
			int result = memberDAO.scrapDelete(boardScrapVO);
			if (result > 0) {
				mav.setViewName("redirect:myScrapForm");
			} else {
				out.println("<script>");
				out.println("alert('삭제 실패.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 아이디 중복확인
	public void idOverlap(String mEMBER_ID, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO();
		memberVO = memberDAO.idOverlap(mEMBER_ID);
		if (memberVO == null) {
			// 해당 아이디 사용 가능
			response.getWriter().print("1");
		} else {
			// 해당 아이디 사용 불가
			response.getWriter().print("0");
		}
	}

	// 이메일 인증 코드 생성
	public String createKey(int size, boolean lowerCheck) {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 이메일 인증 키 저장
	public boolean overKey(String key) {
		int result = memberDAO.overKey(key);
		if (result == 0) {
			return true;
		}
		// 생성된 인증 키가 DB에 없으면 do-while을 false로 리턴
		return false;
	}

	// 이메일 전송
	public void mailSending(String mEMBER_EMAIL, String title, String key) {
		String setfrom = "pjs168686@gmail.com";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(mEMBER_EMAIL); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(key); // 메일 내용

			mailSender.send(message); // 메일 전송
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// 이메일 인증 체크
	public String checkKey(String key) {
		String selKey = memberDAO.checkKey(key);
		if (selKey != null) {
			return "1";
		}
		return "0";
	}

	// 내가 쓴 리뷰 정보공유게시판 리뷰
	public ModelAndView memberMyReviewInfo() {
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		List<BoardReviewVO> boardReviewVO = memberDAO.myReview(MEMBER_ID); // 정보공유게시판 리뷰 리스트
		mav.addObject("boardReview", boardReviewVO);
		mav.setViewName("member/memberMyReviewInfo");
		return mav;
	}
}
