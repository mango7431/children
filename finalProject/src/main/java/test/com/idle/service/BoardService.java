package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BlackVO;
import test.com.idle.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAll(category, minPrice, maxPrice, board_type);
	}

	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAll(minPrice, maxPrice, board_type);
	}

	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAllViews(minPrice, maxPrice, board_type);
	}
	
	public int blackInsert(BlackVO vo) {
		return dao.blackInsert(vo);
	}

	//영웅님
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	public int viewCountUp(BoardVO vo) {
		return dao.viewCountUp(vo);
	}

}
