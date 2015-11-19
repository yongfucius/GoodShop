package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import notice.model.NoticeCommand;
import notice.service.NoticeService;

@Controller
@RequestMapping("noticewriteForm.do")
public class NoticeWriteController {
	@Autowired
	private NoticeService service;
	
	public void setService(NoticeService service) {
		this.service = service;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(int pageNum, HttpServletRequest request, NoticeCommand notice){
		notice.setIp(request.getRemoteAddr());
		service.insert(notice);
		
		return "redirect:noticelist.do?pageNum="+pageNum;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String write(HttpSession session, int pageNum, NoticeCommand notice, Model model){
		notice.setId((String) session.getAttribute("memId"));
		notice.setWriter((String) session.getAttribute("memName"));
		
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "noticewriteForm";
	}
}
