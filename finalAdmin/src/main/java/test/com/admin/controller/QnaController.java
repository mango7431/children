package test.com.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.vo.QnaVO;


@Controller
@Slf4j
public class QnaController {
	
	
	@RequestMapping(value = "/qna_selectAll.do", method = RequestMethod.GET)
	public String qna_selectAll() {
		log.info("/qna_selectAll.do");

		return "qna/selectAll";
	}//end qna_selectAll
	
	@RequestMapping(value = "/qna_selectOne.do", method = RequestMethod.GET)
	public String qna_selectOne(QnaVO vo) {
		log.info("/qna_selectOne.do");
		log.info("{}",vo);
		
		return "qna/selectOne";
	}//end qna_selectOne
	
}
