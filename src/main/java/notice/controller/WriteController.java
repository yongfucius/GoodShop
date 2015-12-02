package notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import notice.model.NoticeCommand;
import notice.service.NoticeService;

@Controller
@RequestMapping("/notice/writeForm.do")
public class WriteController {
	@Autowired
	private NoticeService service;

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String insert(int pageNum, HttpServletRequest request, NoticeCommand command){
		service.insert(command, request);
		return "redirect:list.do?pageNum="+pageNum;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String write(NoticeCommand command, int pageNum, Model model){
		model.addAttribute("command", command);
		model.addAttribute("pageNum", pageNum);
		return "notice/writeForm";
	}
}
