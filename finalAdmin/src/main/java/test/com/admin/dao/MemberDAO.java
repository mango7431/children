package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberSelectAll();

	public MemberVO memberSelectOne(MemberVO vo); 
	
	public int memberDelete(MemberVO vo);
	
	public List<MemberVO> memberSearchList(String searchKey, String searchWord);
	
	
}
