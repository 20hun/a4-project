package com.scit.web12.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.web12.vo.BoardVO;
import com.scit.web12.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public int memberJoin(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = 0;
		
		try {
		cnt = mapper.memberJoin(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<MemberVO> list(){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		ArrayList<MemberVO> list = null;
		
		try {
		list = mapper.list();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	public MemberVO check(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
				
		MemberVO vo = null;
		
		try {
		vo = mapper.check(member_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int delete(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = 0;
		
		try {
		cnt = mapper.delete(member_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int update(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = 0;
		
		try {
		cnt = mapper.update(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return cnt;
	}

	public ArrayList<BoardVO> boardList(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		ArrayList<BoardVO> list = null;
		
		try {
		list = mapper.boardList(member_id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
}
