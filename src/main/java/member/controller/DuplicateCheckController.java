package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.service.MemberService;

@Controller
public class DuplicateCheckController {
	
	@Autowired
	MemberService service;

	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping("duplicateId.do")
	public String duplicateCheckId(String id, Model model){
		int count = service.checkId(id);
		
		model.addAttribute("dup", count);
		return "dup";
	}
	@RequestMapping("duplicateName.do")
	public String duplicateCheckName(String name, Model model){
		int count = service.checkName(name);
		
		model.addAttribute("dup", count);
		return "dup";
	}
}
