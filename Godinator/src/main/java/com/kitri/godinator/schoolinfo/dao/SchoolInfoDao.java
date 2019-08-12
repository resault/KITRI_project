package com.kitri.godinator.schoolinfo.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.EvalSchoolDto;

public interface SchoolInfoDao {
	public List<EvalSchoolDto> getEvalsBySchoolCode(Map<String, Object> parameter);
	public int getCountEvals(Map<String, Object> parameter);
	public String getUpDownByUser(Map<String, Object> parameter);
	public void insertEvalLogUpDown(Map<String, Object> parameter);
	public void deleteEvalUpDown(Map<String, Object> parameter);
	public void minusEvalVote(Map<String, Object> parameter);
	public void plusEvalVote(Map<String, Object> parameter);
	public Map<String, Integer> getEvalUpDown(Map<String, Object> parameter);
	public Map<String, Integer> getHEvalCateAvg(Map<String, String> parameter);
	public Map<String, Integer> getUEvalCateAvg(Map<String, String> parameter);
	public int insertEvalByUser(Map<String, String> parameter);
	public int updateEvalAvgByUser(Map<String, String> parameter);
	public void insertRecordHEvalByUser(Map<String, String> parameter);
	public void updateHEvalAvgByUser(Map<String, String> parameter);
	public void insertRecordUEvalByUser(Map<String, String> parameter);
	public void updateUEvalAvgByUser(Map<String, String> parameter);
	public void udpateHAlmaMater(Map<String, String> parameter);
	public void udpateUAlmaMater(Map<String, String> parameter);
	public Map<String, String> getUserHRecord(String userId);
	public Map<String, String> getUserURecord(String userId);
	public String checkHAlmaMater(String userId);
	public String checkUAlmaMater(String userId);
	public String getUserHEvalA(String userId);
	public String getUserHEvalD(String userId);
	public String getUserUEvalA(String userId);
	public String getUserUEvalD(String userId);
	public int selectHEvalByUser(String userId);
	public int selectUEvalByUser(String userId);
	public void insertUserHEvalA(Map<String, String> parameter);
	public void insertUserHEvalD(Map<String, String> parameter);
	public void insertUserUEvalA(Map<String, String> parameter);
	public void insertUserUEvalD(Map<String, String> parameter);
	public Map<String, String> getUserHschoolCode(String userId);
	public Map<String, String> getUserUschoolCode(String userId);
}
