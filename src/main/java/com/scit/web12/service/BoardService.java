package com.scit.web12.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.web12.dao.BoardDAO;
import com.scit.web12.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private HttpSession session;

	public int boardWrite(BoardVO board) {
		
		board.setMember_id((String)session.getAttribute("loginId"));
		
		int cnt = dao.boardWrite(board);
		
		return cnt;		
	}

	public ArrayList<BoardVO> boardList() {
		ArrayList<BoardVO> list = dao.boardList();

		return list;
	}

	public ArrayList<BoardVO> justout() {
		ArrayList<BoardVO> list = dao.check((String)session.getAttribute("loginId"));
		return list;
	}

	public int delete(int board_no) {
		
		int cnt = dao.delete(board_no);
				
				return cnt;
	}

	public BoardVO getVO(String type) {
		BoardVO vo = dao.getVO(type);
		return vo;
	}

}
