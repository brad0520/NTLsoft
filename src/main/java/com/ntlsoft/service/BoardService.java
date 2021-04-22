package com.ntlsoft.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ntlsoft.dao.BoardDao;
import com.ntlsoft.dto.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public Board getBoardById(int boardId) {
		return boardDao.getBoardById(boardId);
	}

}
