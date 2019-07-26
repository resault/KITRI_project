package com.kitri.godinator.mentor.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MentorInfoDto;

public interface MentorDao {

	int checkAuth(String id);
	List<MentorInfoDto> selMentor(Map<String, String> params);
	int getTotalCount(Map<String, String> parameter);

}
