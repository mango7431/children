package test.com.idle.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.MessageDAO;
import test.com.idle.vo.MessageVO;

@Repository
@Slf4j
public class MessageDAOimpl implements MessageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public MessageDAOimpl() {
		log.info("MessageDAOimpl()...");
	}

	@Override
	public int insert(MessageVO vo) {
		log.info("insert()...{}",vo);
		int flag = sqlSession.insert("MESSAGE_INSERT",vo);
		return flag;
	}

	@Override
	public List<MessageVO> selectAll(MessageVO vo) {
		log.info("selectAll()...{}",vo);
		List<MessageVO> vos = sqlSession.selectList("MESSAGE_SELECT_ALL",vo);
		log.info("{}",vos);
		return vos;
	}

	@Override
	public MessageVO selectSavename(MessageVO vo) {
		log.info("selectSavename()...{}",vo);
		
		MessageVO vo2 = sqlSession.selectOne("MESSAGE_SELECT_SAVENAME",vo);
		
		return vo2;
	}

}
