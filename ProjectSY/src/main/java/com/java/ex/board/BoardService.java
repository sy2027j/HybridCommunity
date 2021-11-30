package com.java.ex.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {

	public void WriteMethod(BoardDTO dto) throws Exception;
	
	public BoardDTO detail(BoardDTO dto);
	
	public List<BoardDTO> List(HashMap<String, Object> map) throws Exception;
	
	public int BoardCount() throws Exception;
	
	public void Delete(BoardDTO dto) throws Exception;
	
	public void Update(BoardDTO dto) throws Exception;
	
	public List<BoardDTO> SearchList(HashMap<String, Object> map)throws Exception;
	
	public int SearchBoardCount(HashMap<String, Object> map) throws Exception;
}
