package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.MemberDao;
import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDto> viewAll(String keyword) {
		System.out.println("   > MemberServiceImpl 입성 > viewAll");
		return sqlSession.getMapper(MemberDao.class).viewAll(keyword);
	}

	@Override
	public List<HSchoolDto> getHSchoolName(String hSchoolCode) {
		System.out.println("   > MemberServiceImpl 입성 > 고등학교 이름 get하기");
		return sqlSession.getMapper(MemberDao.class).getHSchoolName(hSchoolCode);
	}

	@Override
	public List<MentorDto> setMentor(String id) {
		System.out.println("   > MemberServiceImpl 입성 > 멘토로 승격");
		return sqlSession.getMapper(MemberDao.class).setMentor(id);
	}

	@Override
	public int countAllMembers(String keyword) {
		System.out.println("   > (MemberServiceImpl) 회원 총 몇명?");
		return sqlSession.getMapper(MemberDao.class).countAllMembers(keyword);
	}

	@Override
	public int countAllMentors() {
		System.out.println("   > (MemberServiceImpl) 멘토 총 몇명?");
		return sqlSession.getMapper(MemberDao.class).countAllMentors();
	}

	@Override
	public List<MemberDto> viewMoreInfo(String memberid) {
		System.out.println("   > (MemberServiceImpl) 멤버별 상세정보 찾는 DB");
		return sqlSession.getMapper(MemberDao.class).viewMoreInfo(memberid);
	}

	@Override
	public String deleteInfo_child(String userid) {
		System.out.println("   > (MemberServiceImpl) 멤버 탈퇴 DB(멘토o) > " + userid);
		return sqlSession.getMapper(MemberDao.class).deleteInfo_child(userid);
	}
	
	@Override
	public String deleteInfo(String userid) {
		System.out.println("   > (MemberServiceImpl) 멤버 탈퇴 DB(멘토x) >" + userid);
		return sqlSession.getMapper(MemberDao.class).deleteInfo(userid);
	}

	@Override
	public List<BoardDto> viewBoard(String userid) {
		System.out.println("   > (MemberServiceImpl) 등록한 게시판 내역 가져오기 >" + userid);
		return sqlSession.getMapper(MemberDao.class).viewBoard(userid);
	}

	@Override
	public int countBoard(String userid) {
		System.out.println("   > (MemberServiceImpl) " + userid + "의 작성글수 가져오기 >");
		return sqlSession.getMapper(MemberDao.class).countBoard(userid);
	}

}
