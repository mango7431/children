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
	
	@RequestMapping(value = "/qnaSelectAll.do", method = RequestMethod.GET)
	public String qnaSelectAll(Model model) {
		log.info("/qnaSelectAll.do");
		
		return "qna/selectAll";
	}
	
	@RequestMapping(value = "/qnaSelectOne.do", method = RequestMethod.GET)
	public String qnaSelectOne(Model model) {
		log.info("/qnaSelectOne.do");
		
		return "qna/selectOne";
	}
	
	@RequestMapping(value = "/qnaInsert.do", method = RequestMethod.GET)
	public String qnaInsert(Model model) {
		log.info("/qnaInsert.do");
		
		return "qna/insert";
	}
	
	@RequestMapping(value = "/qnaInsertOK.do", method = RequestMethod.GET)
	public String qnaInsertOK(QnaVO vo) {
		log.info("/qnaInsertOK.do");
		log.info("{}", vo);
		
		int result = service.qnaInsert(vo);
		log.info("result:{}", result);
		
		if(result == 1) {
			return "redirect:qnaSelectAll.do";
		} else {			
			return "redirect:qnaInsert.do";
		}
	}
	
	@RequestMapping(value = "/qnaUpdate.do", method = RequestMethod.GET)
	public String qnaUpdate(Model model) {
		log.info("/qnaUpdate.do");
		
		return "qna/update";
	}
	
	@RequestMapping(value = "/qnaUpdateOK.do", method = RequestMethod.GET)
	public String qnaUpdateOK(QnaVO vo) {
		log.info("/qnaUpdateOK.do");
		log.info("{}", vo);
		
		int result = service.qnaUpdate(vo);
		log.info("result:{}", result);
		
		if(result == 1) {
			return "redirect:qnaSelectOne.do?qna_num="+vo.getQna_num();
		} else {			
			return "redirect:qnaUpdate.do?qna_num="+vo.getQna_num();
		}
	}
	
	@RequestMapping(value = "/qnaDeleteOK.do", method = RequestMethod.GET)
	public String qnaDeleteOK(QnaVO vo) {
		log.info("/qnaDeleteOK.do");
		log.info("{]", vo);
		
		int result = service.qnaDelete(vo);
		log.info("result:{}", result);
		
		if(result==1) {
			return "redirect:qnaSelectAll.do";
		} else {
			return "redirect:qnaSelectOne.do?qna_num=" + vo.getQna_num();
		}

	}
	
}
