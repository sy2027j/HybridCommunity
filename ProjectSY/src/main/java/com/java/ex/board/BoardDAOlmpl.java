package com.java.ex.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOlmpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.java.ex.mappers.BoardMapper";
	
	@Override
	public void WriteMethod(BoardDTO dto) throws Exception {
		sqlSession.insert(namespace+".Write",dto);
	}
	
	@Override
	public BoardDTO detail(BoardDTO dto) {
		return sqlSession.selectOne(namespace+".Detail", dto);
	}

	@Override
	public List<BoardDTO> List(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(namespace+".List", map);
	}
	
	@Override
	public int BoardCount() throws Exception{
		return sqlSession.selectOne(namespace+".Count");
	}
	
	@Override
	public void Delete(BoardDTO dto) throws Exception{
		sqlSession.delete(namespace+".Delete",dto);
	}
	
	@Override
	public void Update(BoardDTO dto) throws Exception{
		sqlSession.update(namespace+".Update", dto);
	}
	
	@Override
	public List<BoardDTO> SearchList(HashMap<String, Object> map)throws Exception{
		return sqlSession.selectList(namespace+".Search", map);
	}
	
	@Override
	public int SearchBoardCount(HashMap<String, Object> map) throws Exception{
		//int total=sqlSession.selectOne(namespace+".SearchCount");
		//System.out.println(total);
		return sqlSession.selectOne(namespace+".SearchCount", map);
	}
}
