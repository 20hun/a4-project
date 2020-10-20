package com.scit.web12.dao;

import com.scit.web12.vo.MemberVO;

public interface StompMapper {
	
	public MemberVO selectUser(String userId);
}
