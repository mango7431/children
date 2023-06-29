package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.QnaVO;

public interface QnaDAO {
	public int qInsert(QnaVO vo);
	
	public int qUpdate(QnaVO vo);
	
	public int qDelete(QnaVO vo);
	
	public QnaVO qSelectOne(QnaVO vo);
	
	public List<QnaVO> qSelectAll(QnaVO vo);
	
	public List<QnaVO> page(int page, int limit);
}
