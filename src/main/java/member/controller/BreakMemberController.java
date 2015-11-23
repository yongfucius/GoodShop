package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.service.MemberService;

@Controller
public class BreakMemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("breakMember.do")
	public String breakMem(HttpSession session){
		service.breakMember((String) session.getAttribute("memId"));
		session.removeAttribute("check");
		session.removeAttribute("memId");
		
		return "breakMember";
	}
}
