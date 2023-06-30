package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;

public interface BoardDAO {

	public List<BoardVO> selectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type);

	public List<BoardVO> selectAll(Integer minPrice, Integer maxPrice, Integer board_type);

	public List<BoardVO> selectAllViews(Integer minPrice, Integer maxPrice, Integer board_type);

}
