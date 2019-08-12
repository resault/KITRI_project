package com.kitri.godinator.mentor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kitri.godinator.mentor.dao.ChatDao;
import com.kitri.godinator.model.MemberDto;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSession sqlSession;
	
	// #### 채팅 접속권한 확인 ####
	@Override
	public int checkAuth(String id, String cate) {
		int result = 0;
		String[] oncate = sqlSession.getMapper(ChatDao.class).selOncate(id);
		int len = oncate.length;
		
		// 멘토 입장 선택시: 고등|대학 멘토 자격이 있다면 1반환
		// 멘티 입장 선택시: 멘토 자격이 없거나, 고등 멘토 자격만 있다면 1반환
		if(cate.equals("h") || cate.equals("u")) {
			for(String c : oncate) {
				if(c.equals(cate)) {
					result = 1;
					break;
				}
			}
		} else if(cate.equals("m") && (len != 2)) {
			result = 1;
		}
		
		return result;
	}

	// #### 접속중인 멘토 목록 ####
	@Override
	public String getOnMentor(Map<String, String> params) {
		List<MemberDto> list = sqlSession.getMapper(ChatDao.class).selOnMentor(params);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}

	// #### 선택한 멘토가 접속중인지 확인 ####
	@Override
	public int checkOnlineMentor(String mentor) {
		return sqlSession.getMapper(ChatDao.class).checkOnlineMentor(mentor);
	}

	// #### 접속중인지 확인 ####
	@Override
	public int checkOnlineUser(String userID) {
		int result = sqlSession.getMapper(ChatDao.class).checkOnlineUser(userID);
		if(result == 0) {
			return 1;
		} 
		return 2;
	}
}
