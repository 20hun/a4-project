package com.scit.web12.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.scit.web12.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = req.getRemoteAddr();
		model.addAttribute("clientIP", ip);

		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="/sendArray", method = RequestMethod.POST)
	public void sendArray(String[] arr) {
		logger.info("sendArray 메서드 실행");
		if(arr != null) {
			for(String s : arr) {
				logger.info("페이지로부터 전달받은 데이터: {}", s);
			}
		}else {
			System.out.println("arr = null");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/sendVO", method = RequestMethod.POST)
	public void sendArray(UserVO user) {
		logger.info("sendVO 메서드 실행");
		logger.info("페이지로부터 전달받은 데이터: {}", user);
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveArray", method = RequestMethod.POST)
	public String[] receiveArray() {
		logger.info("receiveArray 메서드 실행");
		
		String[] arr = new String[2];
		arr[0] = "asdf";
		arr[1] = "1234";		
		return arr;
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveVO", method = RequestMethod.POST)
	public UserVO receiveVO() {
		logger.info("receiveVO 메서드 실행");
				
		return new UserVO("asdf","1234");
	}
	
	@ResponseBody
	@RequestMapping(value="/sendJSON", method = RequestMethod.POST)
	public void sendJSON(@RequestBody UserVO user) {
		logger.info("sendJSON 메서드 실행");
		logger.info("페이지로부터 전달받은 데이터: {}", user);
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveJSON", method = RequestMethod.POST)
	public UserVO receiveJSON() {
		logger.info("receiveJSON 메서드 실행");
				
		return new UserVO("asdf","1234");
	}
	
	@ResponseBody
	@RequestMapping(value="/sendList", method = RequestMethod.POST)
	public void sendList(@RequestBody ArrayList<String> list) {
		logger.info("sendList 메서드 실행");
		logger.info("페이지로부터 전달받은 데이터: {}", list);
	}
	
	@ResponseBody
	@RequestMapping(value="/sendMap", method = RequestMethod.POST)
	public void sendMap(@RequestBody HashMap<String, Object> map) {
		logger.info("sendMap 메서드 실행");
		logger.info("페이지로부터 전달받은 데이터: {}", map);
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveList", method = RequestMethod.POST)
	public ArrayList<String> receiveList() {
		logger.info("receiveList 메서드 실행");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("asdf213");
		list.add("123214asdf");
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveMap", method = RequestMethod.POST)
	public HashMap<String, Object> receiveMap() {
		logger.info("receiveMap 메서드 실행");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", "asdsfsa");
		map.put("userpw", "a13213sfsa");
		return map;
	}
	
}
