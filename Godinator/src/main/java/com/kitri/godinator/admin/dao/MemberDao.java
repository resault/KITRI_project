package com.kitri.godinator.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.godinator.model.BoardDto;
import com.kitri.godinator.model.HSchoolDto;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.MentorDto;

public interface MemberDao {
	List<MemberDto> viewAll(String keyword); // 첫화면 select all
	List<HSchoolDto> getHSchoolName(String hSchoolCode); // 학교이름 get
	List<MentorDto> setMentor(String id); // 멘토로 등급올리기
	
	int countAllMembers(String keyword);
	int countAllMentors();
	
	List<MemberDto> viewMoreInfo(String memberid);
	String deleteInfo(String userid);
	String deleteInfo_child(String userid);
	
	List<BoardDto> viewBoard(String userid);
	int countBoard(String userid);
}
