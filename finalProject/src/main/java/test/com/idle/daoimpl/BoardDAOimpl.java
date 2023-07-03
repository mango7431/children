package test.com.idle.daoimpl;

import java.util.List;

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
		log.info("BoardDAOimpl()...");
	}

	@Override
	public List<BoardVO> selectAll() {
		log.info("selectAll()...");
		
		List<BoardVO> vos = sqlSession.selectList("B_SELECT_ALL");
		
		return vos;
	}

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

	@Override
	public int insert(BoardVO vo) {
		log.info("insert()...{}",vo);
		
		int flag = sqlSession.insert("B_INSERT",vo);
		
		return flag;
	}

	@Override
	public int update(BoardVO vo) {
		log.info("update()...{}",vo);
		
		int flag = sqlSession.update("B_UPDATE",vo);
		
		return flag;
	}

	@Override
	public int delete(BoardVO vo) {
		log.info("delete()...{}",vo);
		
		int flag = sqlSession.delete("B_DELETE",vo);
		
		return flag;
	}

	@Override
	public int changeStatus(BoardVO vo) {
		log.info("changeStatus()...{}",vo);
		
		int flag = sqlSession.update("BOARD_CHANGE_STATUS",vo);
		
		return flag;
	}

}
