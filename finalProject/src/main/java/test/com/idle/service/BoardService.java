package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public List<BoardVO> selectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.selectAll(category, minPrice, maxPrice, board_type);
	}

	public List<BoardVO> selectAll(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.selectAll(minPrice, maxPrice, board_type);
	}

	public List<BoardVO> selectAllViews(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.selectAllViews(minPrice, maxPrice, board_type);
	}

}
