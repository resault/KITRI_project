package com.kitri.godinator.schoolinfo.service;

import java.util.Map;

import org.springframework.ui.Model;

public interface SchoolInfoService {

	public String getEvals(Map<String, Object> parameter);

	public Map<String, Object> findSchoolBySchoolCode(Map<String, String> parameter);

	public String evalUpDownClick(Map<String, Object> parameter);

	public int insertEvalByUser(Map<String, String> parameter);

	public void insertAndUpdateHEvalByUser(Map<String, String> parameter);

	public Map<String, String> getUserEvalLog(String userId, Model model, String schoolCate);

	public void getUserEval(String userId, Model model, String schoolCate);
	
}