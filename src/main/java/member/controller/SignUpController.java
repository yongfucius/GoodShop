package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberCommand;
import member.service.MemberService;

@Controller
@RequestMapping("signUp.do")
public class SignUpController {
	
	@Autowired
	MemberService service;

	public void setService(MemberService service) {
		this.service = service;
	}

	@ModelAttribute("command")
	public MemberCommand makeCommand(){
		return new MemberCommand();
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String form(MemberCommand command){
		
		return "member/signUp";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String up(MemberCommand command, Model model){
		service.signUp(command);
		
		model.addAttribute("complete", true);
		return "member/signUp";
	}
}
