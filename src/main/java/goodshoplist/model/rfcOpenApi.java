package goodshoplist.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class rfcOpenApi {
	private body body;
	
	@XmlElement
	public body getBody() {
		return body;
	}

	public void setBody(body body) {
		this.body = body;
	}
}
