package com.scit.web12.controller;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import com.scit.web12.vo.MemberVO;
import com.scit.web12.vo.Message;

@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	// 채팅 메세지 전달
		@MessageMapping("/basicChatRoom")				// stompClient.send("/chat", ...)의 첫번째 파라미터와 동일
		@SendTo("/subscribe/basicChatRoom")				//	stompClient.subscribe("/subscribe/chat", ...)의 첫번쨰 파라미터와 동일
		public Message sendChatMessage(Message message, SimpMessageHeaderAccessor headerAccessor){
			logger.info("채팅 컨트롤러 시작");
			//인터셉터에서 등록해두었던 사용자 정보 가져오기
			MemberVO userObject = (MemberVO)headerAccessor.getSessionAttributes().get("user");
			
			message.setId(userObject.getMember_id());
			message.setUsername(userObject.getMember_nm());
			message.setChatdate(LocalDateTime.now());
			
			logger.info("채팅 컨트롤러 종료");
			return message;
		}
}
