package com.tns.healing.board.controller;

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
import com.tns.healing.board.service.BoardService;
import com.tns.healing.board.vo.BoardCountVO;
import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.board.vo.BoardVO;
import com.tns.healing.page.vo.PageVO;

@Controller
public class BoardController {

	private ModelAndView mav;

	@Autowired
	private BoardService bs;

	// 정보 공유 게시판 목록 페이지 요청
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public ModelAndView boardForm(@RequestParam("page") int page) {
		System.out.println("boardForm 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardForm(page);
		return mav;
	}

	// 게시판 글쓰기 페이지 요청
	@RequestMapping(value = "/boardWriteForm", method = RequestMethod.GET)
	public String boardW1riteForm() {
		System.out.println("boardWriteForm 메소드 호출");
		return "board/boardWriteForm";
	}

	// 게시판 글쓰기 처리
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite(@ModelAttribute BoardVO boardVO, HttpServletResponse response)
			throws IllegalStateException, IOException {
		System.out.println("boardWrite 메소드 호출");
		mav = new ModelAndView();
		MultipartFile bFile = boardVO.getINFO_IMAGE();

		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\uploadFile\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}

		boardVO.setINFO_IMAGE_NAME(bFile.getOriginalFilename());
		mav = bs.boardWrite(boardVO, response);
		return mav;
	}

	// 게시판 글 상세보기(조회수 증가)
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("INFO_NUM") int INFO_NUM, @RequestParam("page") int page) {
		System.out.println("boardDetail 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardDetail(INFO_NUM, page);
		return mav;
	}

	// 게시판 글 수정 페이지보기
	@RequestMapping(value = "/boardModifyForm", method = RequestMethod.GET)
	public ModelAndView boardModifyForm(@RequestParam("INFO_NUM") int INFO_NUM, @RequestParam("page") int page) {
		System.out.println("boardModifyForm 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardModifyForm(INFO_NUM, page);
		return mav;
	}

	// 게시판 글 수정 요청
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public ModelAndView boardModify(@ModelAttribute BoardVO boardVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardModify 메소드 호출");
		mav = new ModelAndView();
		MultipartFile bFile = boardVO.getINFO_IMAGE();
		if (!bFile.isEmpty()) {
			String fileName = bFile.getOriginalFilename();
			String fileLocation = "C:\\Users\\zerock\\Documents\\workspace-sts-3.9.6.RELEASE\\Healing(0.8.5)\\src\\main\\webapp\\resources\\uploadFile\\";
			bFile.transferTo(new File(fileLocation + fileName));
		}
		boardVO.setINFO_IMAGE_NAME(bFile.getOriginalFilename());
		mav = bs.boardModify(boardVO, response, page);
		return mav;
	}

	// 게시판 글 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam("INFO_NUM") int INFO_NUM, HttpServletResponse response)
			throws IOException {
		System.out.println("boardDelete 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardDelete(INFO_NUM, response);
		return mav;
	}

	// 게시판 글 추천
	@RequestMapping(value = "/boardLike", method = RequestMethod.GET)
	public ModelAndView boardLike(@ModelAttribute BoardCountVO boardCountVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardLike 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardLike(boardCountVO, response, page);
		return mav;
	}

	// 게시판 글 신고
	@RequestMapping(value = "/boardReport", method = RequestMethod.GET)
	public ModelAndView boardReport(@ModelAttribute BoardCountVO boardCountVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardReport 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardReport(boardCountVO, response, page);
		return mav;
	}

	// 게시판 댓글 등록 요청
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewWrite(@ModelAttribute BoardReviewVO boardReviewVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("reviewWrite 메소드 호출");
		System.out.println("num : " + boardReviewVO.getINFO_NUM() + "lev : " + boardReviewVO.getINFO_REVIEW_LEV()
				+ "댓글번호 : " + boardReviewVO.getINFO_REVIEW_NUM());
		mav = new ModelAndView();
		mav = bs.reviewWrite(boardReviewVO, response, page);
		return mav;
	}

	// 게시판 스크랩 처리 후 스크랩 페이지로 이동
	@RequestMapping(value = "/boardScrap", method = RequestMethod.POST)
	public ModelAndView boardScrap(@ModelAttribute BoardScrapVO boardScrapVO, HttpServletResponse response)
			throws IOException {
		System.out.println("boardScrap 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardScrap(boardScrapVO, response);
		return mav;
	}

	// 게시판 스크랩 처리만
	@RequestMapping(value = "/boardScrapAction", method = RequestMethod.POST)
	public ModelAndView boardScrapAction(@ModelAttribute BoardScrapVO boardScrapVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardScrapAction 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardScrapAction(boardScrapVO, response, page);
		return mav;
	}

	// 댓글 답변 페이지
	@RequestMapping(value = "/reviewReplyForm", method = RequestMethod.GET)
	public ModelAndView reviewReplyForm(@RequestParam("INFO_REVIEW_NUM") int INFO_REVIEW_NUM,
			@RequestParam("page") int page) {
		System.out.println("reviewReplyForm 메소드 호출");
		mav = new ModelAndView();
		mav = bs.reviewReplyForm(INFO_REVIEW_NUM, page);
		return mav;
	}

	// 댓글 답변 등록
	@RequestMapping(value = "/reviewReplywWrite", method = RequestMethod.GET)
	public ModelAndView reviewReplywWrite(@ModelAttribute BoardReviewVO boardReviewVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("reviewReplywWrite 메소드 호출");
		mav = new ModelAndView();
		mav = bs.reviewReplywWrite(boardReviewVO, response, page);
		return mav;
	}

	// 댓글 삭제
	@RequestMapping(value = "/reviewReplyDelete", method = RequestMethod.GET)
	public ModelAndView reviewReplyDelete(@ModelAttribute BoardReviewVO boardReviewVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("reviewReplyDelete 메소드 호출");
		mav = new ModelAndView();
		mav = bs.reviewReplyDelete(boardReviewVO, response, page);
		return mav;
	}

	// 댓글 수정 페이지 요청
	@RequestMapping(value = "/reviewModifyForm", method = RequestMethod.GET)
	public ModelAndView reviewModifyForm(@RequestParam("INFO_REVIEW_NUM") int INFO_REVIEW_NUM,
			@RequestParam("page") int page) {
		System.out.println("reviewModifyForm 메소드 호출");
		mav = new ModelAndView();
		mav = bs.reviewModifyForm(INFO_REVIEW_NUM, page);
		return mav;
	}

	// 댓글 수정 요청
	@RequestMapping(value = "/reviewReplyModify", method = RequestMethod.GET)
	public ModelAndView reviewReplyModify(@ModelAttribute BoardReviewVO boardReviewVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("reviewReplyModify 메소드 호출");
		mav = new ModelAndView();
		mav = bs.reviewReplyModify(boardReviewVO, response, page);
		return mav;
	}

	// 게시판 글 댓글 추천
	@RequestMapping(value = "/boardReviewLike", method = RequestMethod.GET)
	public ModelAndView boardReviewLike(@ModelAttribute BoardCountVO boardCountVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardReviewLike 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardReviewLike(boardCountVO, response, page);
		return mav;
	}

	// 게시판 글 댓글 신고
	@RequestMapping(value = "/boardReviewReport", method = RequestMethod.GET)
	public ModelAndView boardReviewReport(@ModelAttribute BoardCountVO boardCountVO, HttpServletResponse response,
			@RequestParam("page") int page) throws IOException {
		System.out.println("boardReviewReport 메소드 호출");
		mav = new ModelAndView();
		mav = bs.boardReviewReport(boardCountVO, response, page);
		return mav;
	}

	// 게시판 검색
	@RequestMapping(value = "/searchInfo", method = RequestMethod.POST)
	public ModelAndView searchInfo(@ModelAttribute PageVO pageVO) {
		mav = new ModelAndView();
		mav = bs.searchInfo(pageVO);
		return mav;
	}
}
