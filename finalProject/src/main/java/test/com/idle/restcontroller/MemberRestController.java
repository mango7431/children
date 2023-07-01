package test.com.idle.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MemberService;
import test.com.idle.vo.MemberVO;

@Controller
@Slf4j
public class MemberRestController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/json_idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> json_idCheck(MemberVO vo) {
		log.info("/json_idCheck.do");
		log.info("{}",vo);//id
		
		MemberVO vo2 = service.idCheck(vo);
		log.info("{}",vo2);//null or not null
		
		String msg="OK";
		if (vo2 != null) {
			msg="Not OK";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", msg);
		return map;
	}
	
}//end class
