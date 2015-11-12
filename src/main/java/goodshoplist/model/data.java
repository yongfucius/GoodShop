package goodshoplist.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class data {
	private List<list> list = new ArrayList<list>();

	@XmlElement
	public List<list> getList() {
		return list;
	}

	public void setList(List<list> list) {
		this.list = list;
	}
}
