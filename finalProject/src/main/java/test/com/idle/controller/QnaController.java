package test.com.idle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.QnaService;
import test.com.idle.vo.QnaVO;

@Slf4j
@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping(value = "q-selectAll.do", method = RequestMethod.GET)
	public String qSelectAll(Model model) {
		log.info("/q-selectAll.do");
		
		return "qna/selectAll";
	}
	
	@RequestMapping(value = "q-selectOne.do", method = RequestMethod.GET)
	public String qSelectOne(Model model) {
		log.info("/q-selectOne.do");
		
		return "qna/selectOne";
	}
	
	@RequestMapping(value = "q-insert.do", method = RequestMethod.GET)
	public String qInsert(Model model) {
		log.info("/q-insert.do");
		
		return "qna/insert";
	}
	
	@RequestMapping(value = "q-insertOK.do", method = RequestMethod.GET)
	public String qInsertOK(QnaVO vo) {
		log.info("/q-insertOK.do");
		log.info("{}", vo);
		
		int result = service.qInsert(vo);
		log.info("result:{}", result);
		
		if(result == 1) {
			return "redirect:q-selectAll.do";
		} else {			
			return "redirect:q-insert.do";
		}
	}
	
	@RequestMapping(value = "q-update.do", method = RequestMethod.GET)
	public String qUpdate(Model model) {
		log.info("/q-update.do");
		
		return "qna/update";
	}
	
}
