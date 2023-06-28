package test.com.idle.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "boardSelectAll.do", method = RequestMethod.GET)
	public String boardSelectAll(BoardVO vo,Model model) {
		
		List<BoardVO> vos = new ArrayList<BoardVO>();
		vos = service.selectAll();
		log.info("{}",vos);
		
		model.addAttribute("vos",vos);
		
		return "board/selectAll";
	}

	
	@RequestMapping(value = "boardSelectOne.do", method = RequestMethod.GET)
	public String boardSelectOne(BoardVO vo) {
		
		
		
		return "home";
	}
}
