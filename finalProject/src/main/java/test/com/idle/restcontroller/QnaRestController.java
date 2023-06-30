package test.com.idle.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.QnaService;
import test.com.idle.vo.QnaVO;

@Slf4j
@Controller
public class QnaRestController {
	
	@Autowired
	private QnaService service;
	
	
	@ResponseBody
	@RequestMapping(value = "/json_q_selectAll.do", method = RequestMethod.GET)
	public List<QnaVO> json_q_selectAll(QnaVO vo) {
		log.info("/json_q_selectAll.do...vo:{}", vo);
		
		List<QnaVO> vos = service.qSelectAll(vo);
		log.info("vos.size:{}", vos.size());
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/json_q_selectOne.do", method = RequestMethod.GET)
	public QnaVO json_q_selectOne(QnaVO vo) {
		log.info("/json_q_selectAll.do...vo:{}", vo);
		
		QnaVO vo2 = service.qSelectOne(vo);
		log.info("vo2:{}", vo2);
		return vo2;
	}
	
}
