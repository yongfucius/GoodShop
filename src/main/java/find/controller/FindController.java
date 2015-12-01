package find.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import goodshoplist.model.list;
import goodshoplist.model.rfcOpenApi;
import find.service.FindService;

@Controller
public class FindController {	
	@Autowired
	private FindService service;

	public void setService(FindService service) {
		this.service = service;
	}
	
	@RequestMapping("find.do")
	public String find(HttpSession session, Model model) throws MalformedURLException {
		String id = (String)session.getAttribute("memId");
		if(id == null) return "redirect:main.do";
		List<list> result = makeResult(id);

		model.addAttribute("list", result);

		return "find";
	}
	
	@RequestMapping("findToggle.do")
	@ResponseBody
	public String toggleFind(String dataSid, String id, String mode){
		int res = 0;
		if(mode.equals("on")) res = service.insertFind(dataSid, id);
		else if(mode.equals("off")) res = service.deleteFind(dataSid, id);
		
		return ""+res;
	}
	
	@RequestMapping("findDelete.do")
	public String deleteFind(HttpSession session, String dataSid, Model model) throws MalformedURLException{
		String id = (String)session.getAttribute("memId");
		service.deleteFind(dataSid, id);
		List<list> result = makeResult(id);
		
		model.addAttribute("list", result);
		return "find";
	}
	
	private List<list> makeResult(String id) throws MalformedURLException{
		List<String> dataSidList = service.selectsid(id);//id 값으로 datasid값 list로 받아		
		List<list> result = new ArrayList<list>();
		try {
			JAXBContext jc = JAXBContext.newInstance(rfcOpenApi.class);
			Unmarshaller unmrsllr = jc.createUnmarshaller();
			
			for(String dataSid : dataSidList){
				rfcOpenApi rfc = (rfcOpenApi) unmrsllr.unmarshal(
						new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopView?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
								+ "&dataSid=" + dataSid));// api에서 불러오는것
				result.add(rfc.getBody().getData().getList().get(0));
			}
			for(list iter : result){
				String str = iter.getAppnPrdlstPc();
				str = str.replaceAll("0원 , ", "0원<br>").replaceAll("0원, ", "0원<br>").replaceAll("0원,", "0원<br>").replaceAll("0원 ", "0원<br>")
						.replaceAll("\\), ", ")<br>").replaceAll("\\),", ")<br>");
				iter.setAppnPrdlstPc(str);
			}
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
