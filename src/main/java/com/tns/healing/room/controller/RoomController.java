package com.tns.healing.room.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tns.healing.room.service.RoomService;
import com.tns.healing.room.vo.BookVO;
import com.tns.healing.room.vo.CompanyVO;
import com.tns.healing.room.vo.RoomReviewVO;
import com.tns.healing.room.vo.RoomVO;
import com.tns.healing.room.vo.SearchVO;

@Controller
public class RoomController {

	private ModelAndView mav;

	@Autowired
	private RoomService rs;

	@RequestMapping(value = "/companyJoinForm", method = RequestMethod.GET)
	public String companyJoinForm() {
		System.out.println("companyJoinForm 메소드 호출");
		return "room/companyJoin";
	}

	@RequestMapping(value = "/companyJoin", method = RequestMethod.POST)
	public ModelAndView companyJoin(@ModelAttribute CompanyVO companyVO) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		System.out.println("companyJoin 메소드 호출");
		System.out.println(companyVO.toString());
		MultipartFile bFile = companyVO.getCOMPANY_IMAGE();
		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\companyImage\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}
		companyVO.setCOMPANY_IMAGENAME(bFile.getOriginalFilename());
		mav = rs.companyJoin(companyVO);
		return mav;
	}

	@RequestMapping(value = "/companyList", method = RequestMethod.GET)
	public ModelAndView companyList() {
		mav = new ModelAndView();
		System.out.println("companyList 메소드 호출");
		mav = rs.companyList();
		return mav;
	}

	@RequestMapping(value = "/roomJoinForm", method = RequestMethod.GET)
	public ModelAndView roomJoinForm(@RequestParam("COMPANY_NUM") int COMPANY_NUM) {
		mav = new ModelAndView();
		System.out.println("roomJoinForm 메소드 호출");
		mav = rs.roomJoinForm(COMPANY_NUM);
		return mav;
	}

	@RequestMapping(value = "/roomJoin", method = RequestMethod.POST)
	public ModelAndView roomJoin(@ModelAttribute RoomVO roomVO) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		System.out.println("roomJoin 메소드 호출");
		System.out.println(roomVO.toString());
		MultipartFile bFile = roomVO.getROOM_IMAGE();
		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\roomImage\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}
		roomVO.setROOM_IMAGENAME(bFile.getOriginalFilename());
		mav = rs.roomJoin(roomVO);
		return mav;
	}

	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public ModelAndView roomList(@RequestParam("COMPANY_NUM") int COMPANY_NUM) {
		mav = new ModelAndView();
		System.out.println("roomList 메소드 호출");
		mav = rs.roomList(COMPANY_NUM);
		return mav;
	}

	@RequestMapping(value = "/searchCompany", method = RequestMethod.POST)
	public ModelAndView searchCompany(@ModelAttribute SearchVO searchVO) {
		mav = new ModelAndView();
		System.out.println("searchCompany 메소드 호출");
		System.out.println(searchVO.toString());
		mav = rs.searchCompany(searchVO);
		return mav;
	}

	@RequestMapping(value = "/searchRoom", method = RequestMethod.POST)
	public ModelAndView searchRoom(@ModelAttribute SearchVO searchVO) {
		mav = new ModelAndView();
		System.out.println("searchRoom 메소드 호출");
		System.out.println(searchVO.toString());
		mav = rs.searchRoom(searchVO);
		return mav;
	}

	@RequestMapping(value = "/joinBook", method = RequestMethod.POST)
	public ModelAndView joinBook(@ModelAttribute SearchVO searchVO) {
		mav = new ModelAndView();
		System.out.println("joinBook 메소드 호출");
		System.out.println(searchVO.toString());
		mav = rs.joinBook(searchVO);
		return mav;
	}

	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public ModelAndView bookList() {
		mav = new ModelAndView();
		System.out.println("bookList 메소드 호출");
		mav = rs.bookList();
		return mav;
	}

	@RequestMapping(value = "/roomBookList", method = RequestMethod.GET)
	public ModelAndView roomBookList(@RequestParam("ROOM_NUM") int ROOM_NUM) {
		mav = new ModelAndView();
		System.out.println("roomBookList 메소드 호출");
		System.out.println(ROOM_NUM);
		mav = rs.roomBookList(ROOM_NUM);
		return mav;
	}

	@RequestMapping(value = "/bookDetail", method = RequestMethod.GET)
	public ModelAndView bookDetail(@ModelAttribute BookVO bookVO) {
		mav = new ModelAndView();
		System.out.println("bookDetail 메소드 호출");
		mav = rs.bookDetail(bookVO);
		return mav;
	}

	@RequestMapping(value = "/roomReviewForm", method = RequestMethod.GET)
	public ModelAndView roomReviewForm(@RequestParam("BOOK_NUM") int BOOK_NUM) {
		mav = new ModelAndView();
		System.out.println("bookDetail 메소드 호출");
		mav = rs.roomReviewForm(BOOK_NUM);
		return mav;
	}

	@RequestMapping(value = "/roomReview", method = RequestMethod.POST)
	public ModelAndView roomReview(@ModelAttribute RoomReviewVO roomReviewVO)
			throws IllegalStateException, IOException {
		mav = new ModelAndView();
		System.out.println("roomReview 메소드 호출");
		MultipartFile bFile = roomReviewVO.getROOM_REVIEW_IMAGE();
		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\reviewImage\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}
		roomReviewVO.setROOM_REVIEW_IMAGENAME(bFile.getOriginalFilename());
		mav = rs.roomReview(roomReviewVO);
		return mav;
	}

	@RequestMapping(value = "/roomReviewLike", method = RequestMethod.POST)
	public void roomReviewLike(HttpServletResponse response, @RequestParam("ROOM_REVIEW_NUM") int ROOM_REVIEW_NUM)
			throws IOException {
		System.out.println("roomReviewLike 메소드 호출");
		rs.roomReviewLike(ROOM_REVIEW_NUM, response);
	}

	@RequestMapping(value = "/roomReviewRefuse", method = RequestMethod.POST)
	public void roomReviewRefuse(HttpServletResponse response, @RequestParam("ROOM_REVIEW_NUM") int ROOM_REVIEW_NUM)
			throws IOException {
		System.out.println("roomReviewRefuse 메소드 호출");
		rs.roomReviewRefuse(ROOM_REVIEW_NUM, response);
	}

	@RequestMapping(value = "/memberMyReviewRoom", method = RequestMethod.GET)
	public ModelAndView memberMyReviewRoom() {
		mav = new ModelAndView();
		System.out.println("memberMyReviewRoom 메소드 호출");
		mav = rs.memberMyReviewRoom();
		return mav;
	}
}
