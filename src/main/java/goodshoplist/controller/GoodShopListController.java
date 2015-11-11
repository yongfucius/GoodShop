package goodshoplist.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import goodshoplist.model.GoodShopListData;

@Controller
public class GoodShopListController {
	
	@RequestMapping("goodshoplist.do")
	public String list(String[] induty, Model model) throws SAXException, IOException, ParserConfigurationException, XPathExpressionException, DOMException, ParseException{
		DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document document = builder.parse(
				"http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D");
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList all = (NodeList)xpath.evaluate("//list", document, XPathConstants.NODESET);
		List<GoodShopListData> list = new ArrayList<GoodShopListData>();
		for( int idx=0; idx<all.getLength(); idx++ ){
			document = builder.parse("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
					+ "&pageSize=1"
					+ "&startPage="+idx);
			NodeList shop = all.item(idx).getChildNodes();
			if(find(induty, shop.item(9).getTextContent())){
				GoodShopListData goodshop = new GoodShopListData();
				goodshop.setAdres(shop.item(0).getTextContent());
				goodshop.setAppnPrdlstPc(shop.item(1).getTextContent());
				goodshop.setArea(shop.item(2).getTextContent());
				goodshop.setBsnTime(shop.item(3).getTextContent());
				goodshop.setDataContent(shop.item(4).getTextContent());
				goodshop.setDataSid(shop.item(5).getTextContent());
				goodshop.setDataTitle(shop.item(6).getTextContent());
				goodshop.setFileCnt(Integer.parseInt(shop.item(7).getTextContent()));
				goodshop.setHvofSttus(shop.item(8).getTextContent());
				goodshop.setInduty(shop.item(9).getTextContent());
				goodshop.setPosx(Float.parseFloat(shop.item(10).getTextContent()));
				goodshop.setPosy(Float.parseFloat(shop.item(11).getTextContent()));
				goodshop.setRegDate(new SimpleDateFormat("yyyy-MM-dd", java.util.Locale.KOREA).parse(shop.item(12).getTextContent()));
				goodshop.setTelNo(shop.item(13).getTextContent());
				list.add(goodshop);
				System.out.println(goodshop);
			}
		}
		
		model.addAttribute("list", list);
		return "goodshoplist";
	}

	private boolean find(String[] induty, String textContent) {
		for (int i = 0; i < induty.length; i++) {
			if(induty[i].equals(textContent)) return true;
		}
		return false;
	}
}
