package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.QnaDAO;
import test.com.idle.vo.QnaVO;

@Slf4j
@Service
public class QnaService {
	
	@Autowired
	QnaDAO dao;
	
	public QnaService() {
		log.info("QnaService...");
	}
	
	public int qInsert(QnaVO vo) {
		return dao.qInsert(vo);
	}
	
	public int qUpdate(QnaVO vo) {
		return dao.qUpdate(vo);
	}
	
	public int qDelete(QnaVO vo) {
		return dao.qDelete(vo);
	}
	
	public QnaVO qSelectOne(QnaVO vo) {
		return dao.qSelectOne(vo);
	}
	
	public List<QnaVO> qSelectAll(QnaVO vo) {
		return dao.qSelectAll(vo);
	}
	
	public List<QnaVO> page(int page, int limit){
		return dao.page(page, limit);
	}
}
