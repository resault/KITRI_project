package com.kitri.godinator.model;

import lombok.Data;

@Data
public class VisitDto {

	private String visitDate;	 // 방문일자
	private String visitCnt;	 // 방문자수
	private String visitUserId; // 방문자
	private String rownum; // 임시
	private String userName; // 임시

}
