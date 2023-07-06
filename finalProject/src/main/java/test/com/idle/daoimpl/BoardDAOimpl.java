package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BoardVO;

@Repository
@Slf4j
public class BoardDAOimpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public BoardDAOimpl() {
		log.info("BoardDAOimpl()");
	}

	@Override
	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("category", category);
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL",filters);
		
		return vos;
	}
	
	@Override
	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL",filters);
		
		return vos;
	}

	@Override
	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL_VIEWS",filters);
		
		return vos;
	}

	//영웅님
	@Override
	public BoardVO selectOne(BoardVO vo) {
		log.info("selectOne()...{}",vo);
		
		BoardVO vo2 = sqlSession.selectOne("B_SELECT_ONE", vo);
		
		return vo2;
	}

	@Override
	public int viewCountUp(BoardVO vo) {
		log.info("viewCountUp()...{}",vo);
		
		int flag = sqlSession.update("VIEW_COUNT_UP",vo);
		
		return flag;
	}
}
