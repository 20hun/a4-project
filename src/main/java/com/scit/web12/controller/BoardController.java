package com.scit.web12.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.web12.service.BoardService;
import com.scit.web12.util.FileService;
import com.scit.web12.vo.BoardVO;
import com.scit.web12.vo.Latlon;
import com.scit.web12.vo.ReplyVO;
import com.scit.web12.util.PageNavigator;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService ms;
	
	final String uploadPath = "/boardfile";
	private final int COUNTERPAGE = 5;
	private final int PAGEPERGROUP = 5;
	
	@ResponseBody
	@RequestMapping(value="/replyList", method=RequestMethod.GET)
	public ArrayList<ReplyVO> replyList(
			@RequestParam(value = "msg", defaultValue="0") int msg
			,@RequestParam(value = "page", defaultValue="1") int page) {
		//전체 글 개수 조회(검색을 했을때도 검색에 해당되는 글의 전체 개수도 조회  예로 전체 1000개, 검색 조건에 맞는 것 300개)
		int count = ms.replyCount(msg);
		PageNavigator navi = new PageNavigator(COUNTERPAGE, PAGEPERGROUP, page, count);
		
		ArrayList<ReplyVO> list2 = ms.replyList(msg, navi.getStartRecord(), navi.getCountPerPage());
		logger.info("list의 사이즈{}", list2.size());
		System.out.println(list2);
		return list2;
	}
	
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
	 public String boardList(){
		 return "board/boardList";
	 }
	
	@ResponseBody
	@RequestMapping(value="/receiveList", method = RequestMethod.POST)
	public ArrayList<BoardVO> receiveList(
			@RequestParam(value="startDate",defaultValue="none") String startDate,
			@RequestParam(value="endDate",defaultValue="") String endDate) {
		logger.info("receiveList 메서드 실행");
		System.out.println(startDate);
		System.out.println(endDate);
		ArrayList<BoardVO> list = ms.boardList(startDate, endDate);
		
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
	
	@RequestMapping(value="/navigation", method=RequestMethod.GET)
	public String navigation(Model model, Latlon ll){
		System.out.println(ll);
		model.addAttribute("ll",ll);
		return "member/joinForm2";
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
	
	@ResponseBody
	@RequestMapping(value="/getNewsFeed", method = RequestMethod.POST)
	public ArrayList<BoardVO> getNewsFeed() {
		ArrayList<BoardVO> list = ms.getNewsFeed();
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/likeInsert", method = RequestMethod.POST)
	public void likeInsert(int msg) {
		ms.likeInsert(msg);
	}
	
	@ResponseBody
	@RequestMapping(value="/likeDelete", method = RequestMethod.POST)
	public void likeDelete(int msg) {
		ms.likeDelete(msg);
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String fileDownload(int board_no, HttpServletResponse response) {
		BoardVO board = ms.boardSelectOne(board_no);
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());
		try {
				//setHeader = 응답 객체에 하나의 설정을 추가했다 ,앞의 이름으로 ,뒤의 값을 설정	파일 이름이 영어로만 되어 있지 않아도 깨지지 않게 인코딩 해서 파일 이름으로 첨부파일 설정
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		//어플리케이션 기준 들어오는게 input, 나가는게 output
		FileInputStream filein = null; //물리적인 공간의 파일을 webApplication으로 가져오기 위해
		ServletOutputStream fileout = null; //webApplicaion에서 파일객체를 사용자의 브라우저로 전달하기 위해
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
