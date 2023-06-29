package test.com.idle.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.QnaDAO;
import test.com.idle.vo.QnaVO;

@Slf4j
@Repository
public class QnaDAOimpl implements QnaDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public QnaDAOimpl() {
		log.info("QnaDAOimpl...");
	}

	@Override
	public int qInsert(QnaVO vo) {
		log.info("qInsert...{}", vo);
		return sqlSession.insert("Q_INSERT", vo);
	}

	@Override
	public int qUpdate(QnaVO vo) {
		log.info("qUpdate...{}", vo);
		return sqlSession.update("Q_UPDATE", vo);
	}

	@Override
	public int qDelete(QnaVO vo) {
		log.info("qDelete...{}", vo);
		return sqlSession.delete("Q_DELETE", vo);
	}

	@Override
	public QnaVO qSelectOne(QnaVO vo) {
		log.info("qSelectOne...{}", vo);
		return sqlSession.selectOne("Q_SELECT_ONE", vo);
	}

	@Override
	public List<QnaVO> qSelectAll(QnaVO vo) {
		log.info("qSelectAll...{}", vo);
		return sqlSession.selectList("Q_SELECT_ALL", vo);
	}

	@Override
	public List<QnaVO> page(int page, int limit) {
		log.info("page...page:{}, limit:{}", page, limit);
		//수정해야함.
		return null;
	}

}
