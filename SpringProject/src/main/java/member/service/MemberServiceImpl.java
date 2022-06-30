package member.service;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public String login(Map<String,String> map) {
		
		MemberDTO memberDTO = memberDAO.login(map);
		if(memberDTO!=null) {
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			return "ok";
			
		}else {
			return "fail";
		}
	}

	@Override
	public void logout() {
		session.invalidate();
		
	}

	@Override
	public String checkId(String id) {
		MemberDTO memberDTO = memberDAO.checkId(id);
		if(memberDTO == null) {
			return "non_exist"; 
		}else {
			
			return "exist";
		}
		
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
		
	}

	@Override
	public void updata(MemberDTO memberDTO) {
		memberDAO.update(memberDTO);
		
	}

	@Override
	public MemberDTO getMember(String id) {
		
		return memberDAO.getMember(id);
	}

}
