package find.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import find.model.FindCommand;

@Component
public class FindService {
	@Autowired
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	public List<String> selectsid(String id){
		List<String> datasid = session.selectList("find.selectsid",id);
		return datasid;
	}
	
/*	public List<FindCommand> insertFind(String id, String datasid){
		Map<String, String> bound = new HashMap<String, String>();
		bound.put("id", id);
		bound.put("datasid", datasid);
		List<FindCommand> list = session.selectList("find.insertfind",bound);
		return list;		
	}
	public List<FindCommand> deleteFind(String id, String datasid){
		Map<String, String> bound = new HashMap<String, String>();
		bound.put("id", id);
		bound.put("datasid", datasid);
		List<FindCommand> list = session.selectList("find.deletefind",bound);
		return list;		
	}*/
	
}
