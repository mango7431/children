package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.NoticeDAO;
import test.com.admin.vo.NoticeVO;

@Slf4j
@Repository
public class NoticeDAOimpl implements NoticeDAO {

	@Autowired
	SqlSession sqlSession;
	
	public NoticeDAOimpl() {
		log.info("NoticeDAOimpl...");
	}

	@Override
	public int insert(NoticeVO vo) {
		log.info("insert()...{}",vo);
		return sqlSession.insert("N_INSERT",vo);
	}

	@Override
	public int update(NoticeVO vo) {
		log.info("update()...{}",vo);
		return sqlSession.update("N_UPDATE",vo);
	}

	@Override
	public int delete(NoticeVO vo) {
		log.info("delete()...{}",vo);
		return sqlSession.delete("N_DELETE",vo);
	}

	@Override
	public List<NoticeVO> selectAll() {
		log.info("selectAll()...");
		return sqlSession.selectList("N_SELECT_ALL");
	}

	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		log.info("selectOne()...{}",vo);
		return sqlSession.selectOne("N_SELECT_ONE",vo);
	}

	@Override
	public List<NoticeVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...searchKey:{}",searchKey);
		log.info("searchList()...searchWord:{}",searchWord);
		String key = "";
		if(searchKey.equals("notice_title")) {
			key = "N_SEARCH_LIST_NOTICE_TITLE";
		}else {
			key = "N_SEARCH_LIST_NOTICE_CONTENT";
		}
		return sqlSession.selectList(key,"%"+searchWord+"%");
	}

}
