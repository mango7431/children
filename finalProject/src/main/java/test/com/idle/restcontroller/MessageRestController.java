package test.com.idle.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MessageService;
import test.com.idle.vo.MessageVO;

@Controller
@Slf4j
public class MessageRestController {
	
	@Autowired
	MessageService service;
	
	@ResponseBody
	@RequestMapping(value = "/json_message_selectAll.do", method = RequestMethod.GET)
	public List<MessageVO> json_message_selectAll(MessageVO vo) {
		log.info("message : {}",vo);
		
		List<MessageVO> vos = service.selectAll(vo);
		
		return vos;
	}

}