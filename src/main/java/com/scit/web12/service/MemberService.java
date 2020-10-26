package com.scit.web12.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.web12.dao.MemberDAO;
import com.scit.web12.vo.BoardVO;
import com.scit.web12.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberDAO dao;
	
	public String memberJoin(MemberVO member) {
		
		String page = "";
		
		int cnt = dao.memberJoin(member);
		
		if(cnt != 0) {
			page = "redirect:/";
		}else {
			page = "redirect:joinForm";
		}
		
		return page;
	}
	
	public ArrayList<MemberVO> list(){
		
		ArrayList<MemberVO> list = dao.list();
		
		return list;
	}
	
	public int delete(String member_id) {
		
		int cnt = dao.delete(member_id);
		
		return cnt;
	}
	
	public String check(String member_id) {
		
		MemberVO vo = dao.check(member_id);
		
		if(vo == null) {
			return "member/joinForm2";
		}else {
			return "member/joinForm";
		}
		
	}
	
	public String memberLogin(MemberVO member) {
		String page ="";
		MemberVO loginCheck = dao.check(member.getMember_id());
		
		//로그인 성공 여부에 따라 리턴될 값
		//사용자는 id를 입력했지만 null값 받을 수도 있다
		if(loginCheck != null && loginCheck.getMember_pw().equals(member.getMember_pw())) {
			//로그인 성공
			//SessionScope가 필요한 상황 > HttpSession객체가 SessionScope
			session.setAttribute("loginId", member.getMember_id());
			page = "redirect:/";
			//세션에 데이터 저장(조작)하니까 리다이렉트
		} else {
			page = "redirect:/";
			//입력되었던 데이터 유지되니까 리다이렉트
			//로그인 실패
		}
		return page;
	}
	
	public void memberLogout() {
		session.removeAttribute("loginId");
	}
	
	public String master() {
		if(session.getAttribute("loginId").equals("hong2")) {
			return "member/memberList";
		}
		return "redirect:/";
	}
	
	public MemberVO justout() {
		MemberVO vo = dao.check((String)session.getAttribute("loginId"));
		return vo;
	}
	
	public void update(MemberVO member) {
		dao.update(member);
	}

	public ArrayList<BoardVO> boardList() {
		ArrayList<BoardVO> list = dao.boardList((String)session.getAttribute("loginId"));
		return list;
	}
}
