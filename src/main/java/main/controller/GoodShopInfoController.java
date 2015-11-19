package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoodShopInfoController {
	
	@RequestMapping("goodshopinfo.do")
	public String info(){
		
		return "goodshopinfo";
	}
}
