package com.scit.web12.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.web12.service.BoardService;
import com.scit.web12.util.FileService;
import com.scit.web12.vo.BoardVO;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService ms;
	
	final String uploadPath = "/boardfile";
	
	@RequestMapping(value="/boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm(Model model, String lat, String lon) {
	
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String boardWrite(BoardVO board
			, MultipartFile upload) {
		if(!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savedfile);
		}
		System.out.println(board);
		ms.boardWrite(board);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(Model model){
		
		ArrayList<BoardVO> list = ms.boardList();
		
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping(value="/receiveList", method = RequestMethod.POST)
	public ArrayList<BoardVO> receiveList() {
		logger.info("receiveList 메서드 실행");
		
		ArrayList<BoardVO> list = ms.boardList();
		
		return list;
	}
	
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		
		ArrayList<BoardVO> list = ms.justout();
		
		model.addAttribute("list",list);
		
		return "board/profile";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(int board_no) {
		
		ms.delete(board_no);
		
		return "redirect:/board/profile";
	}
	
	@ResponseBody
	@RequestMapping(value="/getBubble", method = RequestMethod.POST)
	public BoardVO getBubble(int msg) {
		BoardVO vo = ms.getVO(msg);
		int a = ms.checkLikeId(msg);
		int b = ms.checkLikeCount(msg);
		vo.setLike_check(a);
		vo.setBoard_like(b);
		System.out.println(vo);
		
		return vo;
	}

}
