package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.SellService;

@Controller
@Slf4j
public class SellRestController {
	
	@Autowired
	SellService service;
	
	@ResponseBody
	@RequestMapping(value = {"/jsonhideCheck.do"}, method = RequestMethod.GET)
	public String jsonhideCheck(boolean isChecked, int board_num) {
		log.info("/jsonhideCheck.do...{},{}",isChecked,board_num);
		
		service.jsonhideCheck(isChecked,board_num);
		
		return "{\"state\":"+isChecked+"}";//
	}
}
