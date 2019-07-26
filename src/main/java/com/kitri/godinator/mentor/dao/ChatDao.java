package com.kitri.godinator.mentor.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.OnChatDto;

public interface ChatDao {

	String[] selOncate(String id);
	int insertOnChat(OnChatDto onChatDto);
	void deleteOnChat(String id);
	List<MemberDto> selOnMentor(Map<String, String> params);
	int checkOnlineMentor(String mentor);
	int checkOnlineUser(String userID);

}
