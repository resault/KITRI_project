package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kitri.godinator.mentor.dao.MentorDao;
import com.kitri.godinator.model.MentorInfoDto;

@Service
public class MentorServiceImpl implements MentorService{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public int checkAuth(String id) {
		return sqlsession.getMapper(MentorDao.class).checkAuth(id);
	}

	@Override
	public List<MentorInfoDto> getMentor(Map<String, String> parameter) {
		int pg = MentorPageNavi.NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
		return sqlsession.getMapper(MentorDao.class).selMentor(parameter);
	}
	
	// #### 페이징 처리 ####
	@Override
	public MentorPageNaviDto getPageNavi(Map<String, String> parameter) {
		int totalArticleCount = sqlsession.getMapper(MentorDao.class).getTotalCount(parameter);
		MentorPageNaviDto navigation = MentorPageNavi.getPageNavi(parameter, totalArticleCount);
		return navigation;
	}
	
}
