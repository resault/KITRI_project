package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.admin.dao.SchoolDao;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

@Service//이거 꼭!!
public class SchoolServiceImpl implements SchoolService{

   @Autowired
   private SqlSession sqlSession;
   

   @Override
   public List<HSchoolDto> searchSchool(Map<String, String> parameter) {
      System.out.println("   > SchoolServiceImpl 입성 > searchSchool");
	   return sqlSession.getMapper(SchoolDao.class).searchSchool(parameter);
   }



	@Override
	public List<HSchoolDto> searchRegion(Map<String, String> parameter) {
		System.out.println("   > SchoolServiceImpl 입성 > searchRegion");
		return sqlSession.getMapper(SchoolDao.class).searchRegion(parameter);
	}



	@Override
	public List<HSchoolDto> viewAll(String keyword) {
		System.out.println("   > SchoolServiceImpl 입성 > viewAll");
		return  sqlSession.getMapper(SchoolDao.class).viewAll(keyword);
	}



	@Override
	public List<HSchoolDto> viewMoreInfo(String schoolName) {
		System.out.println("   > SchoolServiceImpl 입성 > viewMoreInfo");
		return sqlSession.getMapper(SchoolDao.class).viewMoreInfo(schoolName);
	}



	@Override
	public String modifyInfo (HSchoolDto dto) {
		System.out.println("  	 > SchoolServiceImpl 입성 > modifyInfo");
		sqlSession.getMapper(SchoolDao.class).modifyInfo(dto);
		return "";
	}



	@Override
	public String deleteInfo(String schoolCode) {
		System.out.println("   > SchoolServiceImpl 입성 > deleteInfo");
		sqlSession.getMapper(SchoolDao.class).deleteInfo(schoolCode);
		
		return"";
	}



	@Override
	public List<MemberDto> getMentoInfo(String schoolCode) {
		System.out.println("   > SchoolServiceImpl 입성 > 멘토Info DB얻으러");
		return sqlSession.getMapper(SchoolDao.class).getMentoInfo(schoolCode);
	}

}