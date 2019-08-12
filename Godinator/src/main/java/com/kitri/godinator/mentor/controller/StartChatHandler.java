package com.kitri.godinator.mentor.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kitri.godinator.model.MemberDto;

public class StartChatHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> chatUser = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Object> httpSession;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		httpSession = session.getAttributes();
		MemberDto memberDto = (MemberDto) httpSession.get("userInfo"); 
		String id = memberDto.getUserId();
		chatUser.put(id, session);
//		System.out.println("StarChat 웹소켓 연결 성공!!!");
		String other = (String) httpSession.get("other");
		handleTextMessage(session, new TextMessage("conn#!#!#" + other + "#!#!#" + id));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String[] msg = message.getPayload().split("#!#!#");
		httpSession = session.getAttributes();
		if("msg".equals(msg[0])) { // message: ask#!#!#mentorID
			String other = msg[1];
			String mine = ((MemberDto) httpSession.get("userInfo")).getUserId();
			WebSocketSession wsOther = chatUser.get(other);
			WebSocketSession wsMine = chatUser.get(mine);
			if(wsOther != null) {
				wsOther.sendMessage(message); // message: msg#!#!#otherID#!#!#message
				wsMine.sendMessage(message); // message: msg#!#!#otherID#!#!#message
			} else {
				wsMine.sendMessage(new TextMessage("stay"));
			}
		} else if("disconn".equals(msg[0])) {
			String other = msg[1];
			WebSocketSession ws = chatUser.get(other);
			ws.sendMessage(message);
		} else if("conn".equals(msg[0])) {
			String other = msg[1];
			String mine = msg[2];
			WebSocketSession ws = chatUser.get(other);
			if(ws != null) {
				ws.sendMessage(message);
			}
			session.sendMessage(message);
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
		chatUser.remove(id);
		String other = (String) httpSession.get("other");
		if(chatUser.get(other) != null) {
//			System.out.println("대화 상대방: " + other);
			handleTextMessage(session, new TextMessage("disconn#!#!#" + other + "#!#!#" + id));
		}
//		System.out.println("StarChat 웹소켓 연결 해제 완료!!!");
	}

}
