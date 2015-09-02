package com.nailro.domain;
/*
	@ Data : 15-08-23
	@ Author :  최영인
	@ Story :  Board 정보 DTO
	
	id 			: 세션에 있는 id 담기 용도
	brdNo		: 글 번호
	brdPass 	: 게시판 비번
	title		: 글 제목
	content		: 글 내용
	boardDate	: 날짜
	readCnt		: 조회수
	path		: 파일경로
	repleNo		: 리플 번호
	repleContent: 리플 내용
	repleDate	: 리플 등록일
	theme		: 게시판 카테고리(notice, review)
	pageNo		: 페이지 번호
	start		: 페이지 시작 번호
	end			: 페이지 끝 번호
	searchKey	: 검색 키
	searchVal	: 검색 값 
*/

import org.springframework.stereotype.Component;
@Component("board")
public class BoardDto {
	public final int PAGESIZE = 10;
	public final int REPLEPAGESIZE = 5;
	private String id; // 세션에 있는 id 담기 용도
	private int brdNo; // 글 번호
	private String brdPass ; // 게시판 비번
	private String title; // 글 제목
	private String content; // 글 내용
	private String boardDate;// 날짜
	private int readCnt; // 조회수
	private String path;// 파일경로
	private int repleNo; // 리플 번호
	private String repleContent; // 리플 내용
	private String repleDate; // 리플 등록일
	private int theme; // 게시판 카테고리(notice, review)
	private int pageNo; // 페이지 번호
	private int start; // 페이지 시작 번호
	private int end; // 페이지 끝 번호
	private String searchKey; // 검색 키
	private String searchVal; // 검색 값
	private int repleStart; // 리플 페이지 시작
	private int repleEnd; // 리플 페이지 마지막
	private int replePageNo; // 리플 페이지 번호
	public int getReplePageNo() {		
		return replePageNo;
	}
	public void setReplePageNo(int replePageNo) {		
		this.replePageNo = replePageNo;
		this.repleStart = (replePageNo-1)*REPLEPAGESIZE+1;
		this.repleEnd = replePageNo*REPLEPAGESIZE;
	}
	public int getRepleStart() {
		return repleStart;
	}
	public void setRepleStart(int repleStart) {
		this.repleStart = repleStart;
	}
	public int getRepleEnd() {
		return repleEnd;
	}
	public void setRepleEnd(int repleEnd) {
		this.repleEnd = repleEnd;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBrdNo() {
		return brdNo;
	}
	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}
	public int getTheme() {
		return theme;
	}
	public void setTheme(int theme) {
		this.theme = theme;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1)*PAGESIZE+1;
		this.end = pageNo*PAGESIZE;
	}
	
	public String getBrdPass() {
		return brdPass;
	}
	public void setBrdPass(String brdPass) {
		this.brdPass = brdPass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getRepleNo() {
		return repleNo;
	}
	public void setRepleNo(int repleNo) {
		this.repleNo = repleNo;
	}
	public String getRepleContent() {
		return repleContent;
	}
	public void setRepleContent(String repleContent) {
		this.repleContent = repleContent;
	}
	public String getRepleDate() {
		return repleDate;
	}
	public void setRepleDate(String repleDate) {
		this.repleDate = repleDate;
	}
	@Override
	public String toString() {
		return "BoardDto [PAGESIZE=" + PAGESIZE + ", id=" + id + ", brdNo=" + brdNo + ", brdPass=" + brdPass
				+ ", title=" + title + ", content=" + content + ", boardDate=" + boardDate + ", readCnt=" + readCnt
				+ ", path=" + path + ", repleNo=" + repleNo + ", repleContent=" + repleContent
				+ ", repleDate=" + repleDate + ", theme=" + theme + ", pageNo=" + pageNo + ", start=" + start + ", end="
				+ end + ", searchKey=" + searchKey + ", searchVal=" + searchVal + "]";
	}
}
