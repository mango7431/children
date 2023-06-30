package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;

@Controller
@Slf4j
public class BoardRestController {
	
	@Autowired
	BoardService service;

	

}
