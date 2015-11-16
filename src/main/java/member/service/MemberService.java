package member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberCommand;

@Component
public class MemberService {
	
	@Autowired
	SqlSession sql;

	public void setSql(SqlSession sql) {
		this.sql = sql;
	}
	
	public int signIn(String id, String pwd){
		int x = -1;
		try{
			MemberCommand member = sql.selectOne("member.selectMember", id);
			if(member.getPwd().equals(pwd)) return x = 1;
			else return x = 0;
		}catch(NullPointerException e){
			return x;
		}
	}
	
	public int signUp(MemberCommand command){
		int x = sql.insert("member.signUpMember", command);
		
		return x;
	}
	
	public int checkId(String id){
		int x = sql.selectOne("member.checkId", id);
		return x;
	}
	public int checkName(String name){
		int x = sql.selectOne("member.checkName", name);
		return x;
	}
}
