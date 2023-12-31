package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PageVO;

public interface BoardDAO {

	List<BoardVO> selectAll();

	List<BoardVO> selectAllPage(PageVO vo);

	int boardCount();

	BoardVO selectOne(BoardVO vo);

	int reportDown(BoardVO vo);

	int reportUp(BoardVO vo);

	int delete(BoardVO vo);

	List<BoardVO> searchList(String searchKey, String searchWord, PageVO vo);

	int boardSearchCount(String searchKey, String searchWord);

}
