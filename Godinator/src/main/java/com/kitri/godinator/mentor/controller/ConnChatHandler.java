package com.kitri.godinator.mentor.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kitri.godinator.mentor.dao.ChatDao;
import com.kitri.godinator.model.MemberDto;
import com.kitri.godinator.model.OnChatDto;

public class ConnChatHandler extends TextWebSocketHandler{

	@Autowired
	private SqlSession sqlSession;
	
	private Map<String, WebSocketSession> connUser = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, WebSocketSession> connMentee = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Object> httpSession;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 웹소켓 세션에서 HttpSession의 id 얻어옴
		httpSession = session.getAttributes();
		MemberDto memberDto = (MemberDto) httpSession.get("userInfo"); 
		String id = memberDto.getUserId();
		String oncate = (String) httpSession.get("oncate");
		// 접속 유저 목록에 없는 id인 경우
		if(connUser.get(id) == null) {
			
			// DB에 insert
			OnChatDto onChatDto = new OnChatDto(); 
			onChatDto.setUserId(id);
			onChatDto.setOncate(oncate);
			int result = sqlSession.getMapper(ChatDao.class).insertOnChat(onChatDto);
			
			// 접속중인 유저 목록에 추가
			connUser.put(id, session);
			
			if("m".equals(oncate)) {
				connMentee.put(id, session);
			}
			
			if(!"m".equals(oncate)) {
//				System.out.println(id + " 접속권한: " + oncate);
				TextMessage msg = new TextMessage("conn#!#!#");
				handleTextMessage(session, msg);
			}
//			System.out.println("ConnChat 웹소켓 접속 성공!!!");
//			System.out.println("connUser에 추가 완료!!! " + connUser.get(id));	// 접속한 id로 connUser에 추가 완료
		}
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String[] msg = message.getPayload().split("#!#!#");
		httpSession = session.getAttributes();
		if("ask".equals(msg[0])) { // message: ask#!#!#mentorID
			String mentor = msg[1];
			String mine = ((MemberDto) httpSession.get("userInfo")).getUserId();
			WebSocketSession ws = connUser.get(mentor);
			ws.sendMessage(new TextMessage(message.getPayload() + "#!#!#" + mine)); // message: ask#!#!#mentorID#!#!#menteeID
			
		} else if("answer".equals(msg[0])) { // message: answer#!#!#menteeID#!#!#y|n
			String mentee = msg[1];
			String mine = ((MemberDto) httpSession.get("userInfo")).getUserId();
			WebSocketSession ws = connUser.get(mentee);
			ws.sendMessage(new TextMessage(message.getPayload() + "#!#!#" + mine)); // message: answer#!#!#menteeID#!#!#y|n#!#!#mentorID
			
		} else if("disconn".equals(msg[0]) || "conn".equals(msg[0])) {
			if(connMentee.values() != null) {
				for(WebSocketSession ws : connMentee.values()) {
					ws.sendMessage(message);
				}
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		httpSession = session.getAttributes();
		MemberDto memberDto = (MemberDto) httpSession.get("userInfo"); 
		String id = memberDto.getUserId();
		String oncate = (String) httpSession.get("oncate"); 
		
		// DB & 접속 유저 목록에서 삭제
		sqlSession.getMapper(ChatDao.class).deleteOnChat(id);
		connUser.remove(id);
//		System.out.println("ConnChat 웹소켓 접속 종료!!!");
//		if(connUser.get(id) == null) {
//			System.out.println("connUser에서 제거 완료!!!");
//		}
		
		if(!"m".equals(oncate)) {
//			System.out.println(id + " 접속권한: " + oncate);
			TextMessage msg = new TextMessage("disconn#!#!#");
			handleTextMessage(session, msg);
		} else {
			connMentee.remove(id);
		}
	}

	
}
