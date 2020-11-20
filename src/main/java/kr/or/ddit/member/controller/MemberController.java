package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.model.PageVO;
import kr.or.ddit.member.service.MemberServiceI;


@RequestMapping(path = "/member")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="memberService")
	private MemberServiceI memberservice;
	
	
	// 아이디 중복 체크
	@RequestMapping(path = "/idcheck")
	public String idcheck(String userid, Model model){
		
		MemberVO dbmembervo = memberservice.getMember(userid);
		
		if(dbmembervo != null && dbmembervo.getUserid().equals(userid)) {
			model.addAttribute("id", "no");
			
		}else {
			model.addAttribute("id", "yes");
		}
//		ra.addAttribute("userid", userid);
		return "jsonView";
	}
	
	
	
	
	// 멤버 리스트
	@RequestMapping(path = "/memberlist")
	public String getmemberlist(PageVO pageVo, Model model){
		
		int curpage = pageVo.getPage() == 0? 1 :pageVo.getPage(); //처음 페이지는 무조건 1페이지가 나올수있게 만들었다.
		int curpageSize = pageVo.getPageSize() == 0? 5 :pageVo.getPageSize(); //처음 페이지는 무조건 1페이지가 나올수있게 만들었다.
		
		 // pagesize == null? 7 :Integer.parseInt(pagesize); //처음에는 무조건 5개씩 나오게 만들었다.
		
		model.addAttribute("page", curpage);//현재 페이지 번호

		
		PageVO pagevo = new PageVO();
		pagevo.setPage(curpage);
		pagevo.setPageSize(curpageSize);
		
		Map<String , Object> maps = memberservice.selectMemberPageList(pagevo);
		model.addAttribute("memberList", maps.get("memberList")); //페이지에 따른 멤버리스트
		model.addAttribute("pages", maps.get("pages")); // 총 페이지수
		model.addAttribute("pageSize", curpageSize); 
		
		logger.debug("memberList : {} , pages : {}", maps.get("memberList"), maps.get("pages"));
		
		return "member/memberlist";
	}
	
	// 멤버 등록 페이지
	@RequestMapping(path = "/memberRegistview")
	public String memberRegistview(String userid, Model model){
		
		model.addAttribute("userid", userid);
		
		return "member/memberRegist";
	}
	
	// 멤버 등록
	@RequestMapping(path = "/memberinsert", method = {RequestMethod.POST})
	public String memberRegist(MemberVO memberVo, @RequestPart("realFilename")MultipartFile file ) throws IllegalStateException, IOException{
		logger.debug("insert 진입해슈");
		
		String filepath ="";
		if(file.getSize()>0) {
			String filename = UUID.randomUUID().toString();
			String extension = (file.getOriginalFilename()).split("\\.")[1];
			filepath = "E:\\profile\\" + filename +"."+ extension;
			File uploadFile = new File(filepath);
			file.transferTo(uploadFile);
			
			memberVo.setRealfilename(file.getOriginalFilename());
			memberVo.setFilename(filepath);
		}
		int insertCnt = 0;
		try {
			logger.debug("memberVo: {}", memberVo);
			insertCnt = memberservice.inserMember(memberVo);
			logger.debug("insertCnt : {}",insertCnt);
			
			
			if(insertCnt >0) { // 1건이 입력되었을때 : 정상
				
				// 서버의 상태가 바뀔경우 새로고침시 오류가 발생하므로 redirect를 써주어야한다.-> 사용자페이지 조회요청
				return "redirect:/member/memberlist";
			}
			
		}catch(Exception e) {
			
		}		
		
		
		return "member/memberRegistview";
	}
	
	
	// 멤버 상세정보
	@RequestMapping(path = "/memberDetail")
	public String getmemberDetail(String userid, Model model){
		
		MemberVO membervo = memberservice.getMember(userid);
		model.addAttribute("memberVo", membervo);
		
		return "member/memberDetail";
	}
	
	
	
	
	// 멤버 정보 수정버튼
	@RequestMapping(path ="/memberupdateview", method = {RequestMethod.GET})
	public String memberUpdateget(String userid, Model model) {
		
		MemberVO memberVo = memberservice.getMember(userid);		
		model.addAttribute("memberVo", memberVo);

		return "member/memberupdate";
	}
	
	
	
	// 멤버 업데이트
	@RequestMapping(path = "/memberupdate", method = {RequestMethod.POST})
	public String memberUpdate(MemberVO memberVo, @RequestPart("realFilename")MultipartFile file
									,RedirectAttributes ra) throws IllegalStateException, IOException{
		logger.debug("update 진입해슈");
		
		String filepath ="";
		if(file.getSize()>0) {
			String filename = UUID.randomUUID().toString();
			String extension = (file.getOriginalFilename()).split("\\.")[1];
			filepath = "E:\\profile\\" + filename +"."+ extension;
			File uploadFile = new File(filepath);
			file.transferTo(uploadFile);
			
			memberVo.setRealfilename(file.getOriginalFilename());
			memberVo.setFilename(filepath);
		}
		int updateCnt = memberservice.updateMember(memberVo);	
		
		if(updateCnt>0) {	
			ra.addAttribute("userid", memberVo.getUserid());
			return "redirect:/member/memberDetail";
		}else {
			return "redirect:/member/memberlist";
		}
	}
	
	
	// 검색
	@RequestMapping("/search")
	public String searchmemberlist(String searchType , String content, PageVO pageVo, Model model) {
		
		
		int curpage = pageVo.getPage() == 0? 1 :pageVo.getPage(); //처음 페이지는 무조건 1페이지가 나올수있게 만들었다.
		int curpageSize = pageVo.getPageSize() == 0? 5 :pageVo.getPageSize(); //처음 페이지는 무조건 1페이지가 나올수있게 만들었다.
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("searchType", searchType);
		map.put("content", content);
		map.put("pageSize", String.valueOf(curpageSize));		
		map.put("page", String.valueOf(curpage));		
		
		
		Map<String, Object> maps = memberservice.seachmemlist(map);
		System.out.println("총페이지수 : ㄴ" + maps.get("pages"));
		
		
		model.addAttribute("memberList", maps.get("seachememlist")); //페이지에 따른 멤버리스트
		model.addAttribute("pages", maps.get("pages")); //총 페이지수
		model.addAttribute("page", curpage); // 현재 페이지
		model.addAttribute("pageSize", curpageSize); 
		model.addAttribute("searchType", searchType); 
		model.addAttribute("content", content); 

		
		
		return "member/membersearchlist";
	}
	
	
	
	// 멤버 삭제 버튼
	@RequestMapping(path ="/memberdelete", method = {RequestMethod.GET})
	public String memberdelete(String userid, Model model) {
		
		int delCnt = memberservice.deleteMember(userid);		
		
		if(delCnt >0) {
			return "redirect:/member/memberlist";
			
		}else {			
			return "redirect:/member/memberDetail?userid="+userid;
		}
	}
	
	
	
	// 이미지 다운로드
	@RequestMapping("/profileDownload")
	public String profileDownloadView(String userid , Model model) throws IOException{
		
		MemberVO membervo = memberservice.getMember(userid);
		
		model.addAttribute("filepath", membervo.getFilename());		
		model.addAttribute("realfilename", membervo.getRealfilename());

		return "profileDownloadView";
	}
	
	// 이미지 출력
	@RequestMapping("/profileImg")
	public String profileImgView(String userid, Model model) throws IOException {
		
		// 응답으로 생성하려고 하는 것 : 이미지 파일을 읽어서 output stream 객체에 쓰는 것
		 
		MemberVO memberVo = memberservice.getMember(userid);
		
		model.addAttribute("filepath", memberVo.getFilename());
		
		return "profileImgView";
	}
	
	
	
	
	
	
}
