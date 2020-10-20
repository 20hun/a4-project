package com.scit.web12.dao;

import com.scit.web12.vo.MemberVO;
import com.scit.web12.vo.Message;

public interface StompMapper {
	
	public MemberVO selectUser(String userId);

	public int insertMessage(Message message);
}
