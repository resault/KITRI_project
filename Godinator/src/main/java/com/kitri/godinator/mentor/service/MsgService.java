package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MsgDto;

public interface MsgService {

	String writeMsg(Map<String, String> parameter);
	List<MsgDto> getMsgList(Map<String, String> parameter);
	MentorPageNaviDto getPageNavi(Map<String, String> parameter);
	MsgDto getMsg(String seq, String userId);
	String mvTrash(String[] seqArr, String[] sendIdArr, String userId);
	String delMsg(String[] seqArr, String[] sendIdArr, String userId);
	String restoreMsg(String[] seqArr, String[] sendIdArr, String userId);

}
