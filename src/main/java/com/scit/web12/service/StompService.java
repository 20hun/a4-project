package com.scit.web12.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.web12.dao.StompDAO;
import com.scit.web12.vo.Message;

@Service
public class StompService {
	
	@Autowired
	private StompDAO dao;

	public int insertMessage(Message message) {
		int cnt = dao.insertMessage(message);
		return cnt;
	}
	
	

}
