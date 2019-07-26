package com.kitri.godinator.schoolinfo.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.USchoolDto;

public interface SchoolInfoCommonDao {
	public List<HSchoolDto> selectHSchoolName(Map<String, String> parameter);
	public List<USchoolDto> selectUSchoolName(Map<String, String> parameter);
	public HSchoolDto findHSchoolByCode(Map<String, String> parameter); 
	public USchoolDto findUSchoolByCode(Map<String, String> parameter);
	public void mergeSearchLog(Map<String, String> parameter); 
	public int hSchoolDataInsert(Map<String, String> parameter); 
}