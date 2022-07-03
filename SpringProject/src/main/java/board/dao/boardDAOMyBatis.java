package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import board.bean.CommentDTO;

@Repository
@Transactional
public class boardDAOMyBatis implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession=null;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		
		return sqlSession.selectList("boardSQL.getBoardList",map);
	}

	@Override
	public int getTotalA() {
		
		return sqlSession.selectOne("boardSQL.getTotalA");
	}

	@Override
	public BoardDTO getBoardView(String seq) {
		
		return sqlSession.selectOne("boardSQL.getBoardView",Integer.parseInt(seq));
	}

	@Override
	public void setHit(String seq) {
		sqlSession.update("boardSQL.setHit",Integer.parseInt(seq));
		
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply",map);
		
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		
		return sqlSession.selectList("boardSQL.getBoardSearch",map);
	}

	@Override
	public int getTotalSearchA(Map<String, String> map) {
		
		return sqlSession.selectOne("boardSQL.getTotalSearchA", map);
	}



	@Override
	public void commentWrite(Map<String, String> map) {
		System.out.println(map.get("nickName")+","+map.get("commentContent")+","+map.get("seq"));
		sqlSession.insert("boardSQL.commentWrite",map);
		
		
	}



	@Override
	public List<CommentDTO> commentView(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.commentOutput",map);
	}

	@Override
	public void commentReplyWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.commentReplyWrite",map);
		
	}

}
