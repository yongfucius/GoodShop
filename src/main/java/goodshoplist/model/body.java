package goodshoplist.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class body implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -802289697389459853L;
	
	private int pageSize;
	private int startPage;
	private int totalCount;
	private data data;
	
	@XmlElement
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@XmlElement
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	@XmlElement
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@XmlElement
	public data getData() {
		return data;
	}
	public void setData(data data) {
		this.data = data;
	}
	
}
