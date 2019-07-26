package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;

public interface ResumeService {

	String srchSchool(Map<String, String> srcCnd);
	int saveResume(EditDto editDto);
	MentorPageNaviDto getPageNavi(Map<String, String> parameter);
	List<EditDto> getResumeList(Map<String, String> parameter);
	EditDto getResume(int seq);
	List<EditDto> getEditList(Map<String, String> parameter);
	int getEditCnt(Map<String, String> parameter);
	int saveEdit(EditDto editDto);
	EditDto getEdit(int pseq);
	int getStayCnt(Map<String, String> parameter);

}
