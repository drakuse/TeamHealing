package com.tns.healing.shopping.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tns.healing.member.vo.MemberVO;
import com.tns.healing.shopping.dao.ShoppingDAO;
import com.tns.healing.shopping.vo.CartVO;
import com.tns.healing.shopping.vo.OrderVO;
import com.tns.healing.shopping.vo.PageVO;
import com.tns.healing.shopping.vo.PageVO2;
import com.tns.healing.shopping.vo.ProductVO;
import com.tns.healing.shopping.vo.Product_ReviewVO;

@Service

public class ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 쇼핑몰 상품리스트
	public ModelAndView productList(int page) {
		/* mav = new ModelAndView(); */
		/* List<ProductVO> productList = shoppingDAO.productList(productVO); */
		/*
		 * mav.addObject("productList", productList);
		 * mav.setViewName("shopping/shoppingForm");
		 */
		int limit = 8; // 한페이지에 5개 글 갯수
		PageVO pageVO = new PageVO();
		pageVO.setLimit(limit);
		pageVO.setPage(page);

		int startRow = (page - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page * limit; // 1페이지5, 2페이지 10, 3페이지15

		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);

		mav = new ModelAndView();
		int listCount = shoppingDAO.listCount(); // 전체 글갯수
		pageVO.setListCount(listCount);
		List<ProductVO> productList = shoppingDAO.productList(pageVO); // 페이지 처리한 상품목록

		int maxPage = (int) ((double) listCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);

		mav.addObject("productList", productList);
		mav.addObject("pageVO", pageVO);
		mav.setViewName("shopping/shoppingForm");

		return mav;
	}

	// 상품 상세
	public ModelAndView productDetail(String PRODUCT_CATEGORY, int PRODUCT_NUM, int page, int page2) {
		mav = new ModelAndView();
		ProductVO productDetail = shoppingDAO.productDetail(PRODUCT_NUM);
		/* List<Product_ReviewVO> reviewList = shoppingDAO.reviewList(PRODUCT_NUM); */
		int limit = 5; // 한페이지에 5개 글 갯수
		PageVO2 pageVO = new PageVO2();
		pageVO.setLimit(limit);
		pageVO.setPage(page2);
		pageVO.setPRODUCT_NUM(PRODUCT_NUM);

		int startRow = (page2 - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page2 * limit; // 1페이지5, 2페이지 10, 3페이지15

		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);

		mav = new ModelAndView();
		int reviewCount = shoppingDAO.reviewCount(PRODUCT_NUM); // 전체 글갯수
		pageVO.setListCount(reviewCount);
		List<Product_ReviewVO> reviewList = shoppingDAO.reviewList(pageVO);

		int maxPage = (int) ((double) reviewCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);		
		mav.addObject("category", PRODUCT_CATEGORY);
		mav.addObject("productDetail", productDetail);
		mav.addObject("reviewList", reviewList);
		mav.addObject("page", page);
		mav.addObject("pageVO", pageVO);
		mav.setViewName("shopping/productDetailForm");
		return mav;
	}

	// 카테고리
	public ModelAndView categorySearch(ProductVO productVO, int page) {
		mav = new ModelAndView();

		int limit = 8; // 한페이지에 8개 글 갯수
		PageVO pageVO = new PageVO();
		pageVO.setLimit(limit);

		pageVO.setPage(page);

		String category = productVO.getPRODUCT_CATEGORY();
		int startRow = (page - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page * limit; // 1페이지5, 2페이지 10, 3페이지15
		System.out.println(category + "카테고리");

		pageVO.setPRODUCT_CATEGORY(category);
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);

		mav = new ModelAndView();
		int categoryCount = shoppingDAO.categoryCount(category); // 전체 글갯수
		pageVO.setListCount(categoryCount);

		System.out.println(pageVO.toString());

		List<ProductVO> productList = shoppingDAO.productList2(pageVO);

		int maxPage = (int) ((double) categoryCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);
		mav.addObject("productList", productList);
		mav.addObject("pageVO", pageVO);
		mav.setViewName("shopping/shoppingForm");
		return mav;
	}

	// 검색
	public ModelAndView searchText(String PRODUCT_NAME, int page) {
		mav = new ModelAndView();
		mav.addObject("searchText", PRODUCT_NAME);
		PRODUCT_NAME = "%" + PRODUCT_NAME + "%";

		System.out.println(page);
		PageVO pageVO = new PageVO();
		pageVO.setSearchText(PRODUCT_NAME);
		int limit = 8; // 한페이지에 8개 글 갯수

		int startRow = (page - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page * limit; // 1페이지5, 2페이지 10, 3페이지15

		pageVO.setPage(page);
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		int listCount = shoppingDAO.listSearchCount(PRODUCT_NAME);
		pageVO.setListCount(listCount);

		int maxPage = (int) ((double) listCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		List<ProductVO> productList = shoppingDAO.productSearch2(pageVO);

		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);

		System.out.println(pageVO.toString());
		mav.addObject("pageVO", pageVO);
		mav.addObject("productList", productList);
		mav.setViewName("shopping/shoppingForm");

		/*
		 * List<ProductVO> productList = shoppingDAO.searchText(PRODUCT_NAME);
		 * mav.addObject("productList", productList);
		 * mav.setViewName("shopping/shoppingForm");
		 */

		return mav;
	}

	// 구매하기
	public ModelAndView purchase(CartVO cartVO) {
		mav = new ModelAndView();
		System.out.println(cartVO.getPRODUCT_PRICE() + "상품가격");
		cartVO.setORDER_PRICE(cartVO.getPRODUCT_PRICE() * cartVO.getORDER_AMOUNT());
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		mav.addObject("cartVO", cartVO);
		System.out.println(MEMBER_ID);
		MemberVO member = shoppingDAO.member(MEMBER_ID);
		mav.addObject("member", member);
		System.out.println(cartVO.toString() + "바로구매");
		mav.setViewName("shopping/purchaseForm");

		return mav;
	}

	// 장바구니 구매하기
	public ModelAndView purchase2(CartVO cartVO) {
		mav = new ModelAndView();
		cartVO = shoppingDAO.cartPurchase(cartVO);
		System.out.println(cartVO.toString() + "카카오vo투스트링");
		String MEMBER_ID = cartVO.getMEMBER_ID();
		MemberVO member = shoppingDAO.member(MEMBER_ID);
		mav.addObject("cartVO", cartVO);
		mav.addObject("member", member);
		System.out.println(cartVO.toString() + "장바구니 구매");
		mav.setViewName("shopping/purchaseForm");
		return mav;
	}

	// 장바구니에 등록후 페이지보기
	public ModelAndView cartForm(CartVO cartVO) {
		mav = new ModelAndView();
		cartVO.setORDER_PRICE(cartVO.getPRODUCT_PRICE() * cartVO.getORDER_AMOUNT());
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		System.out.println(cartVO.toString() + "장바구니 등록후 페이지보기");
		shoppingDAO.cart(cartVO);
		mav.setViewName("redirect:/cartForm2?page=1");
		return mav;
	}

	// 장바구니에 등록후 페이지 머물기
	public ModelAndView cartAction(CartVO cartVO, int page, String category) throws UnsupportedEncodingException {
		mav = new ModelAndView();
		cartVO.setORDER_PRICE(cartVO.getPRODUCT_PRICE() * cartVO.getORDER_AMOUNT());
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		System.out.println("맴버아이디" + MEMBER_ID);
		shoppingDAO.cart(cartVO);
		int num = cartVO.getPRODUCT_NUM();
		System.out.println(page + "페이지");
		System.out.println(category);
		category = URLEncoder.encode(category, "UTF-8");

		System.out.println("redirect:/productDetailForm?PRODUCT_NUM=" + num + "&page=" + page + "&page2=1"
				+ "&PRODUCT_CATEGORY=" + category);
		mav.setViewName("redirect:/productDetailForm?PRODUCT_NUM=" + num + "&page=" + page + "&page2=1"
				+ "&PRODUCT_CATEGORY=" + category);
		return mav;
	}

	// 장바구니 페이지 보기
	public ModelAndView cartForm2(CartVO cartVO, int page) {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		/* cartVO.setMEMBER_ID(MEMBER_ID); */
		/* List<CartVO> cartList = shoppingDAO.cartList(cartVO); */
		List<ProductVO> product = new ArrayList<ProductVO>();
		int limit = 5; // 한페이지에 8개 글 갯수
		PageVO pageVO = new PageVO();
		pageVO.setMEMBER_ID(MEMBER_ID);
		pageVO.setLimit(limit);
		pageVO.setPage(page);

		int startRow = (page - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page * limit; // 1페이지5, 2페이지 10, 3페이지15

		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);

		mav = new ModelAndView();
		int basketListCount = shoppingDAO.basketListCount(pageVO); // 전체 글갯수
		pageVO.setListCount(basketListCount);

		System.out.println(pageVO.toString());

		List<CartVO> cartList = shoppingDAO.basketList(pageVO);

		int maxPage = (int) ((double) basketListCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);
		
		for (int i = 0; i < cartList.size(); i++) {
			int pn = cartList.get(i).getPRODUCT_NUM();
			System.out.println(pn);
			ProductVO productVO = shoppingDAO.products(pn);
			product.add(productVO);
		}
		
		mav.addObject("product", product);
		mav.addObject("cartList", cartList);
		mav.addObject("pageVO", pageVO);
		mav.setViewName("shopping/cartForm");
		/*
		 * mav.addObject("cartList", cartList); mav.setViewName("shopping/cartForm");
		 */
		return mav;
	}

	// 장바구니 리스트 삭제
	public ModelAndView delete(CartVO cartVO, int page) {
		mav = new ModelAndView();
		shoppingDAO.delete(cartVO);
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		List<CartVO> cartList = shoppingDAO.cartList(cartVO);
		mav.addObject("cartList", cartList);
		mav.setViewName("redirect:/cartForm2?page=" + page);
		return mav;
	}

	// 카카오결제완료시
	public ModelAndView kakaoPay(CartVO cartVO, OrderVO orderVO) {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		int result = cartVO.getORDER_DIVISION();
		if (result == 1) {
			shoppingDAO.kakaoPay2(cartVO); // 장바구니 상품 구매

		} else {
			shoppingDAO.kakaoPay(cartVO); // 바로결제
		}
		System.out.println(orderVO.toString() + "orderVO투스트링 서비스에서");
		shoppingDAO.OrderInfo(orderVO); // 주문자정보
		ProductVO productVO = shoppingDAO.Best(cartVO.getPRODUCT_NUM());// 상품번호 정보 찾아옴
		int PRODUCT_AMOUNT = productVO.getPRODUCT_AMOUNT() + orderVO.getORDER_AMOUNT();

		productVO.setPRODUCT_AMOUNT(PRODUCT_AMOUNT);
		shoppingDAO.productBestUpdate(productVO);
		mav.setViewName("shopping/purchaseComplete");
		return mav;
	}

	// 구매내역
	public ModelAndView history(CartVO cartVO, int page) {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		cartVO.setMEMBER_ID(MEMBER_ID);
		/* List<CartVO> history = shoppingDAO.historyList(cartVO); */
		List<ProductVO> product = new ArrayList<ProductVO>();

		int limit = 5; // 한페이지에 8개 글 갯수
		PageVO pageVO = new PageVO();
		pageVO.setMEMBER_ID(MEMBER_ID);
		pageVO.setLimit(limit);

		pageVO.setPage(page);

		int startRow = (page - 1) * limit + 1; // 1페이지1, 2페이지6, 3페이지11
		int endRow = page * limit; // 1페이지5, 2페이지 10, 3페이지15

		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);

		mav = new ModelAndView();
		int historyListCount = shoppingDAO.historyListCount(pageVO); // 전체 글갯수
		pageVO.setListCount(historyListCount);

		System.out.println(pageVO.toString());

		List<CartVO> history = shoppingDAO.historyList(pageVO);

		int maxPage = (int) ((double) historyListCount / limit + 1); // 최대로 필요한 페이지 갯수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);
		mav.addObject("history", history);
		mav.addObject("pageVO", pageVO);

		for (int i = 0; i < history.size(); i++) {
			int pn = history.get(i).getPRODUCT_NUM();
			System.out.println(pn);
			ProductVO productVO = shoppingDAO.products(pn);
			product.add(productVO);
		}
		mav.addObject("product", product);
		/*
		 * ProductVO product = shoppingDAO.product(cartVO.getPRODUCT_NUM());
		 * System.out.println("history service 이미지를 가져오는가?  " +
		 * product.getPRODUCT_NAME());
		 */
		/* mav.addObject("product", product); */
		// 구매 정보 추출하기

		mav.setViewName("shopping/purchaseHistoryForm");
		return mav;
	}

	// 리뷰페이지요청
	public ModelAndView reviewWriteForm(Product_ReviewVO product_ReviewVO, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		mav.addObject("PRODUCT_NUM", product_ReviewVO.getPRODUCT_NUM());
		mav.setViewName("shopping/reviewWrite");
		return mav;
	}

	// 리뷰요청
	public ModelAndView reviewReplyModify(Product_ReviewVO product_ReviewVO, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		product_ReviewVO.setMEMBER_ID(MEMBER_ID);
		Product_ReviewVO overlap = shoppingDAO.overlap(product_ReviewVO);
		int PRODUCT_NUM = product_ReviewVO.getPRODUCT_NUM();
		if (overlap != null) {
			out.println("<script>");
			out.println("alert('이미 리뷰를 작성하셨습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			shoppingDAO.reviewWrite(product_ReviewVO);
			shoppingDAO.overlapinsert(product_ReviewVO);
		}
		mav.setViewName("redirect:/productDetailForm?PRODUCT_NUM=" + PRODUCT_NUM + "&page=1&page2=1&PRODUCT_CATEGORY=");

		/* int review = shoppingDAO.productReview(product_ReviewVO); */

		return mav;
	}
	
	//내가쓴 리뷰보기
	public ModelAndView myReview() {
		mav = new ModelAndView();
		String MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
		List<Product_ReviewVO> productReview = shoppingDAO.myReview(MEMBER_ID);
		mav.addObject("productReview", productReview);
		mav.setViewName("member/memberMyReviewForm");
		return mav;
	}

}
