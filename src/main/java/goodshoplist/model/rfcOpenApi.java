package goodshoplist.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class rfcOpenApi implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6111024156617190580L;
	
	private body body;
	
	@XmlElement
	public body getBody() {
		return body;
	}

	public void setBody(body body) {
		this.body = body;
	}
}
