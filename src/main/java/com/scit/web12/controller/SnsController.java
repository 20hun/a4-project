package com.scit.web12.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/sns")
@Controller
public class SnsController {

	@RequestMapping(value="/timeLine", method=RequestMethod.GET)
	public String timeLine() {
		return "sns/timeLine";
	}
}
