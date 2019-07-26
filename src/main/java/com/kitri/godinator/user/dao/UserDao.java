package com.kitri.godinator.user.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MemberPreferDto;
import com.kitri.godinator.model.MentorDto;

public interface UserDao {

	int idCheck(String id);
	int register(MemberDto memberDto); 
	
	void updateMemberh(Map<String, String> map);
	void updateMemberu(Map<String, String> map);
	
	int insertMentorh(String id);
	int insertMentoru(String id);
	int insertMentor(String id);
	int insertMemberPreference(MemberPreferDto memberPreferDto);
	MemberDto selectMember(Map<String, String> map);
	int modifyMember(MemberDto memberDto);
	int withdrawMember(String id);
	String selectHname(String hCode);
	String selectUname(String uCode);
	List<String> selectCate(String id);
	int ckId(String id);
	int memberReset(String id);
	int mentorReset(String id);
	MemberDto findModify(String userId);
	String findHcate(String highSchool);

}
