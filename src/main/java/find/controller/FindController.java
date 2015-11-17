package find.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

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
	public String find(String id, Model model) throws MalformedURLException {
		JAXBContext jc = null;
		Unmarshaller unmrsllr = null;
		rfcOpenApi rfc = null;
		id = "admin";
		List<String> dataSidList = service.selectsid(id);//id 값으로 datasid값 list로 받아
		System.out.println(dataSidList);
		
		List<list> result = new ArrayList<list>();
		try {
			jc = JAXBContext.newInstance(rfcOpenApi.class);
			unmrsllr = jc.createUnmarshaller();
			for(String dataSid : dataSidList){
				rfc = (rfcOpenApi) unmrsllr.unmarshal(
						new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopView?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
								+ "&dataSid=" + dataSid));// api에서 불러오는것
				result.add(rfc.getBody().getData().getList().get(0));
			}
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		model.addAttribute("list", result);

		System.out.println(result);

		return "find";
	}
}
