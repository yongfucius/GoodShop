package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Email;
import member.model.MemberCommand;
import member.service.EmailSender;
import member.service.MemberService;

@Controller
public class LostIdPwdController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="lostId.do", method=RequestMethod.GET)
	public String lostId(){
		
		return "member/lostId";
	}
	@RequestMapping(value="lostId.do", method=RequestMethod.POST)
	public String sendIdEmail(String lostId_email, Model model) throws Exception{
		int count = service.checkEmail(lostId_email);
		if(count == 1){
			Email email = new Email();
			email.setContent("아이디는 \n\n"+service.getIdByEmail(lostId_email)+"\n\n입니다. ");
			email.setReceiver(lostId_email);
			email.setSubject("제주 착한가격업소 아이디 찾기 메일입니다. ");
			emailSender.SendEmail(email);
			
			return "member/sendedEmail";
		}
		else{
			model.addAttribute("noEmail", true);
			return "member/lostId";
		}
	}
	
	@RequestMapping(value="lostPwd.do", method=RequestMethod.GET)
	public String lostPwd(){
		
		return "member/lostPwd";
	}
	@RequestMapping(value="lostPwd.do", method=RequestMethod.POST)
	public String sendPwdEmail(String lostPwd_id, String lostPwd_email, Model model) throws Exception{
		MemberCommand member = service.getMember(lostPwd_id);
		if(member != null){
			if(member.getEmail().equals(lostPwd_email)){
				Email email = new Email();
				email.setContent(lostPwd_id+"님의 비밀번호는 \n\n"+service.getPwdById(lostPwd_id)+"\n\n입니다. ");
				email.setReceiver(lostPwd_email);
				email.setSubject("제주 착한가격업소 비밀번호 찾기 메일입니다. ");
				emailSender.SendEmail(email);
				
				return "member/sendedEmail";
			}else{
				model.addAttribute("lostPwd_id", lostPwd_id);
				model.addAttribute("noEmail", true);
				return "member/lostPwd";
			}
		}
		else{
			model.addAttribute("noId", true);
			return "member/lostPwd";
		}
	}
}
