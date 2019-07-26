package com.kitri.godinator.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.admin.dao.StatisticsDao;
import com.kitri.godinator.model.VisitDto;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addCnt(String user) {
		System.out.println("> (StatisticsServiceImpl) > cnt 올리기");
		sqlSession.getMapper(StatisticsDao.class).addCnt(user);
	}

	@Override
	public void enrollVisit(String id) {
		System.out.println("	> (StatisticsServiceImpl) > 신규 ID 생성시 cnt 올리기");
		sqlSession.getMapper(StatisticsDao.class).enrollVisit(id);
	}

	@Override
	public void addUserCnt(String StaticId) {
		System.out.println("	> (StatisticsServiceImpl) > 로그인한 ID cnt 올리기 : " + StaticId);
		sqlSession.getMapper(StatisticsDao.class).addUserCnt(StaticId);
	}

	@Override
	public List<VisitDto> upperMemberList() {
		System.out.println("	> (StatisticsServiceImpl) > 상위 5위 멤버 찾기");
		return sqlSession.getMapper(StatisticsDao.class).upperMemberList();
	}

}
