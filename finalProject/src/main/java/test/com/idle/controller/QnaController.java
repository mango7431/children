package test.com.idle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.QnaService;

@Slf4j
@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping(value = "q-selectAll.do", method = RequestMethod.GET)
	public String qSelectAll(Model model) {
		log.info("/q-selectAll.do");
		
		return "qna/qSelectAll";
	}
	
	@RequestMapping(value = "q-selectOne.do", method = RequestMethod.GET)
	public String qSelectOne(Model model) {
		log.info("/q-selectOne.do");
		
		return "qna/qSelectOne";
	}
	
}
