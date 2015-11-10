package main.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

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
		Map<String, Integer> map = new HashMap<String, Integer>();
		for( int idx=0; idx<all.getLength(); idx++ ){
			NodeList shop = all.item(idx).getChildNodes();
			String induty = shop.item(9).getTextContent();
			if(map.containsKey(induty)) map.put(induty, map.get(induty)+1);
			else map.put(induty, 1);
        }
		model.addAttribute("test", map);
		
//		for( int idx=0; idx<all.getLength(); idx++ ){
//			NodeList shop = all.item(idx).getChildNodes();
//			String sid = shop.item(5).getTextContent();
//			String title = shop.item(6).getTextContent().trim().replaceAll(" ", "");
//			if(title.contains("?")) title = title.replace("?", "");
//			map.put(title, sid);
//        }
//		
//		File images = new File("d://Programming//JAVA//프로젝트 자료//images");
//		File[] folders = images.listFiles();
//		
//		String[] titles = map.keySet().toArray(new String[map.size()]);
//		for (int i = 0; i < folders.length; i++) {
//			File temp = folders[i];
//			for (int j = 0; j < titles.length; j++) {
//				String reName = titles[j];
//				if(temp.getName().equals(reName)) temp.renameTo(new File(temp.getParent(), map.get(reName)));
//			}
//		}
//		
//		folders = images.listFiles();
//		for (int k = 0; k < folders.length; k++) {
//			File[] fileList = folders[k].listFiles();
//			for (int l = 0; l < fileList.length; l++) {
//				File temp = fileList[l];
//				String tempName = temp.getName();
//				fileList[l].renameTo(new File(temp.getParent(), folders[k].getName()+"_"+tempName.substring(tempName.length()-6, tempName.length()-4)+".png"));
//			}
//		}
//		model.addAttribute("test", images.listFiles());
//		System.out.println(model.asMap().keySet());
		
		return "test";
	}
}
