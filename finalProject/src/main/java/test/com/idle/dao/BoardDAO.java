package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectAll();

	BoardVO selectOne(BoardVO vo);

	int viewCountUp(BoardVO vo);

	int insert(BoardVO vo);

	int update(BoardVO vo);

	int delete(BoardVO vo);

}
