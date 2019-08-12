package com.kitri.godinator.schoolinfo.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;

public interface SearchSchoolDao {

	public List<HSchoolDto> getHSchoolsGroupByType(Map<String, Object> parameter);
	public List<USchoolDto> getUSchoolsGroupByType(Map<String, Object> parameter);
	public List<HSchoolDto> getHSchoolList();
	public List<USchoolDto> getUSchoolList();
	public int getCountHSchoolsByCondition(Map<String, Object> parameter);
	public int getCountUSchoolsByCondition(Map<String, Object> parameter);
	public Map<String, String> getUserPrefer(String userId);
	public List<HSchoolDto> getHRecomSchool(String userId);
	public List<USchoolDto> getURecomSchool(String userId);
}
