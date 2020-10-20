package com.scit.web12.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.web12.vo.MemberVO;
import com.scit.web12.vo.Message;


@Repository
public class StompDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public MemberVO selectUser(String userId){
		StompMapper mapper = sqlsession.getMapper(StompMapper.class);
		MemberVO user = null;
		
		try{
			user = mapper.selectUser(userId);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user;
	}

	public int insertMessage(Message message) {
		StompMapper mapper = sqlsession.getMapper(StompMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.insertMessage(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
}
