package com.tns.healing.admin.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.tns.healing.admin.dao.AdminDAO;
import com.tns.healing.member.vo.MemberVO;
import com.tns.healing.room.vo.CompanyVO;
import com.tns.healing.shopping.vo.ProductVO;

import java.util.List;

@Service
public class AdminService {

	private ModelAndView mav;

	@Autowired
	private AdminDAO adminDAO;

	// 회원관리 페이지 요청 메소드
	public ModelAndView memberManagementForm(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		List<MemberVO> memberList = adminDAO.memberManagementForm();
		if (memberList == null) {
			out.println("<script>");
			out.println("alert('회원목록이 없습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			mav.addObject("memberList", memberList);
			mav.setViewName("admin/memberManagementForm");
		}
		return mav;
	}

	// 회원 삭제 메소드
	public void memberDelete(String mEMBER_ID) {
		adminDAO.memberDelete(mEMBER_ID);
	}

	public ModelAndView productUpdate(ProductVO productVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		int result = adminDAO.productUpdate(productVO);
		PrintWriter out = response.getWriter();
		if (result == 0) {
			out.println("<script>");
			out.println("alert('상품등록 실패.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('상품등록 성공');");
			out.println("location.href='adminModeForm';</script>");
			out.close();
			mav.setViewName("/admin/adminModeForm");
		}
		return mav;
	}

	// 업자 회원 승인
	public void memberApprove(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		int result = adminDAO.memberApprove(memberVO);
		PrintWriter out = response.getWriter();
		if (result == 0) {
			out.println("<script>");
			out.println("alert('승인 실패.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('승인 성공');");
			out.println("location.href='memberManagementForm';</script>");
			out.close();
		}
	}

	public ModelAndView companyApproveForm() {
		mav = new ModelAndView();
		List<CompanyVO> companyList=adminDAO.companyApproveList();
		mav.addObject("companyList", companyList);
		mav.setViewName("admin/companyApprove");
		return mav;
	}

	public ModelAndView companyApprove(String company_num) {
		mav = new ModelAndView();
		System.out.println(company_num);
		adminDAO.companyApprove(company_num);
		mav.setViewName("redirect:/companyApproveForm");
		return mav;
	}
}
