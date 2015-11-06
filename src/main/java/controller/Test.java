package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Controller
public class Test {
	
	@RequestMapping("test.do")
	public String test(Model model) throws Exception{
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D&pageSize=140");
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList all = (NodeList)xpath.evaluate("//list", document, XPathConstants.NODESET);
		List list = new ArrayList();
		for( int idx=0; idx<all.getLength(); idx++ ){
			NodeList shop = all.item(idx).getChildNodes();
			String sid = shop.item(5).getTextContent();
			String title = shop.item(6).getTextContent();
			System.out.println(sid);
			System.out.println(title);
            list.add(sid);
            list.add(title);
        }
				
		model.addAttribute(list);
		System.out.println(model.asMap().keySet());
		return "test";
	}
}
