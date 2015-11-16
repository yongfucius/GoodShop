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

import goodshoplist.model.rfcOpenApi;
import goodshoplist.model.list;

@Controller
public class GoodShopListController {
	
	@RequestMapping("goodshoplist.do")
	public String list(String[] induty, HttpSession session, Model model) throws MalformedURLException{
		rfcOpenApi rfc = (rfcOpenApi) session.getAttribute("all");
		
		if(rfc == null){
			JAXBContext jc = null;
			Unmarshaller unmrsllr = null;
			rfc = new rfcOpenApi();
			try {
				jc = JAXBContext.newInstance(rfcOpenApi.class);
				unmrsllr = jc.createUnmarshaller();
				
				rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
						+ "&pageSize=1"
						+ "&startPage=1"));
				rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
						+ "&pageSize="+rfc.getBody().getTotalCount()));
				session.setAttribute("all", rfc);
			} catch (JAXBException e) {
				e.printStackTrace();
			}
		}
		
		List<list> list = rfc.getBody().getData().getList(); 
		List<list> result = new ArrayList<list>();
		for (list dto : list) {
			if(find(induty, dto.getInduty())) result.add(dto);
		}
		
		model.addAttribute("list", result);
		
		return "goodshoplist";
	}
	
	private boolean find(String[] induty, String textContent) {
		for (int i = 0; i < induty.length; i++) {
			if (induty[i].equals(textContent))
				return true;
		}
		return false;
	}

}
