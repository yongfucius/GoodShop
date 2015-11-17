package member.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class dupList {
	private List<String> dup = new ArrayList<String>();
	
	@XmlElement
	public List<String> getDup() {
		return dup;
	}

	public void setDup(List<String> dup) {
		this.dup = dup;
	}
}
