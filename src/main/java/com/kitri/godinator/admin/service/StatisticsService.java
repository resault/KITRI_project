package com.kitri.godinator.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kitri.godinator.model.VisitDto;

@Service
public interface StatisticsService {

	void addCnt(String user);
	void enrollVisit(String id);
	void addUserCnt(String StaticId);
	
	List<VisitDto> upperMemberList();
	
	
}
