package com.kitri.godinator.admin.dao;

import java.util.List;

import com.kitri.godinator.model.VisitDto;

public interface StatisticsDao {
	void addCnt(String user);
	void enrollVisit(String id);
	void addUserCnt(String StaticId);
	
	List<VisitDto> upperMemberList();
}
