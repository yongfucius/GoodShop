package main.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

@Controller
public class MainController {
	
	@RequestMapping("main.do")
	public String main(HttpServletResponse response, Model model) throws Exception{
		int randIdx = new Random().nextInt(140);
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D&pageSize=1"
						+ "&startPage="+randIdx);
		XPath xpath = XPathFactory.newInstance().newXPath();
		Node title = (Node)xpath.evaluate("//list/dataTitle", document, XPathConstants.NODE);
		Node contents = (Node)xpath.evaluate("//list/appnPrdlstPc", document, XPathConstants.NODE);
		Node id = (Node)xpath.evaluate("//list/dataSid", document, XPathConstants.NODE);
		
		model.addAttribute("title", title.getTextContent());
		model.addAttribute("contents", contents.getTextContent());
		model.addAttribute("id", id.getTextContent());
		return "main";
	}
}
