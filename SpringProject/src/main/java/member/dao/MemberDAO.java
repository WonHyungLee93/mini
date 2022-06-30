package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(Map<String,String> map);
	public int write(MemberDTO memberDTO);
	public boolean isExistId(String id);
	public void update(MemberDTO memberDTO);
	public MemberDTO checkId(String id);
	public MemberDTO getMember(String id);
}
