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
	public List<BoardVO> selectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type) {
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
	public List<BoardVO> selectAll(Integer minPrice, Integer maxPrice, Integer board_type) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL",filters);
		
		return vos;
	}

	@Override
	public List<BoardVO> selectAllViews(Integer minPrice, Integer maxPrice, Integer board_type) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL_VIEWS",filters);
		
		return vos;
	}

}
