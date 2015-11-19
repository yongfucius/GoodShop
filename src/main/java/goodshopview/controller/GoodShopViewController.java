package goodshopview.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import find.service.FindService;
import goodshoplist.model.list;
import goodshoplist.model.rfcOpenApi;


@Controller
public class GoodShopViewController {
	@Autowired
	private FindService service;

	public void setService(FindService service) {
		this.service = service;
	}
	@RequestMapping("goodshopview.do")
	public String view(HttpSession session, String dataSid, Model model) throws MalformedURLException{
		JAXBContext jc = null;
		Unmarshaller unmrsllr = null;
		rfcOpenApi rfc = null;
		try {
			jc = JAXBContext.newInstance(rfcOpenApi.class);
			unmrsllr = jc.createUnmarshaller();

			rfc = (rfcOpenApi) unmrsllr.unmarshal(new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopView?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
					+ "&dataSid="+dataSid));
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		String id = (String)session.getAttribute("memId");//로그인 되어있는 아이디값 받아오기
		List<String> dataSidList = service.selectsid(id);//아이디값에 저장된 즐겨찾기 메뉴 가져오기		
		List<list> list = rfc.getBody().getData().getList(); 
		list result = list.get(0);
		model.addAttribute("result", result);
		model.addAttribute("dataSidList",dataSidList);
		System.out.println(dataSidList);
		
		return "goodshopview";
	}
	

}
