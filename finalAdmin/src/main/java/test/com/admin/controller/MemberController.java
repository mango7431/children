package test.com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.MemberService;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = {"/memberSelectAll.do"}, method = RequestMethod.GET)
	public String memberSelectAll() {
		log.info("/memberSelectAll.do");
		return "member/selectAll";
	}
	
	@RequestMapping(value = {"/memberSelectOne.do"}, method = RequestMethod.GET)
	public String memberSelectOne() {
		log.info("/memberSelectOne.do");
		return "member/selectOne";
	}
	
}
