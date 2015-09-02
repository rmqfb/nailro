package com.nailro.serviceImpl;

/*
@ Data 	: 15-08-23
@ Author:  최영인
@ Story :  Board SeviceImpl
*/

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nailro.domain.BoardDto;
import com.nailro.factory.Command;
import com.nailro.mapper.BoardMapper;
import com.nailro.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	@Autowired private BoardDto board;
	@Override
	public int insert(BoardDto board) {
		logger.info("[서비스] 게시판 목록 이름= {} 게시물 번호={}",board.getTheme(),board.getBrdNo());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(board.getTheme()==1){
		ok = mapper.noticeInsert(board);
		}else if (board.getTheme()==2) {
		ok =mapper.bbsInsert(board);
		}
		return ok;
	}

	@Override
	public int repleInsert(BoardDto board) {
		logger.info("[서비스] 게시물 번호={}",board.getBrdNo());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.repleInsert(board);
	}
	@Override
	public int update(BoardDto board) {
		logger.info("[서비스] 게시판 목록 이름= {} 게시물 번호={}");
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(board.getTheme()==1){
		ok = mapper.noticeUpdate(board);
		}else if (board.getTheme()==2) {
		ok =mapper.bbsUpdate(board);
		}
		return ok;
	}

	@Override
	public int delete(BoardDto board) {
		logger.info("[서비스] 게시판 목록 이름= {} 게시물 번호={}");
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(board.getTheme()==1){
		ok = mapper.noticeDelete(board);
		}else if (board.getTheme()==2) {
		ok =mapper.bbsDelete(board);
		}
		return ok;
	}
	
	@Override
	public List<BoardDto> list(Command command) {
		logger.info("[서비스] 게시판 목록 이름= {} 페이지 번호={}");
		List<BoardDto> list = new ArrayList<BoardDto>();
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		if(command.getTheme()==1){
	       list = mapper.noticeList(command);
		}else if (command.getTheme()==2) {
		   list = mapper.bbsList(command);
		}
		return  list;
	}

	@Override
	public BoardDto detail(Command command) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		logger.info("[서비스] 게시판 목록 이름= {} 페이지 번호={}",command.getSearchKey(),command.getSearchVal());
		int brdName = Integer.parseInt(command.getSearchKey());
		if(brdName == 1){
		board = mapper.noticeDetail(command);
		}else if (brdName == 2) {
		board = mapper.bbsDetail(command);
		}
		return board;
	}

	@Override
	public List<BoardDto> search(BoardDto board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		List<BoardDto> list = new ArrayList<BoardDto>();
		if(board.getTheme()==1) {
	       list = mapper.noticeSearch(board);
		}else if (board.getTheme()==2) {
		   list = mapper.bbsSearch(board);
		}
		return  list;
	}
	@Override
	public List<BoardDto> allSearch(BoardDto board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		List<BoardDto> list = new ArrayList<BoardDto>();
		if(board.getTheme()==1){
	       list = mapper.noticeAllSearch(board);
		}else if (board.getTheme()==2) {
		   list = mapper.bbsAllSearch(board);
		}
		return  list;
	}

	@Override
	public int size(Command command) {
		logger.info("사이즈 게시판 이름 : "+command.getTheme());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(command.getTheme()==1){
		ok = mapper.noticeSize(command);
		}else if (command.getTheme()==2) {
		ok = mapper.bbsSize(command);
		}
		logger.info("사이즈 : "+ok);
		return ok;
	}

	@Override
	public int count(Command command) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(command.getTheme()==1){
		ok = mapper.noticeCount(command);
		}else if (command.getTheme()==2) {
		ok = mapper.bbsCount(command);
		}
		return ok;
	}

	@Override
	public int allCount(Command command) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int ok = 0;
		if(command.getTheme()==1){
		ok = mapper.noticeAllCount(command);
		}else if (command.getTheme()==2) {
		ok = mapper.bbsAllCount(command);
		}
		return ok;
	}
	
	

	@Override
	public int repleDelete(BoardDto board) {
		logger.info("[서비스] 게시물 번호={}"+board.getBrdNo());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);	
		return mapper.repleDelete(board);
	}

	@Override
	public List<BoardDto> repleList(BoardDto board) {
		logger.info("[서비스] 게시물 번호={}"+board.getBrdNo());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);	
		return mapper.repleList(board);
	}
	
	@Override
	public int repleSize(Command command) {
		logger.info("사이즈 게시물 번호 = {} "+command.getSearchKey());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
				
		return mapper.repleSize(command);
	}
	
	@Override
	public int readCnt(Command command) {
		logger.info("카운트 게시판 이름 = {} 카운트 게시판 번호 =  "+command.getTheme(),command.getSearchKey());
		logger.info("카운트 게시판 조회수 = "+command.getSearchVal());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);		
		int ok = 0;
		if(command.getTheme()==1){
		ok = mapper.noticeBrdCnt(command);
		}else if (command.getTheme()==2) {
		ok = mapper.bbsBrdCnt(command);
		}
		return ok;
	}
	@Override
	public int subDelete(BoardDto board) {
		logger.info("[서비스]  게시물 번호={}",board.getBrdNo());
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);		
	
		return mapper.subDelete(board);
		
	}

	
	
}
