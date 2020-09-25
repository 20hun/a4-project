package com.scit.web12.dao;

import java.util.ArrayList;

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

	public ArrayList<BoardVO> boardList() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
			list = mapper.boardList();
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

	public BoardVO getVO(String type) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		BoardVO vo = null;
		
		try {
			vo = mapper.getVO(type);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

}
