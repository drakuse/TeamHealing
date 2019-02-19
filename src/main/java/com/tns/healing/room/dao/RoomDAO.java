package com.tns.healing.room.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tns.healing.page.vo.PageVO;
import com.tns.healing.room.vo.BookVO;
import com.tns.healing.room.vo.CompanyVO;
import com.tns.healing.room.vo.RoomCountVO;
import com.tns.healing.room.vo.RoomReviewVO;
import com.tns.healing.room.vo.RoomVO;
import com.tns.healing.room.vo.SearchVO;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public void wallpaper(BookVO bookVO) {
		sql.insert("Room.bookInsert", bookVO);
	}

	public void companyJoin(CompanyVO companyVO) {
		sql.insert("Room.companyInsert", companyVO);

	}

	public String getCompanynum() {
		// TODO Auto-generated method stub
		return sql.selectOne("Room.companyNum");
	}

	public List<CompanyVO> companyList(String MEMBER_ID) {
		return sql.selectList("Room.companyList", MEMBER_ID);
	}

	public CompanyVO roomJoinForm(int COMPANY_NUM) {
		return sql.selectOne("Room.roomJoinForm", COMPANY_NUM);
	}

	public String getRoomNum() {
		return sql.selectOne("Room.roomNum");
	}

	public void roomJoin(RoomVO roomVO) {
		sql.insert("Room.roomInsert", roomVO);
	}

	public List<RoomVO> roomList(int COMPANY_NUM) {
		return sql.selectList("Room.roomList", COMPANY_NUM);
	}

	public String getRoomSeq(RoomVO roomVO) {
		return sql.selectOne("Room.roomSeq", roomVO);
	}

	public List<CompanyVO> companySearch(PageVO pageVO) {
		return sql.selectList("Room.companySearch", pageVO);
	}

	public List<RoomVO> roomSearch(SearchVO searchVO) {
		return sql.selectList("Room.roomSearch", searchVO);
	}

	public BookVO bookCheck(SearchVO searchVO) {
		return sql.selectOne("Room.bookCheck", searchVO);
	}

	public String getBookNum() {
		return sql.selectOne("Room.getBookNum");
	}

	public void joinBook(BookVO bookVO) {
		sql.insert("Room.joinBook", bookVO);
	}

	public List<BookVO> bookList(String mEMBER_ID) {
		return sql.selectList("Room.bookList", mEMBER_ID);
	}

	public CompanyVO getCompany(SearchVO searchVO) {
		return sql.selectOne("Room.getCompany", searchVO);
	}

	public RoomVO bookDetailRoom(BookVO bookVO) {
		return sql.selectOne("Room.bookDetailRoom", bookVO);
	}

	public CompanyVO bookDetailCompany(BookVO bookVO) {
		return sql.selectOne("Room.bookDetailCompany", bookVO);
	}

	public BookVO bookDetailBook(BookVO bookVO) {
		return sql.selectOne("Room.bookDetailBook", bookVO);
	}

	public List<BookVO> roomBookList(int ROOM_NUM) {
		return sql.selectList("Room.roomBookList", ROOM_NUM);
	}

	public String getRoomReviewNum() {
		return sql.selectOne("Room.getRoomReviewNum");
	}

	public void joinRoomReview(RoomReviewVO roomReviewVO) {
		sql.insert("Room.joinRoomReview", roomReviewVO);

	}

	public String reviewCheck(int BOOK_NUM) {
		return sql.selectOne("Room.reviewCheck", BOOK_NUM);
	}

	public double companyScore(int COMPANY_NUM) {
		return sql.selectOne("Room.companyScore", COMPANY_NUM);
	}

	public double roomScore(int ROOM_NUM) {
		return sql.selectOne("Room.roomScore", ROOM_NUM);
	}

	public List<RoomReviewVO> roomReview(int ROOM_NUM) {
		return sql.selectList("Room.roomReview", ROOM_NUM);
	}

	public int companyCount() {
		return sql.selectOne("Room.companyCount");
	}

	public String reviewNull(int COMPANY_NUM) {
		return sql.selectOne("Room.reviewNull", COMPANY_NUM);
	}

	public String roomLikeCheck(RoomCountVO roomCount) {
		return sql.selectOne("Room.roomLikeCheck", roomCount);
	}

	public String roomRefuseCheck(RoomCountVO roomCount) {
		return sql.selectOne("Room.roomRefuseCheck", roomCount);
	}

	public void roomLikeUp(RoomCountVO roomCount) {
		sql.insert("Room.roomLikeUp",roomCount);	
	}

	public void roomLikeUpReview(int ROOM_REVIEW_NUM) {
		sql.update("Room.roomLikeUpReview", ROOM_REVIEW_NUM);
	}

	public void roomRefuseUp(RoomCountVO roomCount) {
		sql.insert("Room.roomRefuseUp",roomCount);	
	}

	public void roomRefuseUpReview(int ROOM_REVIEW_NUM) {
		sql.update("Room.roomRefuseUpReview", ROOM_REVIEW_NUM);
	}

	public List<RoomReviewVO> memberMyReviewRoom(String id) {
		return sql.selectList("Room.memberMyReviewRoom",id);
	}

}
