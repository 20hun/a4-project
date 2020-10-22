package com.scit.web12.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scit.web12.vo.BoardVO;

public interface SnsMapper {

	public ArrayList<BoardVO> boardList(String member_id);

	public int follow(HashMap<String, String> lk);

	public int followCancle(HashMap<String, String> lk);

	public ArrayList<BoardVO> infiniteScrollDown(HashMap<String, Object> map);

	public ArrayList<BoardVO> infiniteScrollUp(HashMap<String, Object> map);

}
