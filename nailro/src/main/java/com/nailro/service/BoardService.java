package com.nailro.service;

/*
@ Data 	: 15-08-23
@ Author:  최영인
@ Story :  Board Sevice
*/

import java.util.List;

import com.nailro.domain.BoardDto;
import com.nailro.factory.Command;

public interface BoardService {
	/****************************
	 === executeUpdate ===
	 1. 삽입 (insert)
	 ****************************/
	public int insert(BoardDto board);
	public int repleInsert(BoardDto board);
	/****************************
	 2. 수정 (update)
	 ****************************/
	public int update(BoardDto board);
	/****************************
	 3. 삭제 (delete)
	 ****************************/
	public int delete(BoardDto board);
	public int repleDelete(BoardDto board);
	public int subDelete(BoardDto board);
	
	
	
	/****************************
	 === executeQuery ===
	 4. 상세 (detail)
	 ****************************/
	public BoardDto detail(Command command);
	
	/*****************************
	 5. 조회(search)
	 *****************************/
	public List<BoardDto> search(BoardDto board);
	public List<BoardDto> allSearch(BoardDto board);
	/*****************************
	 6. 목록(list)
	 *****************************/
	public List<BoardDto> list(Command command);
	public List<BoardDto> repleList(BoardDto board);
	
	/*****************************
	 7. 크기(size)
	 *****************************/
	public int size(Command command);
	public int repleSize(Command command);
	/*****************************
	 8. 카운팅(count)
	 *****************************/
	public int count(Command command);
	public int allCount(Command command);
	public int readCnt(Command command);
	
}
