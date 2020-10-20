package com.scit.web12.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Message {
	private String send_id;
	private String receive_id;
	private String message;
	private LocalDateTime message_indate;	
}
