package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BoardVO;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	
	public BoardService() {
		log.info("BoardService()...");
	}

	public List<BoardVO> selectAll() {
		return dao.selectAll();
	}

}
