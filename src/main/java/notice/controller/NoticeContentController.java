package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import notice.model.NoticeCommand;
import notice.service.NoticeService;

@Controller
public class NoticeContentController {
	
	@Autowired
	private NoticeService service; 
	
	@RequestMapping("noticecontent.do")
	public String content(int num, int pageNum, Model model){
		service.updateReadcount(num);
		NoticeCommand notice = service.getNotice(num);
		notice.setContent(notice.getContent().replaceAll("`","'"));
		notice.setContent(notice.getContent().replaceAll("\r\n","<br>"));
		notice.setContent(notice.getContent().replaceAll("\u0020","&nbsp;"));
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("notice", notice);
		return "noticecontent";
	}
	
	@RequestMapping("noticedelete.do")
	public String delete(int pageNum, int num, Model model){
		service.delete(num);
		
		model.addAttribute("delete", 1);
		model.addAttribute("pageNum", pageNum);
		return "noticecontent";
	}
}
