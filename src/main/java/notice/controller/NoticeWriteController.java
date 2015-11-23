package notice.controller;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@ModelAttribute("categories")
	public String[] makeCategories(){
		return new String[]{"공지", "일반"};
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String write(HttpSession session, int pageNum, @RequestParam(defaultValue="0") int num, Model model){
		if(session.getAttribute("memId") == null || session.getAttribute("memName") == null) 
			return "redirect:noticelist.do";
		
		NoticeCommand notice = null;
		if(num == 0){
			notice = new NoticeCommand();
			notice.setId((String) session.getAttribute("memId"));
			notice.setWriter((String) session.getAttribute("memName"));
			notice.setNum(num);
		}
		else{
			notice = service.getNotice(num);
			notice.setContent(notice.getContent().replaceAll("'","`"));
			model.addAttribute("update", 1);
		}
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		return "noticewriteForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@RequestParam(defaultValue="0")int update, int pageNum, HttpServletRequest request, NoticeCommand notice){
		notice.setIp(getLocalServerIp(request));
		notice.setContent(notice.getContent().replaceAll("'","`"));
		if(update == 0) service.insert(notice);
		else service.update(notice);
		
		return "redirect:noticelist.do?pageNum="+pageNum;
	}

	private String getLocalServerIp(HttpServletRequest request){
		try{
		    for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();){
		        NetworkInterface intf = en.nextElement();
		        for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();){
		            InetAddress inetAddress = enumIpAddr.nextElement();
		            if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress()){
		            	return inetAddress.getHostAddress().toString();
		            }
		        }
		    }
		}
		catch (SocketException ex) {}
		return null;
	}
}
