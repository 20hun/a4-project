package com.scit.web12.dao;

import com.scit.web12.vo.StompUser;

public interface StompMapper {
	
	public StompUser selectUser(String userId);
}
