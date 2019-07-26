package com.kitri.godinator.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;

@Service // 이거 꼭!!
public interface SchoolService {
   List<HSchoolDto> searchSchool(Map<String, String> parameter);
   List<HSchoolDto> searchRegion(Map<String, String> parameter);
   List<HSchoolDto> viewAll(String keyword);
   List<HSchoolDto> viewMoreInfo(String schoolName);
   
   // 수정 및 삭제
   String modifyInfo(HSchoolDto dto);
   String deleteInfo(String schoolCode);
   
   // 수정페이지에서 멘토정보 GET
   List<MemberDto> getMentoInfo(String schoolCode);
}