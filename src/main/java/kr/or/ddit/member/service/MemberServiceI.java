package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.model.PageVO;

public interface MemberServiceI {
	
	MemberVO getMember(String userId);
	
	List<MemberVO> selectAllMember();
	
	Map<String, Object> selectMemberPageList(PageVO pagevo); // vo를 만들어서 할 경우
	
	// 새로운 멤버 등록
	int inserMember(MemberVO memberVo);
	
	// 등록된 멤버 삭제
	int deleteMember(String userid);
	
	// 멤버 정보 수정
	int updateMember(MemberVO memberVo);
	
	// 검색기능
	Map<String, Object> seachmemlist(Map<String, String> map);

}
