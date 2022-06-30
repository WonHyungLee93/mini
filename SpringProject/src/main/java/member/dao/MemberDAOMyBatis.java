package member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MemberDAOMyBatis implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession=null;
	
	public int write(MemberDTO memberDTO) {
		
		int su = sqlSession.insert("memberSQL.write",memberDTO);
		
		return su;
	}
	
	
	public MemberDTO login(Map<String,String> map) {
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO = sqlSession.selectOne("memberSQL.login",map);
		return memberDTO;
	}// login1
	
	
	public boolean isExistId(String id) {
		boolean exist = false;
		int count;

		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId",id);
		sqlSession.close();

		if (memberDTO !=null) {
			exist = true;
		}
		
		return exist;
	}
	
	public void update(MemberDTO memberDTO) {
		 
		sqlSession.update("memberSQL.update",memberDTO);
		
		return;
	}//update 


	@Override
	public MemberDTO checkId(String id) {
		
		return sqlSession.selectOne("memberSQL.checkId", id);
	}


	@Override
	public MemberDTO getMember(String id) {
	
		return sqlSession.selectOne("memberSQL.getMember",id);
	}
}