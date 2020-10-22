package com.scit.web12.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.web12.vo.BoardVO;

@Repository
public class SnsDAO {
	
	@Autowired
	private SqlSession session;

	public ArrayList<BoardVO> boardList(String member_id) {
		
		SnsMapper mapper = session.getMapper(SnsMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
		list = mapper.boardList(member_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public int follow(HashMap<String, String> lk) {
		SnsMapper mapper = session.getMapper(SnsMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.follow(lk);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int followCancle(HashMap<String, String> lk) {
		SnsMapper mapper = session.getMapper(SnsMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.followCancle(lk);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<BoardVO> infiniteScrollDown(HashMap<String, Object> map) {
		SnsMapper mapper = session.getMapper(SnsMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
		list = mapper.infiniteScrollDown(map);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<BoardVO> infiniteScrollUp(HashMap<String, Object> map) {
		SnsMapper mapper = session.getMapper(SnsMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
		list = mapper.infiniteScrollUp(map);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

}
