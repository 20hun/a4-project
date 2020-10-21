package com.scit.web12.controller;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import com.scit.web12.service.StompService;
import com.scit.web12.vo.MemberVO;
import com.scit.web12.vo.Message;

@Controller
public class ChatController {
	@Autowired
	private StompService ss;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	// 채팅 메세지 전달
		@MessageMapping("/basicChatRoom")				// stompClient.send("/chat", ...)의 첫번째 파라미터와 동일
		@SendTo("/subscribe/basicChatRoom")				//	stompClient.subscribe("/subscribe/chat", ...)의 첫번쨰 파라미터와 동일
		public Message sendChatMessage(Message message, SimpMessageHeaderAccessor headerAccessor){
			logger.info("채팅 컨트롤러 시작");
			//인터셉터에서 등록해두었던 사용자 정보 가져오기
			MemberVO userObject = (MemberVO)headerAccessor.getSessionAttributes().get("user");
			
			message.setSend_id(userObject.getMember_id());
			message.setMessage_indate(LocalDateTime.now());
			System.out.println(message);
			System.out.println(message.getReceive_id());
			
			int check = ss.insertMessage(message);
			System.out.println(check);
			logger.info("채팅 컨트롤러 종료");
			return message;
		}
}
