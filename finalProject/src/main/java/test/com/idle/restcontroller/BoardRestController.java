package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class BoardRestController {
	
	@Autowired
	BoardService service;
	
	//영웅님
	@RequestMapping(value = "/jsonBoardSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public BoardVO jsonBoardSelectOne(BoardVO vo) {
		log.info("/jsonBoardSelectOne.do...{}",vo);
		
		BoardVO vo2 = service.selectOne(vo);
		log.info("{}",vo2);
		
		return vo2;
	}
	

}