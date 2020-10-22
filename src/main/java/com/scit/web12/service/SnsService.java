package com.scit.web12.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.web12.dao.SnsDAO;
import com.scit.web12.vo.BoardVO;

@Service
public class SnsService {
	
	@Autowired
	private SnsDAO dao;
	
	@Autowired
	private HttpSession session;

	public ArrayList<BoardVO> boardList(String member_id) {
		ArrayList<BoardVO> list = dao.boardList(member_id);
		return list;
	}

	public int follow(String msg) {
		HashMap<String, String> lk = new HashMap<String, String>();
		lk.put("a1", msg);
		lk.put("a2", (String)session.getAttribute("loginId"));
		int cnt = dao.follow(lk);
		return cnt;
	}

	public int followCancle(String msg) {
		HashMap<String, String> lk = new HashMap<String, String>();
		lk.put("a1", msg);
		lk.put("a2", (String)session.getAttribute("loginId"));
		int cnt = dao.followCancle(lk);
		return cnt;
	}

	public ArrayList<BoardVO> infiniteScrollDown(HashMap<String, Object> map) {
		return dao.infiniteScrollDown(map);
	}

	public ArrayList<BoardVO> infiniteScrollUp(HashMap<String, Object> map) {
		return dao.infiniteScrollUp(map);
	}

}
