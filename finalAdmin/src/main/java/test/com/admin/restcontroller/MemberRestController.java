package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.MemberService;
import test.com.admin.vo.MemberVO;

@Controller
@Slf4j
public class MemberRestController {
	
	@Autowired
	private MemberService service;
	
	@ResponseBody
	@RequestMapping(value = {"/jsonMemberSelectAll.do"}, method = RequestMethod.GET)
	public List<MemberVO> jsonMemberSelectAll() {
		log.info("/jsonMemberSelectAll.do");
		
		List<MemberVO> vos = service.memberSelectAll();
		log.info("vos size:{}", vos.size());
		return vos;
	}
	
}
