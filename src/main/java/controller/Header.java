package controller;

import java.util.*;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Component;

@Component
public class Header implements ViewPreparer {

	public void execute(Request tilesContext, AttributeContext attributeContext) {
		List<String> menuList = new ArrayList<String>();
		menuList.add("착한가격업소");
		menuList.add("음식점");
		menuList.add("세탁소");
		menuList.add("미용");
		menuList.add("목욕탕");
		menuList.add("공지사항");
		attributeContext.putAttribute("menuList", new Attribute(menuList), true);
	}

}
