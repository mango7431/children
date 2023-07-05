package test.com.idle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.vo.BlackVO;
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class BoardController {

	@Autowired
	BoardService service;
	
	//수정
	//중고거래 목록
	@RequestMapping(value = "/boardSelectAll.do", method = RequestMethod.GET)
	public String boardSelectAll(Model model, @RequestParam(value="category", required=false) String category,
			 @RequestParam(value = "minPrice", required = false) Integer minPrice,
             @RequestParam(value = "maxPrice", required = false) Integer maxPrice,
             @RequestParam(value = "sortType", required = false) String sortType,
             @RequestParam(value = "board_type", required = false) Integer board_type) {
		log.info("/boardSelectAll.do,{},{}",category,minPrice);
		log.info("/boardSelectAll.do,{},{}",sortType,board_type);
		
		if(category == null || category.equals("all")) {
			if(sortType == null || sortType.equals("latest")) {
					List<BoardVO> vos = service.boardSelectAll(minPrice,maxPrice,board_type);			
					model.addAttribute("vos", vos);
			    }else if(sortType.equals("views")){
					List<BoardVO> vos = service.boardSelectAllViews(minPrice,maxPrice,board_type);			
					model.addAttribute("vos", vos);
			    }
		}else {
			List<BoardVO> vos = service.boardSelectAll(category,minPrice,maxPrice,board_type);			
			model.addAttribute("vos", vos);
		}
	
		return "board/selectAll";
	}
	
	//신고하기 기능
	@RequestMapping(value = "/blackInsertOK.do", method = RequestMethod.POST)
	public String blackInsertOK(BlackVO vo) {
		log.info("/blackInsertOK.do:{}",vo);

		int result = service.blackInsert(vo);
		log.info("result:{}", result);
		
		return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
	}
	
	
	//영웅님
	@RequestMapping(value = "/boardSelectOne.do", method = RequestMethod.GET)
	public String boardSelectOne(BoardVO vo, Model model) {
		log.info("/boardSelectOne.do...{}",vo);
		
		int result = service.viewCountUp(vo);
		log.info("result : {}",result);
		
		BoardVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "board/selectOne";
	}
}
