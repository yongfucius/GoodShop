package goodshopview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import goodshoplist.model.GoodShopListDao;

@Controller
public class GoodShopViewController {
	@RequestMapping("goodshopview.do")
	public String view(String dataSid) {
		
		
		
		return "goodshopview";
	}
}