package com.scit.web12.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.web12.dao.BoardDAO;
import com.scit.web12.vo.BoardVO;
import com.scit.web12.vo.ReplyVO;

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

	public ArrayList<BoardVO> boardList(String startDate, String endDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println(startDate);
		if(!startDate.equals("none")) {
		startDate = startDate.replace("T", " ");
		endDate = endDate.replace("T", " ");
		}
		System.out.println(startDate);
		System.out.println(endDate);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		ArrayList<BoardVO> list = dao.boardList(map);

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

	public BoardVO getVO(int msg) {
		dao.updateHits(msg);
		BoardVO vo = dao.getVO(msg);
		return vo;
	}

	public int checkLikeId(int msg) {
		HashMap<String, Object> lk = new HashMap<String, Object>();
		lk.put("a1", msg);
		lk.put("a2", (String)session.getAttribute("loginId"));
		int cnt = dao.checkLikeId(lk);
		return cnt;
	}

	public int checkLikeCount(int msg) {
		int cnt = dao.checkLikeCount(msg);
		return cnt;
	}

	public void likeInsert(int msg) {
		HashMap<String, Object> lk = new HashMap<String, Object>();
		lk.put("a1", msg);
		lk.put("a2", (String)session.getAttribute("loginId"));
		dao.likeInsert(lk);
	}

	public void likeDelete(int msg) {
		HashMap<String, Object> lk = new HashMap<String, Object>();
		lk.put("a1", msg);
		lk.put("a2", (String)session.getAttribute("loginId"));
		dao.likeDelete(lk);
	}

	public BoardVO boardSelectOne(int board_no) {
		BoardVO vo = dao.getVO(board_no);
		return vo;
	}

	public ArrayList<BoardVO> getNewsFeed() {
		
		return dao.getNewsFeed();
	}

	public int replyCount(int msg) {
		
		return dao.replyCount(msg);
	}

	public ArrayList<ReplyVO> replyList(int msg, int startRecord, int countPerPage) {
		
		return dao.replyList(msg, startRecord, countPerPage);
	}

}
