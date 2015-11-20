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
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	public int getNoticeCount(){
		int count = session.selectOne("notice.count");
		
		return count;
	}
	
	public List<NoticeCommand> getNoticeList(int start, int end){
		Map<String, Integer> bound = new HashMap<String, Integer>();
		bound.put("startRow", start);
		bound.put("endRow", end);
		List<NoticeCommand> list = session.selectList("notice.list", bound);
		
		return list;
	}
	
//	public int updateReadcount(int num){
//		int x = session.update("board.readcountUp", num);
//		return x;
//	}
//	
//	public NoticeCommand getArticle(int num){
//		NoticeCommand article = session.selectOne("board.select", num);
//		return article;
//	}
	
	public int insert(NoticeCommand notice){
		int num = 0;
		try{
			num = session.selectOne("notice.selectNum");
		}catch(NullPointerException e){
		}finally{
			num++;
		}
		notice.setNum(num);
		int x = session.insert("notice.insert", notice);
		
		return x;
	}
	
//	public int delete(int num, String passwd){
//		int x = -1;
//		String dbPasswd = "";
//		try {
//			dbPasswd = session.selectOne("board.selectPasswd", num);
//		} catch (NullPointerException e) {
//			return x;
//		}
//		if(dbPasswd.equals(passwd)) x = session.delete("board.delete", num);
//		else x = 0;
//		return x;
//	}
//	
//	public int update(NoticeCommand command){
//		int x = session.update("board.update", command);
//		return x;
//	}
}
