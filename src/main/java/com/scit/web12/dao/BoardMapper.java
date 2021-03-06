package com.scit.web12.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.scit.web12.vo.BoardVO;
import com.scit.web12.vo.ReplyVO;

public interface BoardMapper {

	public int boardWrite(BoardVO board);

	public ArrayList<BoardVO> boardList(HashMap<String, String> map);

	public ArrayList<BoardVO> check(String member_id);

	public int delete(int board_no);

	public BoardVO getVO(int msg);

	public void updateHits(int msg);

	public int checkLikeId(HashMap<String, Object> lk);

	public int checkLikeCount(int msg);

	public void likeInsert(HashMap<String, Object> lk);

	public void likeDelete(HashMap<String, Object> lk);

	public ArrayList<BoardVO> getNewsFeed();

	public int replyCount(int msg);

	public ArrayList<ReplyVO> replyList(int msg, RowBounds rb);

	public void replyWrite(ReplyVO rv);

}
