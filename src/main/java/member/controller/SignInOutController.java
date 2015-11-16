package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.service.MemberService;

@Controller
public class SignInOutController {
	
	@Autowired
	private MemberService service;
	
	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping("signIn.do")
	public String signIn(HttpServletRequest request, Model model){
		String login_id = request.getParameter("login_id");
		String login_pwd = request.getParameter("login_pwd");
		int check = service.signIn(login_id, login_pwd);
		
		HttpSession session = request.getSession();
		if(check != -1) session.setAttribute("memId", login_id);
		session.setAttribute("check", check);
		
		return "redirect:"+request.getHeader("referer");
	}
	
	@RequestMapping("signOut.do")
	public String signOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("check");
		session.removeAttribute("memId");
		
		return "redirect:"+request.getHeader("referer");
	}
}
