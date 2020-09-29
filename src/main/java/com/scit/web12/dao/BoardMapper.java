package com.scit.web12.dao;

import java.util.ArrayList;

import com.scit.web12.vo.BoardVO;

public interface BoardMapper {

	public int boardWrite(BoardVO board);

	public ArrayList<BoardVO> boardList();

	public ArrayList<BoardVO> check(String member_id);

	public int delete(int board_no);

	public BoardVO getVO(int msg);

}
