package com.nailro.mapper;
/*
@ Data 	: 15-08-23
@ Author:  최영인
@ Story :  Board Mapper
*/
import java.util.List;


import com.nailro.domain.BoardDto;
import com.nailro.factory.Command;

public interface BoardMapper {
	/****************************
	 === executeUpdate ===
	 1. 삽입 (insert)
	 ****************************/
	public int noticeInsert(BoardDto board);
	public int bbsInsert(BoardDto board);
	public int repleInsert(BoardDto board);
	
	/****************************
	 2. 수정 (update)
	 ****************************/
	public int noticeUpdate(BoardDto board);
	public int bbsUpdate(BoardDto board);
	/****************************
	 3. 삭제 (delete)
	 ****************************/
	public int noticeDelete(BoardDto board);
	public int bbsDelete(BoardDto board);
	public int repleDelete(BoardDto board);
	public int subDelete(BoardDto board);
	
	
	
	/****************************
	 === executeQuery ===
	 4. 상세 (detail)
	 ****************************/
	public BoardDto noticeDetail(Command command);
	public BoardDto bbsDetail(Command command);
	
	
	/*****************************
	 5. 조회(search)
	 *****************************/
	public List<BoardDto> noticeSearch(BoardDto board);
	public List<BoardDto> bbsSearch(BoardDto board);
	public List<BoardDto> noticeAllSearch(BoardDto board);
	public List<BoardDto> bbsAllSearch(BoardDto board);
	/*****************************
	 6. 목록(list)
	 *****************************/
	public List<BoardDto> noticeList(Command command);
	public List<BoardDto> bbsList(Command command);
	public List<BoardDto> repleList(BoardDto board);
	
	
	/*****************************
	 7. 크기(size)
	 *****************************/
	public int noticeSize(Command command);
	public int bbsSize(Command command);
	public int repleSize(Command command);
	/*****************************
	 8. 카운팅(count)
	 *****************************/
	public int noticeCount(Command command);
	public int bbsCount(Command command);
	public int noticeAllCount(Command command);
	public int bbsAllCount(Command command);
	public int noticeBrdCnt(Command command);
	public int bbsBrdCnt(Command command);
}
