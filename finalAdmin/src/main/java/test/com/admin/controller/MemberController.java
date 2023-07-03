package test.com.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@RequestMapping(value = {"/memberSelectAll.do"}, method = RequestMethod.GET)
	public String home(Model model) {

		return "member/selectAll";
	}
	
}
