package com.scit.web12.controller;

import java.util.ArrayList;

import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value = "/basicChat.do")
public class BasicChatController {

	// 세션(=열린 소켓에 대한 정보를 담는 객체)들을 관리할 변수 sessionList.
	private static final ArrayList<Session> sessionList = new ArrayList<Session>();
	private static final Logger logger = LoggerFactory.getLogger(BasicChatController.class);

	/**
	 * 소켓을 열 때 실행되는 메서드.
	 * 
	 * @param session: 소켓을 열 때 생성된 세션 객체.
	 */
	@OnOpen
	public void onOpen(Session session) {
		// 세션이 생성되면 다른 세션과 구별하기 위해 고유의 id값을 생성한다.
		logger.info("소켓 열기 실행. 생성된 세션 ID: " + session.getId());

		// 생성된 세션을 sessionList에 추가한다.
		// 이후 어떤 세션에서 메시지를 전송하는 상황이 발생했을 때, sessionList에 등록된 세션들에 대해 메시지를 처리한다. 
		sessionList.add(session);
	}

	/**
	 * 소켓을 닫을 때 실행되는 메서드.
	 * 
	 * @param session: 소켓을 닫을 때 종료된 세션 객체.
	 */
	@OnClose
	public void onClose(Session session) {
		// 이 메서드가 실행되는 시점에서 세션 자체는 이미 종료되었으나, 이 메서드가 종료되기 전까지 세션에 대한 정보는 확인할 수 있다. 
		logger.info("소켓 닫기 실행. 종료된 세션 ID: " + session.getId());

		// 종료된 세션을 sessionList에서 제거한다.
		// 이후 메시지를 전송하는 상황이 발생하더라도 종료된 세션이 메시지를 받지 못하도록 sessionList에서 세션을 제거한다.
		sessionList.remove(session);
	}

	/**
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param session: 메시지를 보낸 세션 객체
	 * @param message: 페이지로부터 전송받은 메시지
	 */
	@OnMessage
	public void onMessage(Session session, String message) {
		// 메시지를 보낸 세션 객체의 ID와 전송한 메시지를 출력한다.
		logger.info("메시지 실행. 세션 ID / 메시지: " + session.getId() + " / " + message);

		try {
			// 전송받은 메시지를 다시 모든 세션에 대해 전송해준다.
			// 메시지를 전송할 때, 세션의 getBasicRemote().sendText() 메서드를 사용한다.
			
			// 메시지를 보낸 세션 자기자신에게도 메시지를 표시한다.
			session.getBasicRemote().sendText("나: " + message);

			// 메시지를 보낸 세션을 제외한 다른 모든 세션들에게 메시지를 표시한다.
			for (Session anotherSession : sessionList) {
				// 세션 고유의 id값을 이용해서 메시지를 보낸 세션과 다른 세션을 구별하고, 다른 세션에게만 메시지를 보낸다.
				if (!anotherSession.getId().equals(session.getId())) {
					anotherSession.getBasicRemote().sendText("사용자 " + session.getId() + ": " + message);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable e) {
		logger.info("오류 발생. 오류가 발생한 세션 ID: " + session.getId());
	}
}
