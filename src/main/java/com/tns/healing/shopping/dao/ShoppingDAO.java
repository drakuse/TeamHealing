package com.tns.healing.shopping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tns.healing.member.vo.MemberVO;
import com.tns.healing.shopping.vo.CartVO;
import com.tns.healing.shopping.vo.OrderVO;
import com.tns.healing.shopping.vo.PageVO;
import com.tns.healing.shopping.vo.PageVO2;
import com.tns.healing.shopping.vo.ProductVO;
import com.tns.healing.shopping.vo.Product_ReviewVO;

@Repository
public class ShoppingDAO {

	@Autowired
	private SqlSessionTemplate sql;

	/*
	 * public List<ProductVO> productList(ProductVO productVO) {
	 * 
	 * return sql.selectList("Shopping.productList", productVO); }
	 */

	public List<ProductVO> categorySearch(ProductVO productVO) {

		return sql.selectList("Shopping.categorySearch", productVO);
	}

	public List<ProductVO> searchText(String PRODUCT_NAME) {

		return sql.selectList("Shopping.searchText", PRODUCT_NAME);
	}

	public ProductVO productDetail(int PRODUCT_NUM) {

		return sql.selectOne("Shopping.productDetail", PRODUCT_NUM);
	}

	public int cart(CartVO cartVO) {

		return sql.insert("Shopping.cart", cartVO);
	}

	public CartVO purchaseView(CartVO cartVO) {
		return sql.selectOne("Shopping.purchaseView", cartVO);
	}

	public List<CartVO> cartList(CartVO cartVO) {

		return sql.selectList("Shopping.cartList", cartVO);
	}

	public int delete(CartVO cartVO) {

		return sql.delete("Shopping.delete", cartVO);

	}

	public MemberVO member(String MEMBER_ID) {
		return sql.selectOne("Shopping.member", MEMBER_ID);
	}

	public int kakaoPay(CartVO cartVO) {
		return sql.insert("Shopping.kakaoPay", cartVO);
	}

	public int kakaoPay2(CartVO cartVO) {

		return sql.update("Shopping.kakaoPay2", cartVO);

	}

	public CartVO cartPurchase(CartVO cartVO) {
		return sql.selectOne("Shopping.cartPurchase", cartVO);
	}

	public int OrderInfo(OrderVO orderVO) {
		return sql.insert("Shopping.orderInfo", orderVO);
	}

	public ProductVO Best(int PRODUCT_NUM) {
		return sql.selectOne("Shopping.best", PRODUCT_NUM);
	}

	// 상품판매량 업데이트 부분
	public void productBestUpdate(ProductVO productVO) {
		sql.update("Shopping.productBestUpdate", productVO);
	}

	/*
	 * public List<CartVO> historyList(CartVO cartVO) { return
	 * sql.selectList("Shopping.history", cartVO); }
	 */

	// purchaseHistory에서 이미지 가져오기위해서 사용했음
	public ProductVO productSearch(int product_NUM) {
		return sql.selectOne("Shopping.productSearch", product_NUM);
	}

	public ProductVO products(int product_num) {
		return sql.selectOne("Shopping.products", product_num);
	}

	public Product_ReviewVO reviewSearch(Product_ReviewVO product_ReviewVO) {
		return sql.selectOne("Shopping.reviewSearch", product_ReviewVO);
	}

	// 중복확인체크용
	public Product_ReviewVO overlap(Product_ReviewVO product_ReviewVO) {
		return sql.selectOne("Shopping.overlap", product_ReviewVO);
	}

	public int reviewWrite(Product_ReviewVO product_ReviewVO) {
		return sql.insert("Shopping.reviewWrite", product_ReviewVO);
	}

	public Product_ReviewVO overlapinsert(Product_ReviewVO product_ReviewVO) {
		return sql.selectOne("Shopping.overlapinsert", product_ReviewVO);
	}

	// 상품상세페이지에 리뷰리스트 불러오기
	/*
	 * public List<Product_ReviewVO> reviewList(int PRODUCT_NUM) { return
	 * sql.selectList("Shopping.reviewList", PRODUCT_NUM); }
	 */

	public int listCount() {
		return sql.selectOne("Shopping.listCount");
	}

	public List<ProductVO> productList(PageVO pageVO) {
		return sql.selectList("Shopping.shoppingFormPaging", pageVO);
	}

	public List<Product_ReviewVO> reviewList(PageVO2 pageVO) {
		return sql.selectList("Shopping.reviewPaging", pageVO);
	}

	// 구매내역 리스트카운트
	public int listCount2() {
		return sql.selectOne("Shopping.listCount2");
	}

	public List<CartVO> history(PageVO pageVO) {
		return sql.selectList("Shopping.history", pageVO);
	}

	// 카테고리 카운트
	public int categoryCount(String category) {
		return sql.selectOne("Shopping.categoryCount", category);
	}

	public List<ProductVO> productList2(PageVO pageVO) {
		return sql.selectList("Shopping.categoryPaging", pageVO);
	}

	// 검색 카운트
	public int listSearchCount(String PRODUCT_NAME) {
		return sql.selectOne("Shopping.listSearchCount", PRODUCT_NAME);
	}

	// 검색
	public List<ProductVO> productSearch2(PageVO pageVO) {
		return sql.selectList("Shopping.productSearch2", pageVO);
	}

	// 장바구니 카운트
	public int basketListCount(PageVO pageVO) {
		return sql.selectOne("Shopping.basketListCount", pageVO);
	}

	// 장바구니 페이징
	public List<CartVO> basketList(PageVO pageVO) {
		return sql.selectList("Shopping.basketListPaging", pageVO);
	}

	// 리뷰 카운트
	public int reviewCount(int PRODUCT_NUM) {
		return sql.selectOne("Shopping.reviewCount", PRODUCT_NUM);
	}

	// 구매내역 카운트
	public int historyListCount(PageVO pageVO) {
		return sql.selectOne("Shopping.historyListCount", pageVO);
	}

	public List<CartVO> historyList(PageVO pageVO) {
		return sql.selectList("Shopping.historyList", pageVO);
	}
	
	//내가 쓴 리뷰보기
	public List<Product_ReviewVO> myReview(String mEMBER_ID) {
		return sql.selectList("Shopping.myReview", mEMBER_ID);
	}


}
