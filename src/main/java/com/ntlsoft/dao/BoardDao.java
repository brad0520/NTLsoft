package com.ntlsoft.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ntlsoft.dto.Board;

@Mapper
public interface BoardDao {

	Board getBoardById(@Param("boardId") int boardId);

}
