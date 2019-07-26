package com.kitri.godinator.schoolinfo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;
import com.kitri.godinator.schoolinfo.dao.SearchSchoolDao;
import com.kitri.godinator.schoolinfo.model.PageBean;
import com.kitri.godinator.schoolinfo.util.SchoolInfoUtil;

@Service
public class SearchSchoolServiceImpl implements SearchSchoolService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	// 학교 검색
	public String getSchoolsGroupByType(Map<String, Object> parameter) {
//		학교이름, 학교코드, 지역, [남녀공학], [교육청], 홈페이지
		JsonObject jsonObject = new JsonObject();
		JsonArray jsonArray = new JsonArray();
		//학교 구분
		String schoolCate = (String) parameter.get("schoolCate");
		//페이징 처리
		PageBean pageBean = getPageBean(parameter);
		
		if("h".equals(schoolCate)) {
			List<HSchoolDto> list = sqlSession.getMapper(SearchSchoolDao.class).getHSchoolsGroupByType(parameter);
			for(HSchoolDto h : list) {
				JsonObject hJson = new JsonObject();
				hJson.addProperty("schoolName", h.getSchoolName());
				hJson.addProperty("schoolCode", h.getSchoolCode());
				hJson.addProperty("schoolType", h.getSchoolCate1());
				hJson.addProperty("estType", h.getEstType());
				hJson.addProperty("region", h.getAddress());
				hJson.addProperty("mwCate", h.getMwCate());
				hJson.addProperty("eduOffice", h.getEduOffice());
				StringBuffer homePage = new StringBuffer(h.getHomePage()); 
				checkImgUrl(hJson, homePage);
				jsonArray.add(hJson);
			}
			jsonObject.addProperty("schoolCate", "h");
			jsonObject.add("schoolInfo", jsonArray);
		} else if("u".equals(schoolCate)) {
			List<USchoolDto> list = sqlSession.getMapper(SearchSchoolDao.class).getUSchoolsGroupByType(parameter);
			for(USchoolDto u : list) {
				JsonObject uJson = new JsonObject();
				uJson.addProperty("schoolName", u.getName());
				uJson.addProperty("schoolCode", u.getCode());
				uJson.addProperty("schoolType", u.getType());
				uJson.addProperty("estType", u.getEstType());
				uJson.addProperty("region", u.getRegion());
				StringBuffer link = new StringBuffer(u.getLink()); 
				checkImgUrl(uJson, link);
				jsonArray.add(uJson);
			}
			jsonObject.addProperty("schoolCate", "u");
			jsonObject.add("schoolInfo", jsonArray);
		}
		//페이징 json 에 추가
		Gson gson = new Gson();
		jsonObject.add("pageBean", gson.toJsonTree(pageBean));
		
		System.out.println("getSchoolsGroupByType : "+jsonObject.toString());
		return jsonObject.toString();
	}

	@Override
	//고등학교 리스트 얻어오기 evalCnt 상위 5개
	public List<HSchoolDto> getHSchoolList() {
		return sqlSession.getMapper(SearchSchoolDao.class).getHSchoolList();
	}

	@Override
	//대학교 리스트 얻어오기 evalCnt 상위 5개
	public List<USchoolDto> getUSchoolList() {
		return sqlSession.getMapper(SearchSchoolDao.class).getUSchoolList();
	}
	
	//페이징
	private PageBean getPageBean(Map<String, Object> parameter) {
		int totalSchools = 0;
		String schoolCate = (String) parameter.get("schoolCate");
		if("h".equals(schoolCate))
			totalSchools = sqlSession.getMapper(SearchSchoolDao.class).getCountHSchoolsByCondition(parameter);
		else if("u".equals(schoolCate))
			totalSchools = sqlSession.getMapper(SearchSchoolDao.class).getCountUSchoolsByCondition(parameter);
		int currpg = SchoolInfoUtil.getIntDefaultOne((String)parameter.get("pg"));
		System.out.println("currpg : " + currpg + " totalSchools : " + totalSchools);
		PageBean pageBean = new PageBean(currpg, totalSchools);
		parameter.put("startRow", pageBean.getStartRow());
		parameter.put("endRow", pageBean.getEndRow());
		return pageBean;
	}

	@Override
	//유저 선호도 입력 체크 고등학교 h 대학교 u 둘다 hu
	public Map<String, String> getUserPrefer(String userId) {
		return sqlSession.getMapper(SearchSchoolDao.class).getUserPrefer(userId);
	}

	@Override
	public List<HSchoolDto> getHRecomSchool(String userId) {
		return sqlSession.getMapper(SearchSchoolDao.class).getHRecomSchool(userId);
	}
	@Override
	public List<USchoolDto> getURecomSchool(String userId) {
		return sqlSession.getMapper(SearchSchoolDao.class).getURecomSchool(userId);
	}
	
	//이미지 체크
	private void checkImgUrl(JsonObject json, StringBuffer url) {
		if(!url.toString().contains("http")) {
			url.insert(0, "http://");
		}
		json.addProperty("homePage", url.toString());
	}
}