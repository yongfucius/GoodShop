package notice.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.NoticeCommand;
import notice.service.NoticeService;

@Controller
public class NoticeListController {
	@Autowired
	private NoticeService service;

	public void setService(NoticeService service) {
		this.service = service;
	}

	@RequestMapping("noticelist.do")
	public String list(@RequestParam(defaultValue = "1") int pageNum, Model model){
		int pageSize = 5;
		int currentPage = pageNum;
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int count = service.getNoticeCount();
		int number = count-(currentPage-1)*pageSize;
		
		List<NoticeCommand> noticeList = null;
		if(count > 0) noticeList = service.getNoticeList(startRow, endRow);
		else noticeList = Collections.emptyList();
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("number", number);
		model.addAttribute("noticeList", noticeList);
		
		return "noticelist";
	}
}
