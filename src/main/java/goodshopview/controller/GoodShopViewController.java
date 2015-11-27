package goodshopview.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import find.service.FindService;
import goodshoplist.controller.GoodShopListController;
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
	public String view(HttpSession session, @RequestParam(defaultValue="1") int itemlistPage, 
			@RequestParam(required=false) String[] induty, String dataSid, Model model) 
					throws MalformedURLException, UnsupportedEncodingException {
		JAXBContext jc = null;
		Unmarshaller unmrsllr = null;
		rfcOpenApi rfc = null;
		try {
			jc = JAXBContext.newInstance(rfcOpenApi.class);
			unmrsllr = jc.createUnmarshaller();

			rfc = (rfcOpenApi) unmrsllr.unmarshal(
					new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopView?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
							+ "&dataSid=" + dataSid));
			List<list> temp = rfc.getBody().getData().getList();
			for(list iter : temp){
				String str = iter.getAppnPrdlstPc();
				str = str.replaceAll("0원 , ", "0원<br>").replaceAll("0원, ", "0원<br>").replaceAll("0원,", "0원<br>").replaceAll("0원 ", "0원<br>")
						.replaceAll("\\), ", ")<br>").replaceAll("\\),", ")<br>");
				iter.setAppnPrdlstPc(str);
			}
			rfc.getBody().getData().setList(temp);
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		String id = (String) session.getAttribute("memId");// 로그인 되어있는 아이디값 받아오기
		List<String> dataSidList = service.selectsid(id);// 아이디값에 저장된 즐겨찾기 메뉴
															// 가져오기
		List<list> list = rfc.getBody().getData().getList();
		list result = list.get(0);
		model.addAttribute("result", result);
		model.addAttribute("dataSidList", dataSidList);

		String resInduty = result.getInduty();
		rfcOpenApi all = GoodShopListController.loadAndSave(session);

		List<list> list2 = all.getBody().getData().getList(); 
		List<list> result2 = new ArrayList<list>();
		for (list dto : list2) {
			if(find(resInduty, dto.getInduty())) result2.add(dto);
		}
		
		int end = result2.size();
		
		model.addAttribute("list", result2);
		model.addAttribute("end", end);
		model.addAttribute("itemlistPage", itemlistPage);
		model.addAttribute("induty", induty);
		
		return "goodshopview";
	}
	
	private boolean find(String induty, String textContent) {
		if (induty.equals(textContent)) {
			return true;
		}
		return false;
	}

}
