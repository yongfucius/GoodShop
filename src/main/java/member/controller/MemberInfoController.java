package member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberCommand;
import member.service.MemberService;

@Controller
@RequestMapping("memberInfo.do")
public class MemberInfoController {
	
	@Autowired
	MemberService service;
	
	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String info(HttpSession session, Model model){
		if(session.getAttribute("memId") == null) return "redirect:main.do";
		model.addAttribute("member", service.getMember((String) session.getAttribute("memId")));
		return "member/memberInfo";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String update(HttpServletRequest request, Model model){
		String kind = "";
		String value = "";
		Map<String, String[]> params = request.getParameterMap();
		MemberCommand member = service.getMember((String) request.getSession().getAttribute("memId"));
		if(params.containsKey("pwd")){
			kind = "pwd";
			value = params.get(kind)[0];
			String currPwd = params.get("curr_pwd")[0];
			if(!member.getPwd().equals(currPwd)){
				model.addAttribute("pwdNotEqual", false);
				return "member/memberInfo";
			}
		}else{
			if(params.containsKey("name")) kind = "name";
			if(params.containsKey("email")) kind = "email";
			value = params.get(kind)[0];
		}
		member = service.updateMember(member.getId(), kind, value);
		
		model.addAttribute("member", member);
		model.addAttribute("complete", true);
		return "member/memberInfo";
	}
	
}
