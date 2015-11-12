package goodshopview.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import goodshoplist.model.list;
import goodshoplist.model.rfcOpenApi;

@Controller
public class GoodShopViewController {
	
	@RequestMapping("goodshopview.do")
	public String view(String dataSid, Model model) throws MalformedURLException{
		JAXBContext jc = null;
		Unmarshaller unmrsllr = null;
		rfcOpenApi rfc = null;
		System.out.println(dataSid);
		try {
			jc = JAXBContext.newInstance(rfcOpenApi.class);
			unmrsllr = jc.createUnmarshaller();

			rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopView?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
					+ "&dataSid="+dataSid));
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		
		System.out.println(rfc.getBody().getTotalCount());
		List<list> list = rfc.getBody().getData().getList(); 
		list result = list.get(0);
		model.addAttribute("result", result);

		System.out.println(result);

		return "goodshopview";
	}

	private boolean find(String dataSid, String textContent) {
		if(dataSid.equals(textContent)) {
			return true;
		}
		return false;
	}
}
