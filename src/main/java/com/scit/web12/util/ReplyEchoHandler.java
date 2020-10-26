package com.scit.web12.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.scit.web12.vo.MemberVO;

public class ReplyEchoHandler extends TextWebSocketHandler {
	ArrayList<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished:"+session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage:"+session+":"+message);
		String senderId = getId(session);
		System.out.println(senderId);
		/*
		 * for(WebSocketSession sess: sessions) { sess.sendMessage(new
		 * TextMessage(senderId + ":" + message.getPayload())); }
		 */
		//protocol: cmd,댓글작성자,게시글작성자,bno (ex: reply, user2, user1, 234)
		String msg = message.getPayload();
		if(!(StringUtils.isEmpty(msg))) {
		String[] strs = message.getPayload().split(",");
			if (strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter+"님이"+bno+"번 게시글에 댓글을 달았스니다!");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO)httpSession.get("loginId");
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getMember_id();
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed:"+session+":"+status);
	}
}
