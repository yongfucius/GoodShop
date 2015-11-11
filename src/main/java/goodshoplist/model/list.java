package goodshoplist.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class list {
	private String adres;
	private String appnPrdlstPc;
	private String area;
	private String bsnTime;
	private String dataContent;
	private String dataSid;
	private String dataTitle;
	private String hvofSttus;
	private int fileCnt;
	private String induty;
	private float posx;
	private float posy;
	private Date regDate;
	private String telNo;
	
	@XmlElement
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	@XmlElement
	public String getAppnPrdlstPc() {
		return appnPrdlstPc;
	}
	public void setAppnPrdlstPc(String appnPrdlstPc) {
		this.appnPrdlstPc = appnPrdlstPc;
	}
	@XmlElement
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@XmlElement
	public String getBsnTime() {
		return bsnTime;
	}
	public void setBsnTime(String bsnTime) {
		this.bsnTime = bsnTime;
	}
	@XmlElement
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	@XmlElement
	public String getDataSid() {
		return dataSid;
	}
	public void setDataSid(String dataSid) {
		this.dataSid = dataSid;
	}
	@XmlElement
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	@XmlElement
	public String getHvofSttus() {
		return hvofSttus;
	}
	public void setHvofSttus(String hvofSttus) {
		this.hvofSttus = hvofSttus;
	}
	@XmlElement
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	@XmlElement
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	@XmlElement
	public float getPosx() {
		return posx;
	}
	public void setPosx(float f) {
		this.posx = f;
	}
	@XmlElement
	public float getPosy() {
		return posy;
	}
	public void setPosy(float f) {
		this.posy = f;
	}
	@XmlElement
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@XmlElement
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	
}
