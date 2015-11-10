package goodshoplist.model;

import java.util.Date;

public class GoodShopListDao {
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
	
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getAppnPrdlstPc() {
		return appnPrdlstPc;
	}
	public void setAppnPrdlstPc(String appnPrdlstPc) {
		this.appnPrdlstPc = appnPrdlstPc;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBsnTime() {
		return bsnTime;
	}
	public void setBsnTime(String bsnTime) {
		this.bsnTime = bsnTime;
	}
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	public String getDataSid() {
		return dataSid;
	}
	public void setDataSid(String dataSid) {
		this.dataSid = dataSid;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	public String getHvofSttus() {
		return hvofSttus;
	}
	public void setHvofSttus(String hvofSttus) {
		this.hvofSttus = hvofSttus;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public float getPosx() {
		return posx;
	}
	public void setPosx(float f) {
		this.posx = f;
	}
	public float getPosy() {
		return posy;
	}
	public void setPosy(float f) {
		this.posy = f;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	@Override
	public String toString() {
		return "GoodShopListDao [adres=" + adres + ", appnPrdlstPc=" + appnPrdlstPc + ", area=" + area + ", bsnTime="
				+ bsnTime + ", dataContent=" + dataContent + ", dataSid=" + dataSid + ", dataTitle=" + dataTitle
				+ ", hvofSttus=" + hvofSttus + ", fileCnt=" + fileCnt + ", induty=" + induty + ", posx=" + posx
				+ ", posy=" + posy + ", regDate=" + regDate + ", telNo=" + telNo + "]";
	}
	
}
