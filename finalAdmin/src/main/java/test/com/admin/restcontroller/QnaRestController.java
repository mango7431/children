package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.QnaService;
import test.com.admin.vo.QnaVO;


@Controller
@Slf4j
public class QnaRestController {
	
	@Autowired
	QnaService service;
	
	@RequestMapping(value = "/qna_json_selectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<QnaVO> qna_json_selectAll() {
		log.info("/qna_json_selectAll.do");
		// selectAll,searchList
		List<QnaVO> vos = service.selectAll();
		log.info("vos.size():{}", vos.size());
		return vos;
	}// end qna_json_selectAll
	
	@RequestMapping(value = "/qna_json_selectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public QnaVO qna_json_selectOne(QnaVO vo) {
		log.info("/qna_json_selectOne.do");
		log.info("{}", vo);

		// selectOne
		QnaVO vo2 = service.selectOne(vo);
		log.info("{}", vo2);

		return vo2;
	}//end qna_json_selectOne
	
}
