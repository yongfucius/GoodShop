package find.model;

public class FindCommand {
	private String dataSid;
	private String id;
	
	public String getDataSid() {
		return dataSid;
	}
	public void setDataSid(String dataSid) {
		this.dataSid = dataSid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public FindCommand(String dataSid, String id) {
		this.dataSid = dataSid;
		this.id = id;
	}
}
