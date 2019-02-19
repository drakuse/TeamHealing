package com.tns.healing.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tns.healing.board.vo.BoardCountVO;
import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.board.vo.BoardVO;
import com.tns.healing.page.vo.PageVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 글 등록 요청 메소드
	public int boardWrite(BoardVO boardVO) {
		return sql.insert("Board.boardWrite", boardVO);
	}

	// 게시판 목록 요청 메소드
	public List<BoardVO> boardForm(PageVO pageVO) {
		return sql.selectList("Board.boardForm", pageVO);
	}

	// 조회수 카운트
	public int boardCountUpdate(int iNFO_NUM) {
		return sql.update("Board.boardUpdate", iNFO_NUM);
	}

	// 상세보기
	public BoardVO boardDetail(int iNFO_NUM) {
		return sql.selectOne("Board.boardDetail", iNFO_NUM);
	}

	// 게시판 글 수정
	public int boardModify(BoardVO boardVO) {
		return sql.update("Board.boardModify", boardVO);
	}

	// 게시글 삭제
	public int boardDelete(int iNFO_NUM) {
		return sql.delete("Board.boardDelete", iNFO_NUM);
	}

	// 게시글 추천 확인 메소드
	public BoardCountVO boardLikeCheck(BoardCountVO boardCountVO) {
		return sql.selectOne("Board.boardLikeCheck", boardCountVO);
	}

	// 게시글 추천 DB 메소드(INFO_COUNT)
	public void boardLikeCountInsert(BoardCountVO boardCountVO) {
		sql.insert("Board.boardLikeCountInsert", boardCountVO);
	}

	// 게시글 추천 메소드(INFO)
	public void boardLikeInsert(BoardCountVO boardCountVO) {
		sql.update("Board.boardLikeInsert", boardCountVO);
	}

	// 게시글 신고 확인 메소드
	public BoardCountVO boardReportCheck(BoardCountVO boardCountVO) {
		return sql.selectOne("Board.boardReportCheck", boardCountVO);
	}

	// 게시글 신고 DB 메소드(INFO_COUNT)
	public void boardReportCountInsert(BoardCountVO boardCountVO) {
		sql.insert("Board.boardReportCountInsert", boardCountVO);
	}

	// 게시글 신고 메소드(INFO)
	public void boardReportInsert(BoardCountVO boardCountVO) {
		sql.update("Board.boardReportInsert", boardCountVO);
	}

	// 스크랩 확인 여부
	public BoardScrapVO searchScrap(BoardScrapVO boardScrapVO) {
		return sql.selectOne("Board.searchScrap", boardScrapVO);
	}

	// 게시글 스크랩 처리
	public int boardScrap(BoardScrapVO boardScrapVO) {
		return sql.insert("Board.boardScrap", boardScrapVO);
	}

	// 상세 게시판 댓글 조회 기능
	public BoardReviewVO searchReview(BoardReviewVO boardReviewVO) {
		return sql.selectOne("Board.searchReview", boardReviewVO);
	}

	// 상세 게시판 댓글 달기
	public int reviewInsert(BoardReviewVO boardReviewVO) {
		return sql.insert("Board.reviewInsert", boardReviewVO);
	}

	// 댓글 전체 목록 조회
	public List<BoardReviewVO> reviewRead(int iNFO_NUM) {
		return sql.selectList("Board.reviewRead", iNFO_NUM);
	}

	// 부모 댓글 정보 가져오기
	public BoardReviewVO reviewReplySearch(int iNFO_REVIEW_NUM) {
		return sql.selectOne("Board.reviewReplySearch", iNFO_REVIEW_NUM);
	}

	// 댓글 답변 요청
	public int reviewReplyInsert(BoardReviewVO searchReview) {
		return sql.insert("Board.reviewReplyInsert", searchReview);
	}

	// 원본 댓글과 답글까지 전부 삭제요청
	public void reviewReplyDelete(int iNFO_REVIEW_LEV) {
		sql.delete("Board.reviewReplyDelete", iNFO_REVIEW_LEV);
	}

	// 답글 삭제 요청
	public void reviewDelete(int iNFO_REVIEW_NUM) {
		sql.delete("Board.reviewDelete", iNFO_REVIEW_NUM);
	}

	// 댓글 수정 요청
	public void reviewReplyModify(BoardReviewVO searchReview) {
		sql.update("Board.reviewModify", searchReview);
	}

	// 게시글 댓글 추천 확인
	public BoardCountVO boardLikeReviewCheck(BoardCountVO boardCountVO) {
		return sql.selectOne("Board.boardLikeReviewCheck", boardCountVO);
	}

	// 게시글 댓글 추천 메소드(INFO_REVIEW)
	public void boardLikeReviewInsert(BoardCountVO boardCountVO) {
		sql.update("Board.boardLikeReviewInsert", boardCountVO);
	}

	// 게시글 댓글 신고 확인
	public BoardCountVO boardReportReviewCheck(BoardCountVO boardCountVO) {
		return sql.selectOne("Board.boardReportReviewCheck", boardCountVO);
	}

	// 게시글 댓글 신고 메소드(INFO_REVIEW)
	public void boardReportReviewInsert(BoardCountVO boardCountVO) {
		sql.update("Board.boardReportReviewInsert", boardCountVO);
	}

	// 게시판 삭제 시 게시판에 있는 댓글 전부 삭제
	public void boardReviewDelete(int iNFO_NUM) {
		sql.delete("Board.boardReviewDelete", iNFO_NUM);
	}

	// 댓글 추천,신고 삭제(게시판 삭제 시)
	public void boardReviewCountDelete(int iNFO_NUM) {
		sql.delete("Board.boardReviewCountDelete", iNFO_NUM);
	}

	// 스크랩 삭제
	public int scrapDelete(int iNFO_NUM) {
		return sql.delete("Board.scrapDelete", iNFO_NUM);
	}

	// 글 갯수 카운트
	public int listCount() {
		return sql.selectOne("Board.listCount");
	}

	// 게시판 검색
	public List<BoardVO> boardSearch(PageVO pageVO) {
		return sql.selectList("Board.boardSearch", pageVO);
	}

	// 검색한 글 갯수 카운트
	public int listSearchCount(String search) {
		return sql.selectOne("Board.listSearchCount", search);
	}

	// 베스트 정보 글
	public List<BoardVO> boardBest() {
		return sql.selectList("Board.boardBest");
	}

}
