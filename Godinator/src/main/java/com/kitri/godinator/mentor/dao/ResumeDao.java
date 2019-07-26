package com.kitri.godinator.mentor.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.EditDto;

public interface ResumeDao {

	List<BoardDto> selSchool(Map<String, String> srcCnd);
	int insertResume(EditDto editDto);
	int insertEdit(EditDto editDto);
	List<EditDto> selResumeList(Map<String, String> parameter);
	int getTotalCount(Map<String, String> parameter);
	EditDto selResume(int seq);
	EditDto selEdit(int pseq);
	List<EditDto> selEditList(Map<String, String> parameter);
	int selEditCnt(Map<String, String> parameter);
	void updateState(int pseq);
	int selStayCnt(Map<String, String> parameter);

}
