package board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.service.BoardService;


@Controller
@RequestMapping(value="board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping(value="boardWriteForm")
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardWriteForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="boardWrite")
	public void boardWrite(@RequestParam Map<String,String> map ){
		boardService.boardWrite(map);
		
	}
	//(required = false,defaultValue="1") 안들어올때도 있다 기본은 1
	@GetMapping(value="boardList")
	public ModelAndView boardList(@RequestParam(required = false,defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardList.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="getBoardList")
	public Map<String,Object> getBoardList(@RequestParam(required = false,defaultValue="1" )String pg){
		
	
		return boardService.getBoardList(pg);
	}
	
	@GetMapping(value="boardView")
	public ModelAndView boardView(@RequestParam String seq, @RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("seq",seq);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardView.jsp");
		mav.setViewName("/index");
		
		
		return mav;
	}
	
	
	@PostMapping(value="getBoardView")
	@ResponseBody
	public Map<String,Object> getBoardView(@RequestParam String seq) {
		return boardService.getBoardView(seq);
	}
	
	@GetMapping(value="boardReplyForm")
	public ModelAndView boardReplyForm(@RequestParam String seq
									,@RequestParam String pg) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pseq", seq);
		mav.addObject("pg", pg);
		mav.addObject("menu","/WEB-INF/main/menu.jsp");
		mav.addObject("nav","/WEB-INF/main/nav.jsp");
		mav.addObject("display", "/WEB-INF/board/boardReplyForm.jsp");
		mav.setViewName("/index");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value="boardReply")
	public void boardReply(@RequestParam Map<String, String> map) {
		boardService.boardReply(map);
	}
	
	@ResponseBody
	@PostMapping(value="boardSearch")
	public Map<String,Object> boardSearch(@RequestParam Map<String,String> map) {
		return boardService.boardSearch(map); 
	}
	
	
	
}