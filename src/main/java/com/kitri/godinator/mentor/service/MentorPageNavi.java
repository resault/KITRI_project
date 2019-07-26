package com.kitri.godinator.mentor.service;

import java.util.Map;

public class MentorPageNavi {

	public static MentorPageNaviDto getPageNavi(Map<String, String> parameter, int totalArticleCount) {
		
		MentorPageNaviDto navigation = new MentorPageNaviDto();
		
		//전체글수
		navigation.setPageSize(Integer.parseInt(parameter.get("pageSize")));
		navigation.setArticleSize(Integer.parseInt(parameter.get("articleSize")));
		navigation.setTotalArticleCount(totalArticleCount);
//			System.out.println("totalArticleCount" + totalArticleCount + " pageSize" +  navigation.getPageSize() + " ArticleSize" +  navigation.getArticleSize());
		
		//전체 페이지수
		int totalPageCount = ( totalArticleCount -1 ) / navigation.getArticleSize() + 1;
		navigation.setTotalPageCount(totalPageCount);

		//이전, 다음 버튼 활성화 여부 설정 (true : 비활성화)
		int pg = NotNumberToOne(parameter.get("pg"));
		parameter.put("pg", pg+"");
		navigation.setNowFirst(pg <= navigation.getPageSize());	//이전 버튼
		navigation.setNowEnd((totalPageCount-1) / navigation.getPageSize() * navigation.getPageSize() < pg); //다음 버튼
		navigation.setPageNo(pg);
		
		return navigation;
	}
	
	public static int NotNumberToZero(String tmp) {
		
		if(isNumber(tmp)) {
			return Integer.parseInt(tmp);
		}
		return 0;
	}
	
	public static int NotNumberToOne(String tmp) {
		
		if(isNumber(tmp)) {
			return Integer.parseInt(tmp);
		}
		return 1;
	}

	private static boolean isNumber(String tmp) {
		boolean flag = true;
		
		if(tmp != null && tmp != "") {
			int len = tmp.length();
			for(int i=0; i<len; i++) {
				int num = tmp.charAt(i) - 48;
				if(num < 0 || num > 9) {
					flag = false;
					break;
				}
			}
		} else {
			flag = false;
		}
		
		return flag;
	}
}
