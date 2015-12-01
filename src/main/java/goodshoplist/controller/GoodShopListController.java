package goodshoplist.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodshoplist.model.rfcOpenApi;
import goodshoplist.model.list;

@Controller
public class GoodShopListController {
	
	@RequestMapping("goodshoplist.do")
	public String list(String[] induty, @RequestParam(defaultValue="1") int itemlistPage, HttpSession session, 
			Model model) throws MalformedURLException{
		rfcOpenApi rfc = loadAndSave(session);
		
		List<list> list = rfc.getBody().getData().getList(); 
		List<list> result = new ArrayList<list>();
		for (list dto : list) {
			if(find(induty, dto.getInduty())) result.add(dto);
		}
		
		model.addAttribute("list", result);
		model.addAttribute("induty", induty);
		model.addAttribute("itemlistPage", itemlistPage);
		model.addAttribute("itemCount", result.size());
		return "goodshoplist";
	}
	
	private boolean find(String[] induty, String textContent) {
		for (int i = 0; i < induty.length; i++) {
			if (induty[i].equals(textContent))
				return true;
		}
		return false;
	}
	
	public static rfcOpenApi loadAndSave(HttpSession session) throws MalformedURLException{
		rfcOpenApi rfc = (rfcOpenApi) session.getAttribute("all");
		
		if(rfc == null){
			rfc = new rfcOpenApi();
			try {
				JAXBContext jc = JAXBContext.newInstance(rfcOpenApi.class);
				Unmarshaller unmrsllr = jc.createUnmarshaller();
				
				rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
						+ "&pageSize=1"
						+ "&startPage=1"));
				rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
						+ "&pageSize="+rfc.getBody().getTotalCount()));
				
				List<list> temp = rfc.getBody().getData().getList();
				for(list iter : temp){
					String str = iter.getAppnPrdlstPc();
					str = str.replaceAll("0원 , ", "0원<br>").replaceAll("0원, ", "0원<br>").replaceAll("0원,", "0원<br>").replaceAll("0원 ", "0원<br>")
							.replaceAll("\\), ", ")<br>").replaceAll("\\),", ")<br>");
					iter.setAppnPrdlstPc(str);
				}
				rfc.getBody().getData().setList(temp);
				session.setAttribute("all", rfc);
			} catch (JAXBException e) {
				e.printStackTrace();
			}
		}
		return rfc;
	}

}
