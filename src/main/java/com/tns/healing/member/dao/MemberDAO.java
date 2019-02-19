package com.tns.healing.member.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tns.healing.board.vo.BoardReviewVO;
import com.tns.healing.board.vo.BoardScrapVO;
import com.tns.healing.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 회원가입 처리 메소드(일반 회원)
	public int memberJoin(MemberVO memberVO) {
		return sql.insert("Member.memberJoin", memberVO);
	}

	// 로그인 처리 메소드
	public MemberVO memberLogin(MemberVO memberVO) {
		return sql.selectOne("Member.memberLogin", memberVO);
	}

	// 회원가입 처리 메소드(업자 회원)
	public int memberJoin2(MemberVO memberVO) {
		return sql.insert("Member.memberJoin2", memberVO);
	}

	// 정보 변경 전 비밀번호 확인 메소드
	public MemberVO memberModifyCheck(MemberVO memberVO) {
		return sql.selectOne("Member.memberModifyCheck", memberVO);
	}

	// 정보 변경 처리 메소드(일반 회원)
	public int memberModify(MemberVO memberVO) {
		return sql.update("Member.memberModify", memberVO);
	}

	// 아이디 중복확인
	public MemberVO idOverlap(String mEMBER_ID) {
		return sql.selectOne("Member.idOverlap", mEMBER_ID);
	}

	// 이메일 인증키 저장
	public int overKey(String key) {
		return sql.insert("Member.overKey", key);
	}

	// 이메일 인증 키 확인
	public String checkKey(String key) {
		return sql.selectOne("Member.checkKey", key);
	}

	// 게시글 스크랩 목록
	public List<BoardScrapVO> myScrap(String mEMBER_ID) {
		return sql.selectList("Member.myScrap", mEMBER_ID);
	}

	// 내가쓴리뷰 리스트
	public List<BoardReviewVO> myReview(String mEMBER_ID) {
		return sql.selectList("Member.myReview", mEMBER_ID);
	}

	// 스크랩 삭제
	public int scrapDelete(BoardScrapVO boardScrapVO) {
		return sql.delete("Member.scrapDelete", boardScrapVO);
	}

}
