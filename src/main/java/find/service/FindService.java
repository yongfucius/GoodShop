package find.service;

import java.util.List;

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
}
