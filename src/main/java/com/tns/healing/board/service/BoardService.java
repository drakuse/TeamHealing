package com.tns.healing.board.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.tns.healing.board.dao.BoardDAO;
import com.tns.healing.board.vo.BoardCountVO;
import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.board.vo.BoardVO;
import com.tns.healing.page.vo.PageVO;

@Service
public class BoardService {

	private ModelAndView mav;

	@Autowired
	private HttpSession session;

	@Autowired
	private BoardDAO boardDAO;

	// 정보공유게시판 글 등록 요청
	public ModelAndView boardWrite(BoardVO boardVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		int result = boardDAO.boardWrite(boardVO);
		PrintWriter out = response.getWriter();
		if (result == 0) {
			out.println("<script>");
			out.println("alert('글 등록 실패.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			mav.setViewName("redirect:/boardForm?page=1");
		}
		return mav;
	}

	// 게시판 목록 요청
	public ModelAndView boardForm(int page) {
		mav = new ModelAndView();

		int limit = 5; // 페이지에 보여줄 글 갯수
		PageVO pageVO = new PageVO();

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		pageVO.setPage(page);
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		int listCount = boardDAO.listCount();
		pageVO.setListCount(listCount);

		// 페이지 계산
		int maxPage = (int) ((double) listCount / limit + 1); // 최대 페이지 수
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		List<BoardVO> boardBest = boardDAO.boardBest(); // 베스트 글 목록
		List<BoardVO> boardForm = boardDAO.boardForm(pageVO); // 게시판 글 목록 (페이징)

		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);

		mav.addObject("boardBest", boardBest); // 베스트 글 목록
		mav.addObject("pageVO", pageVO); // 페이지 값 정보
		mav.addObject("boardList", boardForm);
		mav.setViewName("board/boardForm");
		return mav;
	}

	// 게시판 글 상세보기 요청
	public ModelAndView boardDetail(int iNFO_NUM, int page) {
		mav = new ModelAndView();
		boardDAO.boardCountUpdate(iNFO_NUM); // 조회수 카운트

		BoardVO boardDetail = boardDAO.boardDetail(iNFO_NUM);// 상세보기 정보 조회
		List<BoardReviewVO> reviewList = boardDAO.reviewRead(iNFO_NUM);
		// 댓글 목록 조회

		mav.addObject("page", page); // 페이지 번호 저장
		mav.addObject("boardDetail", boardDetail); // 게시판 글 상세정보
		mav.addObject("reviewList", reviewList); // 게시판 글 댓글 상세정보
		mav.setViewName("/board/boardDetail");
		return mav;
	}

	// 게시판 글 수정페이지 요청
	public ModelAndView boardModifyForm(int iNFO_NUM, int page) {
		mav = new ModelAndView();
		BoardVO boardModify = boardDAO.boardDetail(iNFO_NUM);

		mav.addObject("page", page);
		mav.addObject("boardModify", boardModify);
		mav.setViewName("/board/boardModifyForm");
		return mav;
	}

	// 게시판 글 수정 요청
	public ModelAndView boardModify(BoardVO boardVO, HttpServletResponse response, int page) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		int boardModify = boardDAO.boardModify(boardVO);
		PrintWriter out = response.getWriter();
		if (boardModify > 0) {
			mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardVO.getINFO_NUM() + "&page=" + page);
		} else {
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.go(-1);</script>");
			out.close();
		}
		return mav;
	}

	// 게시글 삭제 요청
	public ModelAndView boardDelete(int iNFO_NUM, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		System.out.println(iNFO_NUM);
		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {

			int boardDelete = boardDAO.boardDelete(iNFO_NUM);

			boardDAO.boardReviewDelete(iNFO_NUM); // 게시판 댓글 삭제
			boardDAO.boardReviewCountDelete(iNFO_NUM); // 댓글 확인 여부 DB 데이터 삭제
			boardDAO.scrapDelete(iNFO_NUM); // 스크랩 삭제

			if (boardDelete > 0) {
				out.println("<script>");
				out.println("alert('삭제성공');");
				out.println("location.href='boardForm?page=1';</script>");
				out.close();

			} else {
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시글 추천
	public ModelAndView boardLike(BoardCountVO boardCountVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인
			boardCountVO.setMEMBER_ID(MEMBER_ID);
			BoardCountVO boardLikeCheck = boardDAO.boardLikeCheck(boardCountVO);
			// 게시글 추천 확인

			if (boardLikeCheck == null) {
				System.out.println("추천이 없습니다.");
				boardDAO.boardLikeCountInsert(boardCountVO); // 추천 DB Insert
				boardDAO.boardLikeInsert(boardCountVO); // 게시글의 추천 Insert
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardCountVO.getINFO_NUM() + "&page=" + page);
			} else {
				System.out.println("게시글에 추천이 있습니다.");
				out.println("<script>");
				out.println("alert('이미 추천 하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시글 신고
	public ModelAndView boardReport(BoardCountVO boardCountVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			boardCountVO.setMEMBER_ID(MEMBER_ID);
			BoardCountVO boardReportCheck = boardDAO.boardReportCheck(boardCountVO);
			// 게시글 신고 확인

			if (boardReportCheck == null) {
				System.out.println("신고가 없습니다.");
				boardDAO.boardReportCountInsert(boardCountVO);
				boardDAO.boardReportInsert(boardCountVO);
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardCountVO.getINFO_NUM() + "&page=" + page);
			} else {
				System.out.println("게시글에 신고가 있습니다.");
				out.println("<script>");
				out.println("alert('이미 신고 하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시판 댓글 등록 요청
	public ModelAndView reviewWrite(BoardReviewVO boardReviewVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 비로그인 상태
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인 상태
			boardReviewVO.setMEMBER_ID(MEMBER_ID); // 세션에 있는 아이디 저장

			BoardReviewVO searchReview = boardDAO.searchReview(boardReviewVO); // 댓글 확인 여부

			if (searchReview == null) { // 댓글이 없는 경우
				boardReviewVO.setINFO_REVIEW_LEV(1);
				boardReviewVO.setINFO_REVIEW_SEQ(1);
				int reviewInsert = boardDAO.reviewInsert(boardReviewVO); // 댓글 등록

				if (reviewInsert == 0) { // 댓글 등록 실패
					out.println("<script>");
					out.println("alert('댓글등록 실패');");
					out.println("history.go(-1);</script>");
					out.close();
				} else { // 댓글 등록 성공
					mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardReviewVO.getINFO_NUM() + "&page=" + page);
				}
			} else { // 댓글이 있는 경우
				int review_lev = searchReview.getINFO_REVIEW_LEV(); // 댓글 레벨 저장
				boardReviewVO.setINFO_REVIEW_LEV(review_lev + 1); // 댓글 레벨 증가
				boardReviewVO.setINFO_REVIEW_SEQ(1);

				int reviewInsert = boardDAO.reviewInsert(boardReviewVO); // 댓글 등록

				if (reviewInsert == 0) { // 댓글 등록 실패
					out.println("<script>");
					out.println("alert('댓글등록 실패');");
					out.println("history.go(-1);</script>");
					out.close();
				} else { // 댓글 등록 성공
					mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardReviewVO.getINFO_NUM() + "&page=" + page);
				}
			}
		}
		return mav;
	}

	// 게시판 스크랩 처리 후 페이지 이동 O
	public ModelAndView boardScrap(BoardScrapVO boardScrapVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		if (MEMBER_ID == null) {
			// 비로그인 상태
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인 상태
			boardScrapVO.setMEMBER_ID(MEMBER_ID);
			BoardScrapVO boardScrap = boardDAO.searchScrap(boardScrapVO); // 스크랩 확인 검색
			if (boardScrap == null) {
				// 스크랩 가능
				boardDAO.boardScrap(boardScrapVO);
				mav.setViewName("redirect:/myScrapForm");
			} else {
				// 스크랩 불가능
				out.println("<script>");
				out.println("alert('이 게시물은 이미 스크랩하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시판 스크랩 처리 페이지 이동 X
	public ModelAndView boardScrapAction(BoardScrapVO boardScrapVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");

		if (MEMBER_ID == null) {
			// 비로그인 상태
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인 상태
			boardScrapVO.setMEMBER_ID(MEMBER_ID); // 회원 아이디 저장
			BoardScrapVO boardScrap = boardDAO.searchScrap(boardScrapVO); // 스크랩 확인 검색
			if (boardScrap == null) {
				// 스크랩 가능
				boardDAO.boardScrap(boardScrapVO);
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardScrapVO.getINFO_NUM() + "&page=" + page);
			} else {
				// 스크랩 불가능
				out.println("<script>");
				out.println("alert('이 게시물은 이미 스크랩하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 댓글 답변 페이지 요청
	public ModelAndView reviewReplyForm(int iNFO_REVIEW_NUM, int page) {
		mav = new ModelAndView();

		mav.addObject("page", page);
		mav.addObject("INFO_REVIEW_NUM", iNFO_REVIEW_NUM);
		mav.setViewName("board/reviewReplyForm");
		return mav;
	}

	// 댓글 답변 요청
	public ModelAndView reviewReplywWrite(BoardReviewVO boardReviewVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID"); // 세션 아이디 저장
		BoardReviewVO searchReview = boardDAO.reviewReplySearch(boardReviewVO.getINFO_REVIEW_NUM());

		if (searchReview == null) {
			out.println("<script>");
			out.println("alert('등록 실패.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			int INFO_REVIEW_SEQ = searchReview.getINFO_REVIEW_SEQ(); // 댓글 시퀀스 값 저장
			searchReview.setINFO_REVIEW_SEQ(INFO_REVIEW_SEQ + 1); // 시퀀스 값 증가
			searchReview.setINFO_REVIEW_CONTENT(boardReviewVO.getINFO_REVIEW_CONTENT()); // 답글 내용 저장
			searchReview.setMEMBER_ID(MEMBER_ID); // 세션 아이디 저장

			int reviewInsert = boardDAO.reviewReplyInsert(searchReview); // 댓글 등록

			if (reviewInsert == 0) { // 댓글 등록 실패
				out.println("<script>");
				out.println("alert('댓글등록 실패');");
				out.println("history.go(-1);</script>");
				out.close();
			} else { // 댓글 등록 성공
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + searchReview.getINFO_NUM() + "&page=" + page);
			}
		}
		return mav;
	}

	// 댓글 삭제
	public ModelAndView reviewReplyDelete(BoardReviewVO boardReviewVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		int INFO_REVIEW_NUM = boardReviewVO.getINFO_REVIEW_NUM();
		BoardReviewVO searchReview = boardDAO.reviewReplySearch(INFO_REVIEW_NUM); // 댓글 번호를 이용하여 댓글 정보를 가져옴

		if (searchReview == null) {
			out.println("<script>");
			out.println("alert('삭제 검색 실패.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			int INFO_REVIEW_SEQ = searchReview.getINFO_REVIEW_SEQ();
			// 가져온 정보에서 시퀀스 값을 저장
			if (INFO_REVIEW_SEQ == 1) {
				// 시퀀스 값이 1이면 원본 글 이므로 답글 까지 전체 삭제
				int INFO_REVIEW_LEV = searchReview.getINFO_REVIEW_LEV();
				boardDAO.reviewReplyDelete(INFO_REVIEW_LEV);
				// 댓글 레벨은 원본댓글과 답글이 같으므로 레벨로 삭제조건을 넣어준다.
			} else {
				// 시퀀스 값이 1이 아니면 답글이므로 답글정보만 삭제
				boardDAO.reviewDelete(INFO_REVIEW_NUM);
				// 답글일 경우 답글 1개만 삭제하면 되므로 댓글 번호를 삭제조건으로 넣어준다.
			}
			mav.setViewName("redirect:/boardDetail?INFO_NUM=" + searchReview.getINFO_NUM() + "&page=" + page);
		}
		return mav;
	}

	// 댓글 수정 페이지 요청
	public ModelAndView reviewModifyForm(int iNFO_REVIEW_NUM, int page) {
		mav = new ModelAndView();
		BoardReviewVO reviewModify = boardDAO.reviewReplySearch(iNFO_REVIEW_NUM);

		mav.addObject("page", page);
		mav.addObject("reviewModify", reviewModify);
		mav.setViewName("board/reviewModifyForm");
		return mav;
	}

	// 댓글 수정 요청
	public ModelAndView reviewReplyModify(BoardReviewVO boardReviewVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID"); // 세션 아이디 저장
		BoardReviewVO searchReview = boardDAO.reviewReplySearch(boardReviewVO.getINFO_REVIEW_NUM());

		if (MEMBER_ID == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용가능합니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			if (searchReview == null) {
				out.println("<script>");
				out.println("alert('수정 실패.');");
				out.println("history.go(-1);</script>");
				out.close();
			} else {
				searchReview.setINFO_REVIEW_CONTENT(boardReviewVO.getINFO_REVIEW_CONTENT());
				boardDAO.reviewReplyModify(searchReview);
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + searchReview.getINFO_NUM() + "&page=" + page);
			}
		}
		return mav;
	}

	// 게시판 댓글 추천
	public ModelAndView boardReviewLike(BoardCountVO boardCountVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인
			boardCountVO.setMEMBER_ID(MEMBER_ID);
			BoardCountVO boardLikeReviewCheck = boardDAO.boardLikeReviewCheck(boardCountVO);
			// 게시글 추천 확인

			if (boardLikeReviewCheck == null) {
				System.out.println("댓글 추천이 없습니다.");
				boardDAO.boardLikeCountInsert(boardCountVO); // 추천 DB Insert
				boardDAO.boardLikeReviewInsert(boardCountVO); // 게시글의 댓글 추천 Insert
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardCountVO.getINFO_NUM() + "&page=" + page);
			} else {
				System.out.println("게시글 댓글에 추천이 있습니다.");
				out.println("<script>");
				out.println("alert('이미 추천 하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시판 댓글 신고
	public ModelAndView boardReviewReport(BoardCountVO boardCountVO, HttpServletResponse response, int page)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		if (MEMBER_ID == null) {
			// 비로그인
			out.println("<script>");
			out.println("alert('로그인 후 이용하실 수 있습니다.');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			// 로그인
			boardCountVO.setMEMBER_ID(MEMBER_ID);
			BoardCountVO boardReportReviewCheck = boardDAO.boardReportReviewCheck(boardCountVO);
			// 게시글 신고 확인

			if (boardReportReviewCheck == null) {
				System.out.println("댓글 신고가 없습니다.");
				boardDAO.boardReportCountInsert(boardCountVO); // 신고 DB Insert
				boardDAO.boardReportReviewInsert(boardCountVO); // 게시글의 댓글 신고 Insert
				mav.setViewName("redirect:/boardDetail?INFO_NUM=" + boardCountVO.getINFO_NUM() + "&page=" + page);
			} else {
				System.out.println("게시글 댓글 신고가 있습니다.");
				out.println("<script>");
				out.println("alert('이미 신고 하셨습니다.');");
				out.println("history.go(-1);</script>");
				out.close();
			}
		}
		return mav;
	}

	// 게시판 검색
	public ModelAndView searchInfo(PageVO pageVO) {
		mav = new ModelAndView();
		mav.addObject("search", pageVO.getSearch());
		String search = "%" + pageVO.getSearch() + "%";
		pageVO.setSearch(search);
		System.out.println(pageVO.toString());
		int limit = 5; // 페이지에 보여줄 글 갯수

		int startRow = (pageVO.getPage() - 1) * limit + 1;
		int endRow = pageVO.getPage() * limit;

		pageVO.setPage(pageVO.getPage());
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		int listCount = boardDAO.listSearchCount(search);
		pageVO.setListCount(listCount);

		// 페이지 계산
		int maxPage = (int) ((double) listCount / limit + 1); // 최대 페이지 수
		int startPage = (((int) ((double) pageVO.getPage() / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		List<BoardVO> boardBest = boardDAO.boardBest(); // 베스트 글 목록
		List<BoardVO> boardForm = boardDAO.boardSearch(pageVO); // 게시판 글 목록

		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);
		System.out.println(pageVO.toString());

		mav.addObject("boardBest", boardBest); // 베스트 글 목록
		mav.addObject("pageVO", pageVO); // 페이지 값 정보
		mav.addObject("boardList", boardForm);
		mav.setViewName("board/boardForm");
		return mav;
	}

}
