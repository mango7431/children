package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.RoomService;
import test.com.idle.vo.RoomVO;

@Controller
@Slf4j
public class RoomRestController {
	
	@Autowired
	RoomService service;
	
	@RequestMapping(value = "/jsonChatInsert.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonChatInsert(RoomVO vo) {
		log.info("/jsonChatInsert.do...{}",vo);
		
		int result = 0;
		
		RoomVO vo2 = service.roomCheck(vo);
		log.info("{}",vo2);
		
		if(vo2!=null) {
			result = 1;
			return result;
		}
		
		result = service.insert(vo);
		log.info("{}",result);
		
		return result;
	}
}