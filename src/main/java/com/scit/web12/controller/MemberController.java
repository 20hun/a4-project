package com.scit.web12.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.web12.service.MemberService;
import com.scit.web12.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/member/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		
		logger.info("아무거나");
		
		return "member/joinForm";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String join(MemberVO member) {
		
		String page = "";

		page = ms.memberJoin(member);
		
		return page;
	}
	
	@RequestMapping(value="/member/joinGood", method=RequestMethod.GET)
	public String joinGood() {
		
		return "member/joinGood";
	}
	
	@RequestMapping(value="/member/joinFail", method=RequestMethod.GET)
	public String joinFail() {
		
		return "member/joinFail";
	}
	
	@RequestMapping(value="/member/joinList", method=RequestMethod.GET)
	public String list(Model model) {
		String page = ms.master();
		ArrayList<MemberVO> list = ms.list();
		model.addAttribute("list",list);
		
		return page;
	}
	
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String list(Model model, String member_id) {
		ms.delete(member_id);
		
		ArrayList<MemberVO> list = ms.list();
		model.addAttribute("list",list);
		
		return "member/memberList";
	}

	@RequestMapping(value="/member/check", method=RequestMethod.GET)
	public String joinForm2(Model model, String member_id){
		
		String page = ms.check(member_id);
		
		model.addAttribute("member_id", member_id);
		
		String a = "이미 있는 아이디";
		
		model.addAttribute("repeat", a);
		
		return page;
	}
	int i = 0;
	@RequestMapping(value = "/member/loginForm", method = RequestMethod.GET)
	public String memberLoginForm(Model model) {
		if(i++ != 0) {
		model.addAttribute("fail","로그인 실패");
		}
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String memberLogin(MemberVO member) {

		String page = ms.memberLogin(member);
		
		return page;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String memberLogout() {
		i = 0;
		ms.memberLogout();
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage(Model model) {
		
		MemberVO member = ms.justout();
		
		model.addAttribute("member",member);
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(Model model) {

		MemberVO member = ms.justout();
		model.addAttribute("member",member);
		
		return "member/update";
	}	
	
	@RequestMapping(value="/member/updateComplete", method=RequestMethod.POST)
	public String updateComplete(MemberVO member) {
		
		ms.update(member);
		
		return "redirect:mypage";
	}	
	
	@RequestMapping(value="/member/write", method=RequestMethod.GET)
	public String write(int board_no) {
		
		System.out.println(board_no);;
		
		return "redirect:/";
	}	
}