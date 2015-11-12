package goodshoplist.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class data implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7654567942294957842L;
	
	private List<list> list = new ArrayList<list>();

	@XmlElement
	public List<list> getList() {
		return list;
	}

	public void setList(List<list> list) {
		this.list = list;
	}
}
