package com.scit.web12.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.web12.service.SnsService;
import com.scit.web12.vo.BoardVO;

@RequestMapping(value="/sns")
@Controller
public class SnsController {
	
	@Autowired
	private SnsService ss;

	@RequestMapping(value="/timeLine", method=RequestMethod.GET)
	public String timeLine(String member_id, Model model) {
		ArrayList<BoardVO> list = ss.boardList(member_id);
		model.addAttribute("list", list);
		
		return "sns/timeLine";
	}
	
	@ResponseBody
	@RequestMapping(value="/follow", method=RequestMethod.GET)
	public int follow(String msg) {
		System.out.println(msg);
		
		int follow_check = ss.follow(msg);
		System.out.println(follow_check);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/followCancle", method=RequestMethod.GET)
	public int followCancle(String msg) {
		System.out.println(msg);
		int follow_check = ss.followCancle(msg);
		System.out.println(follow_check);
		return 0;
	}

}
