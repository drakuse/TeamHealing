package com.tns.healing.shopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.shopping.service.ShoppingService;
import com.tns.healing.shopping.vo.CartVO;
import com.tns.healing.shopping.vo.OrderVO;
import com.tns.healing.shopping.vo.PageVO;
import com.tns.healing.shopping.vo.ProductVO;
import com.tns.healing.shopping.vo.Product_ReviewVO;

@Controller
public class ShoppingController {

	@Autowired
	private ShoppingService ss;

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;

	// 쇼핑몰 홈페이지
	@RequestMapping(value = "/shoppingForm", method = RequestMethod.GET)
	public ModelAndView productList(@ModelAttribute ProductVO productVO, @RequestParam("page") int page) {
		mav = new ModelAndView();
		mav = ss.productList(page);
		return mav;
	}

	// 상품상세 페이지
	@RequestMapping(value = "/productDetailForm", method = RequestMethod.GET)
	public ModelAndView productDetail(@RequestParam("PRODUCT_CATEGORY") String PRODUCT_CATEGORY, @RequestParam("PRODUCT_NUM") int PRODUCT_NUM, @RequestParam("page2") int page2, @RequestParam("page") int page) {
		mav = new ModelAndView();
		System.out.println(PRODUCT_CATEGORY);
		mav = ss.productDetail(PRODUCT_CATEGORY, PRODUCT_NUM, page, page2);
		return mav;
	}

	// 카테고리 검색
	@RequestMapping(value = "/categorySearch", method = RequestMethod.GET)
	public ModelAndView categorySearch(@ModelAttribute ProductVO productVO, @RequestParam("page") int page) {
		mav = new ModelAndView();
		mav = ss.categorySearch(productVO, page);
		return mav;
	}

	// 카테고리 전체보기
	@RequestMapping(value = "/allSearch", method = RequestMethod.GET)
	public ModelAndView allSearch(@RequestParam("page") int page) {
		mav = new ModelAndView();
		mav = ss.productList(page);
		return mav;
	}

	// 검색
	@RequestMapping(value = "/searchText", method = RequestMethod.GET)
	public ModelAndView searchText(@RequestParam("searchText") String PRODUCT_NAME, @RequestParam("page") int page) {
		mav = new ModelAndView();
		mav = ss.searchText(PRODUCT_NAME, page);
		return mav;
	}

	// 구매하기페이지
	@RequestMapping(value = "/purchaseForm", method = RequestMethod.POST)
	public ModelAndView purchase(@ModelAttribute CartVO cartVO) {
		mav = new ModelAndView();
		System.out.println("purchase컨트롤호출");
		mav = ss.purchase(cartVO);
		return mav;
	}

	// 장바구니구매하기페이지
	@RequestMapping(value = "/purchaseForm2", method = RequestMethod.POST)
	public ModelAndView purchase2(@ModelAttribute CartVO cartVO) {
		mav = new ModelAndView();
		System.out.println("purchase컨트롤호출");
		mav = ss.purchase2(cartVO);

		return mav;
	}

	// 장바구니 등록후 페이지 머물기
	@RequestMapping(value = "/cartAction", method = RequestMethod.POST)
	public ModelAndView cart(@ModelAttribute CartVO cartVO, @RequestParam("page") int page, @RequestParam("category") String category) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		System.out.println("cart컨트롤호출");
		System.out.println(category + "카테고리");		
		mav = ss.cartAction(cartVO, page,category);

		return mav;
	}

	// 장바구니 등록후 페이지 불러오기
	@RequestMapping(value = "/cartForm", method = RequestMethod.POST)
	public ModelAndView cartForm(@ModelAttribute CartVO cartVO){
		mav = new ModelAndView();
		System.out.println("cart컨트롤호출");
		mav = ss.cartForm(cartVO);
		return mav;
	}

	// 장바구니 페이지로 가기
	@RequestMapping(value = "/cartForm2", method = RequestMethod.GET)
	public ModelAndView cartForm2(@ModelAttribute CartVO cartVO, @RequestParam("page") int page,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID=(String)session.getAttribute("MEMBER_ID");
		if(MEMBER_ID==null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용 가능합니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		}else {
			mav = ss.cartForm2(cartVO, page);
		}
		
		return mav;
	}

	// 상품삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute CartVO cartVO,@RequestParam("page")int page) {
		mav = new ModelAndView();
		System.out.println(cartVO.getORDER_NUM());
		mav = ss.delete(cartVO,page);
		return mav;
	}

	// 결제완료시
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.GET)
	public ModelAndView kakaoPay(@ModelAttribute CartVO cartVO, @ModelAttribute OrderVO orderVO) {
		mav = new ModelAndView();
		System.out.println("kakaoPay 컨트롤");
		mav = ss.kakaoPay(cartVO, orderVO);
		return mav;
	}

	// 구매내역
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public ModelAndView history(@ModelAttribute CartVO cartVO,@RequestParam("page")int page) {
		mav = new ModelAndView();
		mav = ss.history(cartVO,page);
		return mav;
	}

	// 리뷰페이지요청
	@RequestMapping(value = "/reviewWriteForm", method = RequestMethod.GET)
	public ModelAndView reviewWrite(@ModelAttribute Product_ReviewVO product_ReviewVO, HttpServletResponse response)
			throws IOException {
		mav = new ModelAndView();
		mav = ss.reviewWriteForm(product_ReviewVO, response);
		return mav;
	}

	// 리뷰요청
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public ModelAndView reviewReplyModify(@ModelAttribute Product_ReviewVO product_ReviewVO,
			HttpServletResponse response) throws IOException {
		System.out.println("product_ReviewVO 메소드 호출");
		mav = new ModelAndView();
		mav = ss.reviewReplyModify(product_ReviewVO, response);
		return mav;
	}
	
	//내가 쓴 리뷰 보기
	/*@RequestMapping(value = "/myReview", method = RequestMethod.GET)
	public ModelAndView myReview() {
		mav = new ModelAndView();
		
		return mav;
	}*/
}
