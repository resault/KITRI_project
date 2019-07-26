package com.kitri.godinator.user.service;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MemberPreferDto;
import com.kitri.godinator.model.MentorDto;


public interface UserService {
	String idCheck(String id);
	int register(MemberDto memberDto);
	int mentorRegister(Map<String, String> map);
	int registerPrefer(MemberPreferDto memberPreferDto);
	MemberDto loginMember(Map<String, String> map);
	int modifyMember(MemberDto memberDto);
	int withdrawMember(String id);
	String selectHname(String hCode);
	String selectUname(String uCode);
	List<String> selectCate(String id);
	int mentorModifyRegister(Map<String, String> map);
	MemberDto findModify(String userId);
	String findHcate(String highSchool);
	
}
