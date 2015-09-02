package com.nailro.factory;

public interface Orderable {
	/*메소드 오버로딩*/
	/*******************************
	 * 1.상세(detail)
	 *******************************/
	public void execute(String param1,String param2);
	public void execute(String param1,String param2,int param3);
	/*******************************
	 * 2.조회(search) 
	 *******************************/
	public void execute(int param1,String param2,String param3);
	public void execute(int param1,String param2,String param3,int param4);
	/*******************************
	 * 3.목록(list) 
	 *******************************/
	public void execute(int param1);
	public void execute(int param1,int param2);
	/*******************************
	 * 4.크기(size) 
	 *******************************/
	public void execute();
	/*public void execute(int param1);*/
	/*******************************
	 * 5.카운팅(count) 
	 *******************************/
	public void execute(String param1,int param2);
	/*public void execute(String param1,String param2,int param3);*/
	
}
