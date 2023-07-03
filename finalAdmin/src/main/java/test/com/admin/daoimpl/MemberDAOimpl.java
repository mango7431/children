package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.MemberDAO;
import test.com.admin.vo.MemberVO;

@Slf4j
@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberDAOimpl() {
		log.info("MemberDAOimpl...");
	}

	@Override
	public List<MemberVO> memberSelectAll() {
		log.info("memberSelectAll...");
		return sqlSession.selectList("M_SELECT_ALL");
	}

	@Override
	public MemberVO memberSelectOne(MemberVO vo) {
		return null;
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return 0;
	}

	@Override
	public List<MemberVO> memberSearchList(String searchKey, String searchWord) {
		log.info("memberSearchList...");
		log.info("searchKey: " + searchKey);
		log.info("searchWord: " + searchWord);
		
		List<MemberVO> vos = null;
		
		if (searchKey.equals("id")) {
			vos = sqlSession.selectList("M_SEARCHLIST_ID", "%" + searchWord + "%");		
		} else {
			vos = sqlSession.selectList("M_SEARCHLIST_NAME", "%" + searchWord + "%");					
		}
		return vos;
	}

}
