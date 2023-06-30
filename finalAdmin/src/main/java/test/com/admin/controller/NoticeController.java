package test.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.NoticeService;
import test.com.admin.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value = {"/n_selectAll.do"}, method = RequestMethod.GET)
	public String n_selectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/n_selectAll.do");
		log.info("cpage...{}",cpage);
		List<NoticeVO> vos = service.selectAll(cpage);
		log.info("{}",vos);
		int result = service.n_row_count();
		log.info("result...{}",Math.ceil(result/10.0));
		model.addAttribute("vos",vos);
		model.addAttribute("totalPageCount",Math.ceil(result/10.0));
		
		
		return "notice/selectAll";
	}
	
	
	
	@RequestMapping(value = {"/n_selectOne.do"}, method = RequestMethod.GET)
	public String n_selectOne(NoticeVO vo, Model model) {
		log.info("/n_selectOne.do...{}",vo);
		
		NoticeVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "notice/selectOne";
	}
	
	@RequestMapping(value = {"/n_searchList.do"}, method = RequestMethod.GET)
	public String n_searchList(Model model,String searchKey, String searchWord) {
		log.info("/n_searchList.do");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<NoticeVO> vos = service.searchList(searchKey,searchWord);
		
		model.addAttribute("vos",vos);
		
		return "notice/selectAll";
	}
	
	@RequestMapping(value = {"/n_insert.do"}, method = RequestMethod.GET)
	public String n_insert() {
		log.info("/n_insert.do");
		
		return "notice/insert";
	}
	
	@RequestMapping(value = {"/n_insertOK.do"}, method = RequestMethod.POST)
	public String n_insertOK(NoticeVO vo) {
		log.info("/n_insert.do...{}",vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result == 1) {
			return "redirect:n_selectAll.do";
		}else {
			return "redirect:n_insert.do";
		}
		
	}
	
	@RequestMapping(value = {"/n_update.do"}, method = RequestMethod.GET)
	public String n_update(NoticeVO vo, Model model) {
		log.info("/n_update.do...{}",vo);
		
		NoticeVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "notice/update";
	}
	
	@RequestMapping(value = {"/n_updateOK.do"}, method = RequestMethod.POST)
	public String n_updateOK(NoticeVO vo) {
		log.info("/n_updateOK.do...{}",vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:n_selectOne.do?notice_num="+vo.getNotice_num();
		}else {
			return "redirect:n_update.do?notice_num="+vo.getNotice_num();			
		}
	}
	
	@RequestMapping(value = {"/n_deleteOK.do"}, method = RequestMethod.GET)
	public String n_deleteOK(NoticeVO vo) {
		log.info("/n_deleteOK.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:n_selectAll.do";
		}else {
			return "redirect:n_selectOne.do?notice_num="+vo.getNotice_num();			
		}
	}
	
}
