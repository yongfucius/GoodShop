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
			MemberCommand member = getMember(id);
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
	public int checkEmail(String email) {
		int x = sql.selectOne("member.checkEmail", email);
		return x;
	}
	public int checkName(String name){
		int x = sql.selectOne("member.checkName", name);
		return x;
	}
	
	public MemberCommand getMember(String id){
		MemberCommand member = sql.selectOne("member.selectMember", id);
		
		return member;
	}
	
	public MemberCommand updateMember(String id, String kind, String value){
		MemberCommand member = getMember(id);
		if(kind.equals("name")) member.setName(value);
		if(kind.equals("email")) member.setEmail(value);
		if(kind.equals("pwd")) member.setPwd(value);
		sql.update("member.updateMember", member);
		
		return getMember(id);
	}
}
