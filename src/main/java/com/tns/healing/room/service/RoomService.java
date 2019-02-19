package com.tns.healing.room.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tns.healing.page.vo.PageVO;
import com.tns.healing.room.dao.RoomDAO;
import com.tns.healing.room.vo.BookVO;
import com.tns.healing.room.vo.CompanyVO;
import com.tns.healing.room.vo.RoomCountVO;
import com.tns.healing.room.vo.RoomReviewVO;
import com.tns.healing.room.vo.RoomVO;
import com.tns.healing.room.vo.SearchVO;

@Service
public class RoomService {

	private ModelAndView mav;

	@Autowired
	private RoomDAO rd;

	@Autowired
	private HttpSession session;

	public ModelAndView companyJoin(CompanyVO companyVO) {
		mav = new ModelAndView();
		companyVO.setMEMBER_ID((String) session.getAttribute("MEMBER_ID"));
		String cnum = rd.getCompanynum();
		System.out.println(cnum);
		if (cnum == null) {
			companyVO.setCOMPANY_NUM(1);
		} else {
			int num = Integer.parseInt(cnum);
			companyVO.setCOMPANY_NUM(num + 1);
		}
		System.out.println(companyVO.toString());
		rd.companyJoin(companyVO);
		mav.setViewName(".//room/lodgmentForm");

		return mav;
	}

	public ModelAndView companyList() {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		List<CompanyVO> companyList = rd.companyList(MEMBER_ID);
		mav.addObject("companyList", companyList);
		mav.setViewName("room/companyList");
		return mav;
	}

	public ModelAndView roomJoinForm(int COMPANY_NUM) {
		mav = new ModelAndView();
		CompanyVO company = rd.roomJoinForm(COMPANY_NUM);
		mav.addObject("company", company);
		mav.setViewName("room/roomJoin");
		return mav;
	}

	public ModelAndView roomJoin(RoomVO roomVO) {
		mav = new ModelAndView();
		String rnum = rd.getRoomNum();
		System.out.println(rnum);
		if (rnum == null) {
			roomVO.setROOM_NUM(1);
		} else {
			int num = Integer.parseInt(rnum);
			roomVO.setROOM_NUM(num + 1);
		}
		String seq = rd.getRoomSeq(roomVO);
		System.out.println(seq);
		if (seq == null) {
			roomVO.setROOM_SEQ(1);
		} else {
			int num = Integer.parseInt(seq);
			roomVO.setROOM_SEQ(num + 1);
		}
		System.out.println(roomVO.toString());
		rd.roomJoin(roomVO);
		mav.setViewName("redirect:/roomList?COMPANY_NUM=" + roomVO.getCOMPANY_NUM());

		return mav;
	}

	public ModelAndView roomList(int COMPANY_NUM) {
		mav = new ModelAndView();
		List<RoomVO> roomList = rd.roomList(COMPANY_NUM);
		mav.addObject("roomList", roomList);
		mav.addObject("COMPANY_NUM", COMPANY_NUM);
		mav.setViewName("room/roomList");
		return mav;
	}

	public ModelAndView searchCompany(SearchVO searchVO) {
		mav = new ModelAndView();
		System.out.println(searchVO.toString());
		String region = searchVO.getRegion();

		mav.addObject("region", region);

		int limit = 4;
		PageVO pageVO = new PageVO();
		pageVO.setRegion("%" + region + "%");
		int startRow = (searchVO.getPage() - 1) * limit + 1;
		int endRow = searchVO.getPage() * limit;

		pageVO.setPage(searchVO.getPage());
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		int listCount = rd.companyCount();
		pageVO.setListCount(listCount);

		// 페이지 계산
		int maxPage = (int) ((double) listCount / limit + 1); // 최대 페이지 수
		int startPage = (((int) ((double) searchVO.getPage() / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);

		List<CompanyVO> searchCompany = rd.companySearch(pageVO);

		mav.addObject("pageVO", pageVO);
		if (searchCompany.isEmpty()) {
			mav.addObject("none", "검색된 결과가 없습니다.");
			mav.setViewName("room/lodgmentForm");
		} else {
			List<Double> scores = new ArrayList<Double>();
			for (int i = 0; i < searchCompany.size(); i++) {
				System.out.println(searchCompany.get(i).getCOMPANY_NUM());
				String reviewNull = rd.reviewNull(searchCompany.get(i).getCOMPANY_NUM());
				if (reviewNull != null) {
					double score = rd.companyScore(searchCompany.get(i).getCOMPANY_NUM());
					score = Math.round(score * 100) / 100.0;
					scores.add(score);
				} else {
					scores.add((double) 0);
				}
			}
			mav.addObject("none", null);
			mav.addObject("score", scores);
			mav.addObject("companyList", searchCompany);
			mav.setViewName("room/lodgmentForm");
		}
		return mav;
	}

	public ModelAndView searchRoom(SearchVO searchVO) {
		mav = new ModelAndView();
		System.out.println(searchVO.toString());
		Date ci = Date.valueOf(searchVO.getCheckin());
		Date co = Date.valueOf(searchVO.getCheckout());
		searchVO.setCheckIn(ci);
		searchVO.setCheckOut(co);
		System.out.println(searchVO.toString());

		List<RoomVO> searchRoom = rd.roomSearch(searchVO);
		List<String> isBook = new ArrayList<String>();
		for (int i = 0; i < searchRoom.size(); i++) {
			int room_num = searchRoom.get(i).getROOM_NUM();
			searchVO.setRoom_num(String.valueOf(room_num));
			System.out.println(room_num + "/" + searchVO.getCheckin() + "/" + searchVO.getCheckout());
			BookVO bookCheck = rd.bookCheck(searchVO);
			System.out.println(bookCheck);
			if (bookCheck == null) {
				isBook.add("예약하기");
			} else {
				isBook.add("예약완료");
			}
		}
		if (searchRoom.size() == 0) {
			mav.addObject("emptyRoom", "y");
		} else {
			mav.addObject("emptyRoom", "n");
		}
		List<Double> scores = new ArrayList<Double>();
		List<List<RoomReviewVO>> reviews = new ArrayList<List<RoomReviewVO>>();
		boolean companyS = false;
		for (int i = 0; i < searchRoom.size(); i++) {
			int ROOM_NUM = searchRoom.get(i).getROOM_NUM();
			List<RoomReviewVO> review = rd.roomReview(ROOM_NUM);
			if (review.size() != 0) {
				reviews.add(review);
				double score = rd.roomScore(ROOM_NUM);
				score = Math.round(score * 100) / 100.0;
				scores.add(score);
				companyS = true;
			} else {
				reviews.add(null);
				scores.add(0.0);
			}
		}
		CompanyVO companyVO = new CompanyVO();
		System.out.println(companyVO.getCOMPANY_NUM());
		companyVO.setCOMPANY_NUM(Integer.parseInt(searchVO.getCompany_num()));
		companyVO = rd.getCompany(searchVO);
		System.out.println(companyVO.getCOMPANY_NUM());
		if (companyS) {			
			double companyScore = rd.companyScore(Integer.parseInt(searchVO.getCompany_num()));
			companyScore = Math.round(companyScore * 100) / 100.0;			
			searchVO.setCompanyScore(String.valueOf(companyScore));
		}
		mav.addObject("review", reviews);
		mav.addObject("score", scores);
		mav.addObject("company", companyVO);
		mav.addObject("search", searchVO);
		mav.addObject("isBook", isBook);
		mav.addObject("roomList", searchRoom);
		mav.setViewName("room/searchCompany");
		return mav;
	}

	public ModelAndView joinBook(SearchVO searchVO) {
		mav = new ModelAndView();
		BookVO bookVO = new BookVO();
		String id = (String) session.getAttribute("MEMBER_ID");
		Date ci = Date.valueOf(searchVO.getCheckin());
		Date co = Date.valueOf(searchVO.getCheckout());
		searchVO.setCheckIn(ci);
		searchVO.setCheckOut(co);
		bookVO.setMEMBER_ID(id);
		bookVO.setBOOK_CHECKIN(searchVO.getCheckIn());
		bookVO.setBOOK_CHECKOUT(searchVO.getCheckOut());
		bookVO.setROOM_NUM(Integer.parseInt((searchVO.getRoom_num())));
		bookVO.setBOOK_PRICE(Integer.parseInt(searchVO.getPrice()));
		bookVO.setCOMPANY_NUM(searchVO.getCompany_num());
		String cnum = rd.getBookNum();
		System.out.println(cnum);
		if (cnum == null) {
			bookVO.setBOOK_NUM(1);
		} else {
			int num = Integer.parseInt(cnum);
			bookVO.setBOOK_NUM(num + 1);
		}
		System.out.println(bookVO.toString());
		rd.joinBook(bookVO);
		mav.setViewName("redirect:/bookList?MEMBER_ID=" + id);
		return mav;
	}

	public ModelAndView bookList() {
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		List<BookVO> bookList = rd.bookList(MEMBER_ID);
		List<String> review = new ArrayList<String>();
		for (int i = 0; i < bookList.size(); i++) {
			String ROOM_REVIEW_CONTENT = rd.reviewCheck(bookList.get(i).getBOOK_NUM());
			if (ROOM_REVIEW_CONTENT != null) {
				review.add("y");
			} else {
				review.add("n");
			}
		}
		mav.addObject("review", review);
		mav.addObject("bookList", bookList);
		mav.setViewName("room/bookList");
		return mav;
	}

	public ModelAndView bookDetail(BookVO bookVO) {
		mav = new ModelAndView();
		System.out.println(bookVO.toString());
		BookVO book = rd.bookDetailBook(bookVO);
		RoomVO room = rd.bookDetailRoom(bookVO);
		CompanyVO company = rd.bookDetailCompany(bookVO);
		mav.addObject("book", book);
		mav.addObject("room", room);
		mav.addObject("company", company);
		mav.setViewName("room/bookDetail");
		return mav;
	}

	public ModelAndView roomBookList(int ROOM_NUM) {
		mav = new ModelAndView();
		List<BookVO> bookList = rd.roomBookList(ROOM_NUM);
		mav.addObject("bookList", bookList);
		mav.setViewName("room/bookList");
		return mav;
	}

	public ModelAndView roomReviewForm(int bOOK_NUM) {
		mav = new ModelAndView();
		BookVO bookVO = new BookVO();
		bookVO.setBOOK_NUM(bOOK_NUM);
		BookVO book = rd.bookDetailBook(bookVO);
		mav.addObject("book", book);
		mav.setViewName("room/roomReviewForm");
		return mav;
	}

	public ModelAndView roomReview(RoomReviewVO roomReviewVO) {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("MEMBER_ID");
		roomReviewVO.setMEMBER_ID(id);
		System.out.println(roomReviewVO.toString());
		String rrn = rd.getRoomReviewNum();
		System.out.println(rrn);
		if (rrn == null) {
			roomReviewVO.setROOM_REVIEW_NUM(1);
		} else {
			int num = Integer.parseInt(rrn);
			roomReviewVO.setROOM_REVIEW_NUM(num + 1);
		}
		System.out.println(roomReviewVO.toString());
		rd.joinRoomReview(roomReviewVO);
		mav.setViewName("redirect:/bookList?MEMBER_ID=" + id);
		return mav;
	}

	public void roomReviewLike(int rOOM_REVIEW_NUM, HttpServletResponse response) throws IOException {
		String id = (String) session.getAttribute("MEMBER_ID");
		RoomCountVO roomCount = new RoomCountVO();
		roomCount.setMEMBER_ID(id);
		roomCount.setROOM_REVIEW_NUM(rOOM_REVIEW_NUM);
		String text = rd.roomLikeCheck(roomCount);
		if (text != null) {
			response.getWriter().print("1");
		} else {
			rd.roomLikeUp(roomCount);
			rd.roomLikeUpReview(rOOM_REVIEW_NUM);
			response.getWriter().print("2");
		}
	}

	public void roomReviewRefuse(int rOOM_REVIEW_NUM, HttpServletResponse response) throws IOException {
		String id = (String) session.getAttribute("MEMBER_ID");
		RoomCountVO roomCount = new RoomCountVO();
		roomCount.setMEMBER_ID(id);
		roomCount.setROOM_REVIEW_NUM(rOOM_REVIEW_NUM);
		String text = rd.roomRefuseCheck(roomCount);
		if (text != null) {
			response.getWriter().print("1");
		} else {
			rd.roomRefuseUp(roomCount);
			rd.roomRefuseUpReview(rOOM_REVIEW_NUM);
			response.getWriter().print("2");
		}

	}

	public ModelAndView memberMyReviewRoom() {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("MEMBER_ID");
		List<RoomReviewVO> review = rd.memberMyReviewRoom(id);
		mav.addObject("review", review);
		mav.setViewName("room/memberMyReviewRoom");
		return mav;
	}
}
