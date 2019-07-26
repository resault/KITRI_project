package com.kitri.godinator.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

public interface SchoolDao {

   public List<HSchoolDto> viewAll(String keyword); // 그냥 볼 시에
   public List<HSchoolDto> viewMoreInfo(String schoolName); // modify에서 더 넘길 정보
   public List<HSchoolDto> searchSchool(Map<String, String> parameter);
   public List<HSchoolDto> searchRegion(Map<String, String> parameter);
   
   public List<HSchoolDto> modifyInfo(HSchoolDto dto);
   public void deleteInfo(String schoolCode); // 삭제용
   
   List<MemberDto> getMentoInfo(String schoolCode);
}