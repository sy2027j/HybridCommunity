package com.java.ex.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServicelmpl implements BoardService {

	@Inject
	private BoardDAO dao;
	@Override
	public void WriteMethod(BoardDTO dto) throws Exception {
		dao.WriteMethod(dto);
	}

	@Override
	public BoardDTO detail(BoardDTO dto) {
		return dao.detail(dto);
	}
	
	@Override
	public List<BoardDTO> List(HashMap<String, Object> map) throws Exception {
		return dao.List(map);
	}
	
	@Override
	public int BoardCount() throws Exception{
		return dao.BoardCount();
	}
	
	@Override
	public void Delete(BoardDTO dto) throws Exception{
		dao.Delete(dto);
	}
	
	@Override
	public void Update(BoardDTO dto) throws Exception{
		dao.Update(dto);
	}
	
	@Override
	public List<BoardDTO> SearchList(HashMap<String, Object> map)throws Exception{
		return dao.SearchList(map);
	}
	
	@Override
	public int SearchBoardCount(HashMap<String, Object> map) throws Exception{
		return dao.SearchBoardCount(map);
	}
}
