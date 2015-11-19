package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.service.MemberService;

@Controller
public class DuplicateCheckController {
	
	@Autowired
	MemberService service;

	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping("duplicateId.do")
	@ResponseBody
	public String duplicateCheckId(String id){
		int count = service.checkId(id);
		
		return ""+count;
	}
	@RequestMapping("duplicateEmail.do")
	@ResponseBody
	public String duplicateCheckEmail(String email){
		int count = service.checkEmail(email);
		
		return ""+count;
	}
	@RequestMapping("duplicateName.do")
	@ResponseBody
	public String duplicateCheckName(String name){
		int count = service.checkName(name);
		
		return ""+count;
	}
}
