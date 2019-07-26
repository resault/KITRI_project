package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.kitri.godinator.mentor.dao.ResumeDao;
import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private SqlSession sqlSession;
	
	// #### 학교 검색 ####
	@Override
	public String srchSchool(Map<String, String> srcCnd) {
		List<BoardDto> list = sqlSession.getMapper(ResumeDao.class).selSchool(srcCnd);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}

	// #### 자소서 저장 ####
	@Override
	public int saveResume(EditDto editDto) {
		return sqlSession.getMapper(ResumeDao.class).insertResume(editDto);
	}
	
	// #### 자소서 목록 ####
	@Override
	public List<EditDto> getResumeList(Map<String, String> parameter) {
		int pg = MentorPageNavi.NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
//		System.out.println(parameter.get("userId") + "  " + parameter.get("schoolCate1") + "  " + parameter.get("end") + "  " + parameter.get("start") + "  " + parameter.get("state"));
		
		List<EditDto> list = sqlSession.getMapper(ResumeDao.class).selResumeList(parameter);
		
		return list;
	}
	
	// #### 첨삭 목록 ####
	@Override
	public List<EditDto> getEditList(Map<String, String> parameter) {
		int pg = MentorPageNavi.NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
//		System.out.println(parameter.get("userId") + "  " + parameter.get("schoolCate1") + "  " + parameter.get("end") + "  " + parameter.get("start") + "  " + parameter.get("state"));
		
		List<EditDto> list = sqlSession.getMapper(ResumeDao.class).selEditList(parameter);
		
		return list;
	}
	
	
	// #### 첨삭 저장 ####
	@Override
	@Transactional
	public int saveEdit(EditDto editDto) {
		int result = sqlSession.getMapper(ResumeDao.class).insertEdit(editDto);
		sqlSession.getMapper(ResumeDao.class).updateState(editDto.getPseq());
		return result;
	}
	
	// #### 첨삭한 글 갯수 ####
	@Override
	public int getEditCnt(Map<String, String> parameter) {
		return sqlSession.getMapper(ResumeDao.class).selEditCnt(parameter);
	}
	
	// #### 첨삭대기중인 글 갯수 ####
	@Override
	public int getStayCnt(Map<String, String> parameter) {
		return sqlSession.getMapper(ResumeDao.class).selStayCnt(parameter);
	}
	
	// #### 페이징 처리 ####
	@Override
	public MentorPageNaviDto getPageNavi(Map<String, String> parameter) {
		int totalArticleCount = sqlSession.getMapper(ResumeDao.class).getTotalCount(parameter);
		MentorPageNaviDto navigation = MentorPageNavi.getPageNavi(parameter, totalArticleCount);
		return navigation;
	}

	// #### 글 가져오기 ####
	@Override
	public EditDto getResume(int seq) {
		EditDto editDto = sqlSession.getMapper(ResumeDao.class).selResume(seq);
		editDto.setBoardContent(editDto.getBoardContent().replace("\n", "<br>"));
		return editDto;
	}
	// #### 첨삭글 가져오기 ####
	@Override
	public EditDto getEdit(int pseq) {
		EditDto editDto = sqlSession.getMapper(ResumeDao.class).selEdit(pseq);
		editDto.setBoardContent(editDto.getBoardContent().replace("\n", "<br>"));
		return editDto;
	}

	

}
