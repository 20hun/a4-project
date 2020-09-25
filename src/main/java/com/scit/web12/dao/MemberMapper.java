package com.scit.web12.dao;

import java.util.ArrayList;

import com.scit.web12.vo.MemberVO;

public interface MemberMapper {

	public int memberJoin(MemberVO member);
	public ArrayList<MemberVO> list();
	public int delete(String member_id);
	public MemberVO check(String member_id);
	public int update(MemberVO member);
}
