package goodshoplist.model;

import java.util.ArrayList;
import java.util.Collection;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class data {
	public data(){
		lists = new ArrayList<list>();
	}
	
	private Collection<list> lists;
	
	@XmlElement
	public Collection<list> getLists() {
		return lists;
	}
	public void setLists(Collection<list> lists) {
		this.lists = lists;
	}
}
