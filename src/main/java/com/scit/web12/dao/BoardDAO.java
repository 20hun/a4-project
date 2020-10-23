package com.scit.web12.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.web12.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;

	public int boardWrite(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int cnt = 0;
		
		try {
			cnt = mapper.boardWrite(board);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<BoardVO> boardList(HashMap<String, String> map) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
			list = mapper.boardList(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<BoardVO> check(String member_id) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
			list = mapper.check(member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int delete(int board_no) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int cnt = 0;
		
		try {
			cnt = mapper.delete(board_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public BoardVO getVO(int msg) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		BoardVO vo = null;
		
		try {
			vo = mapper.getVO(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public void updateHits(int msg) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		try {
			mapper.updateHits(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public int checkLikeId(HashMap<String,Object> lk) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int cnt = 0;
		
		try {
			cnt = mapper.checkLikeId(lk);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int checkLikeCount(int msg) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int cnt = 0;
		
		try {
			cnt = mapper.checkLikeCount(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public void likeInsert(HashMap<String, Object> lk) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		try {
			mapper.likeInsert(lk);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void likeDelete(HashMap<String, Object> lk) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		try {
			mapper.likeDelete(lk);
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public ArrayList<BoardVO> getNewsFeed() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
			list = mapper.getNewsFeed();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
