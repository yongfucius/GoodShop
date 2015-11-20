package member.controller;


import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindMemberController {

	@RequestMapping("findId.do")
	public String finId(String email) {
		
		return "";
	}
	
	@RequestMapping("findPwd.do")
	public String findPwd() {
		
		return "";
	}
}
