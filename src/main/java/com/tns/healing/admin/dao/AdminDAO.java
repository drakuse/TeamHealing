package com.tns.healing.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tns.healing.member.vo.MemberVO;
import com.tns.healing.room.vo.CompanyVO;
import com.tns.healing.shopping.vo.ProductVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 회원관리 페이지 요청 메소드
	public List<MemberVO> memberManagementForm() {
		return sql.selectList("Member.memberList");
	}

	// 회원 삭제 메소드
	public void memberDelete(String mEMBER_ID) {
		sql.delete("Member.memberDelete", mEMBER_ID);
	}

	// 상품 등록 메소드
	public int productUpdate(ProductVO productVO) {
		return sql.insert("Shopping.productUpdate", productVO);
	}

	// 업자 회원 승인 메소드
	public int memberApprove(MemberVO memberVO) {
		return sql.update("Member.memberApporve", memberVO);
	}

	public List<CompanyVO> companyApproveList() {
		return sql.selectList("Room.companyApproveList");
	}

	public void companyApprove(String company_num) {
		sql.update("Room.companyApprove", company_num);
	}

}
