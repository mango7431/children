package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BlackVO;
import test.com.idle.vo.BoardVO;

public interface BoardDAO {

	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type);

	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type);

	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type);
	
	public int blackInsert(BlackVO vo);
	
	//영웅님
	BoardVO selectOne(BoardVO vo);

	int viewCountUp(BoardVO vo);

}
