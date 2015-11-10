package main.controller;


import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Component;

@Component
public class Header implements ViewPreparer {

	public void execute(Request tilesContext, AttributeContext attributeContext) {
		List<String> menuList = new ArrayList<String>();
		menuList.add("info");
		menuList.add("/GoodShop/goodshoplist.do?induty=한식&induty=중식&induty=일식&induty=경양식");
		menuList.add("/GoodShop/goodshoplist.do?induty=세탁업");
		menuList.add("/GoodShop/goodshoplist.do?induty=이미용업");
		menuList.add("/GoodShop/goodshoplist.do?induty=민박업&induty=목욕업");
		menuList.add("/GoodShop/notice/list.do");
		
		attributeContext.putAttribute("menuList", new Attribute(menuList), true);
	}

}
