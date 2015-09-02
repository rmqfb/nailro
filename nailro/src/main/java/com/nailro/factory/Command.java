package com.nailro.factory;

public class Command implements Orderable{
	public final int PAGESIZE = 10;
	private int pageNo, start, end,theme,seq;/*게시판 시퀀스 번호 */
	String command, searchKey,searchVal;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getTheme() {
		return theme;
	}
	public void setTheme(int theme) {
		this.theme = theme;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1)*PAGESIZE+1;
		this.end = pageNo*PAGESIZE;
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


	public String getCommand() {
		return command;
	}


	public void setCommand(String command) {
		this.command = command;
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


	public int getPAGESIZE() {
		return PAGESIZE;
	}


	@Override
	public void execute(String param1, String param2) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(String param1, String param2, int param3) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(int param1, String param2, String param3) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(int param1, String param2, String param3, int param4) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(int param1) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(int param1, int param2) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void execute(String param1, int param2) {
		// TODO Auto-generated method stub
		
	}




}
