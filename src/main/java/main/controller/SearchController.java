package main.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import goodshoplist.controller.GoodShopListController;
import goodshoplist.model.list;
import goodshoplist.model.rfcOpenApi;

@Controller
public class SearchController {
	
	@RequestMapping("searchtitle.do")
	@ResponseBody
	public ResponseEntity<String> searchTitle(String q) throws MalformedURLException{
		JAXBContext jc = null;
		Unmarshaller unmrsllr = null;
		rfcOpenApi rfc = new rfcOpenApi();
		String res = "";
		try {
			jc = JAXBContext.newInstance(rfcOpenApi.class);
			unmrsllr = jc.createUnmarshaller();
			URL url = new URL("http://data.jeju.go.kr/rest/goodshop/getGoodShopList?authApiKey=vJO38V6UMen%2F0VjFYeinr4CZBSl9xf9rRQw%2FJyn%2FxEvNJi0mrdkNvtw2YoWvL8T%2F%2FJ4MarOGJI5Psoamset0qg%3D%3D"
					+ "&dataTitle="+URLEncoder.encode(q, "UTF-8"));
			rfc = (rfcOpenApi) unmrsllr.unmarshal(url);
			
			if(rfc.getBody().getTotalCount() > 0){
				List<list> list = rfc.getBody().getData().getList();
				List<list> temp = null;
				try {
					temp = list.subList(0, 5);
				} catch (IndexOutOfBoundsException e) {
					temp = list.subList(0, list.size());
				}
				
				for(list iter : temp){
					res += "<li onclick=\"location.href='goodshopview.do?dataSid="+iter.getDataSid()
							+"'\">"+iter.getDataTitle().replaceAll(q, "<b>"+q+"</b>")+"</li>";
				}
			}
		} catch (JAXBException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpHeaders responseHeaders = new HttpHeaders();   
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<String>(res, responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("search.do")
	public String search(HttpSession session, String search, Model model) throws MalformedURLException{
		rfcOpenApi rfc = GoodShopListController.loadAndSave(session);
		List<list> list = rfc.getBody().getData().getList();
		List<list> res = new ArrayList<list>();
		
		for(list iter : list){
			if(iter.getDataTitle().contains(search)) res.add(iter);
		}
		for(list iter : list){
			if(iter.getInduty().contains(search)) res.add(iter);
		}
		for(list iter : list){
			if(iter.getAppnPrdlstPc().contains(search)) res.add(iter);
		}
		
		model.addAttribute("searchRes", res);
		model.addAttribute("query", search);
		return "search";
	}
}
