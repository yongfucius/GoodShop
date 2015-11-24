package notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import notice.model.NoticeCommand;

@Component
public class NoticeService {
	@Autowired
	private SqlSession sql;

	public void setSqlSession(SqlSession session) {
		this.sql = session;
	}
	
	public int getNoticeCount(){
		int count = sql.selectOne("notice.count");
		
		return count;
	}
	
	public List<NoticeCommand> getImportant(){
		List<NoticeCommand> important = sql.selectList("notice.important");
		
		return important;
	}
	
	public List<NoticeCommand> getNoticeList(int startRow, int endRow){
		Map<String, Integer> bound = new HashMap<String, Integer>();
		bound.put("startRow", startRow);
		bound.put("endRow", endRow);
		List<NoticeCommand> list = sql.selectList("notice.list", bound);
		
		return list;
	}
	
	public int updateReadcount(int num){
		int x = sql.update("notice.readcountUp", num);
		
		return x;
	}
	
	public NoticeCommand getNotice(int num){
		NoticeCommand notice = sql.selectOne("notice.select", num);
		
		return notice;
	}
	
	public int insert(NoticeCommand notice){
		int num = 0;
		try{
			num = sql.selectOne("notice.selectNum");
		}catch(NullPointerException e){
		}finally{
			num++;
		}
		notice.setNum(num);
		int x = sql.insert("notice.insert", notice);
		
		return x;
	}
	
	public int delete(int num){
		int x = sql.delete("notice.delete", num);
		
		return x;
	}
	
	public int update(NoticeCommand notice){
		int x = sql.update("notice.update", notice);
		
		return x;
	}
}
