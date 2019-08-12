package com.kitri.godinator.mentor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.godinator.mentor.dao.MsgDao;
import com.kitri.godinator.mentor.dao.ResumeDao;
import com.kitri.godinator.model.EditDto;
import com.kitri.godinator.model.MsgDto;


@Service
public class MsgServiceImpl implements MsgService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String writeMsg(Map<String, String> parameter) {
		int cnt = sqlSession.getMapper(MsgDao.class).insertMsg(parameter);
		return (cnt != 1) ? "0" : "1";
	}

	@Override
	public List<MsgDto> getMsgList(Map<String, String> parameter) {
		int pg = MentorPageNavi.NotNumberToOne(parameter.get("pg"));
		int end = pg * Integer.parseInt(parameter.get("articleSize"));
		int start = end - Integer.parseInt(parameter.get("articleSize"));
		
		parameter.put("start", start + "");
		parameter.put("end", end + "");
		
		List<MsgDto> list = sqlSession.getMapper(MsgDao.class).selMsgList(parameter);
		return list;
	}

	@Override
	public MentorPageNaviDto getPageNavi(Map<String, String> parameter) {
		int totalArticleCount = sqlSession.getMapper(MsgDao.class).getTotalCount(parameter);
		MentorPageNaviDto navigation = MentorPageNavi.getPageNavi(parameter, totalArticleCount);
		return navigation;
	}

	@Override
	public MsgDto getMsg(String seq, String userId) {
		MsgDto msgDto = sqlSession.getMapper(MsgDao.class).selMsg(Integer.parseInt(seq));
		msgDto.setMsgContent(msgDto.getMsgContent().replace("\n", "<br>"));
		if(userId.equals(msgDto.getRecvId()) && msgDto.getRecvDate() == null) {
			sqlSession.getMapper(MsgDao.class).updateRecvDate(Integer.parseInt(seq));
		}
		return msgDto;
	}

	@Override
	public String mvTrash(String[] seqArr, String[] sendIdArr, String userId) {
		String result = "1";
		int len = seqArr.length;
		
		for(int i=0; i<len; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("seq", seqArr[i]);
			map.put("sendId", sendIdArr[i]);
			map.put("userId", userId);
			int cnt = sqlSession.getMapper(MsgDao.class).updateStusT(map);
			if(cnt == 0) {
				result = "0";
				return result;
			}
		}
		return result;
	}

	@Override
	public String delMsg(String[] seqArr, String[] sendIdArr, String userId) {
		String result = "1";
		int len = seqArr.length;
		
		for(int i=0; i<len; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("seq", seqArr[i]);
			map.put("sendId", sendIdArr[i]);
			map.put("userId", userId);
			int cnt = sqlSession.getMapper(MsgDao.class).updateStusD(map);
			if(cnt == 0) {
				result = "0";
				return result;
			}
		}
		return result;
	}

	@Override
	public String restoreMsg(String[] seqArr, String[] sendIdArr, String userId) {
		String result = "1";
		int len = seqArr.length;
		
		for(int i=0; i<len; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("seq", seqArr[i]);
			map.put("sendId", sendIdArr[i]);
			map.put("userId", userId);
			int cnt = sqlSession.getMapper(MsgDao.class).updateStusR(map);
			if(cnt == 0) {
				result = "0";
				return result;
			}
		}
		return result;
	}
}
