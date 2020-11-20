package kr.or.ddit.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.model.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping(path = "/login")
@Controller
public class LoginController {
	
	@Resource(name="memberService")
	private MemberServiceI memberservice;
	
	
	@RequestMapping(path = "/view", method = {RequestMethod.GET})
	public String getView() {	
		return "login/view";
	}
	
	
	@RequestMapping(path = "/process")
	public String process(String userid, String pass, MemberVO memberVo, 
							HttpSession session, Model model){
		
		MemberVO dbmembervo = memberservice.getMember(userid);
		
		if(dbmembervo != null && memberVo.getPass().equals(dbmembervo.getPass())) {
			session.setAttribute("S_MEMBER", dbmembervo);
			
			return "member/main";
		}else {
			model.addAttribute("userid", userid);
			return "login/view";
		}
	}
	
	
}
