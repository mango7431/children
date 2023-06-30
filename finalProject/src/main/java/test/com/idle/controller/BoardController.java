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
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class BoardController {

	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/selectAll.do", method = RequestMethod.GET)
	public String selectAll(Model model, @RequestParam(value="category", required=false) String category,
			 @RequestParam(value = "minPrice", required = false) Integer minPrice,
             @RequestParam(value = "maxPrice", required = false) Integer maxPrice,
             @RequestParam(value = "sortType", required = false) String sortType,
             @RequestParam(value = "board_type", required = false) Integer board_type) {
		log.info("/selectAll.do,{},{}",category,minPrice);
		log.info("/selectAll.do,{},{}",sortType,board_type);
		
		if(category == null || category.equals("all")) {
			if(sortType == null || sortType.equals("latest")) {
					List<BoardVO> vos = service.selectAll(minPrice,maxPrice,board_type);			
					model.addAttribute("vos", vos);
			    }else if(sortType.equals("views")){
					List<BoardVO> vos = service.selectAllViews(minPrice,maxPrice,board_type);			
					model.addAttribute("vos", vos);
			    }
		}else {
			List<BoardVO> vos = service.selectAll(category,minPrice,maxPrice,board_type);			
			model.addAttribute("vos", vos);
		}
	
		return "board/selectAll";
	}
	
}
