package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MentorInfoDto;

public interface MentorService {

	int checkAuth(String id);
	List<MentorInfoDto> getMentor(Map<String, String> parameter);
	MentorPageNaviDto getPageNavi(Map<String, String> parameter);


}
