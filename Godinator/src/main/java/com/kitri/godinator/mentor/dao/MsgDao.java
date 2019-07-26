package com.kitri.godinator.mentor.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MsgDto;

public interface MsgDao {

	int insertMsg(Map<String, String> parameter);
	List<MsgDto> selMsgList(Map<String, String> parameter);
	int getTotalCount(Map<String, String> parameter);
	MsgDto selMsg(int seq);
	void updateRecvDate(int seq);
	int updateStusT(Map<String, String> map);
	int updateStusD(Map<String, String> map);
	int updateStusR(Map<String, String> map);

}
