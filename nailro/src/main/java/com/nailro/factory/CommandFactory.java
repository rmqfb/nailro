package com.nailro.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommandFactory {
	private static final Logger logger = LoggerFactory.getLogger(CommandFactory.class);
	private static Command instance;
	private CommandFactory(){}
	/*******************************
	 * 1.상세(detail)
	 *******************************/
	public static Command detail(String searchKey,String searchVal){
		instance = new DetailCommand();
		instance.execute(searchKey, searchVal);
		logger.info("[팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	public static Command detail(String searchKey,String searchVal,int theme){
		instance = new DetailCommand();
		instance.execute(searchKey, searchVal,theme);
		logger.info("[테마별 팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	/*******************************
	 * 2.조회(search)
	 *******************************/
	public static Command search(int param1,String searchKey,String searchVal){
		instance  = new SearchCommand();
		instance.execute(param1, searchKey, searchVal);
		logger.info("[팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	public static Command search(String searchKey,String searchVal){
		instance  = new SearchCommand();
		instance.execute(searchKey, searchVal);
		logger.info("[팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	public static Command search(int param1,String searchKey,String searchVal,int theme){
		instance  = new SearchCommand();
		instance.execute(param1,searchKey, searchVal,theme);
		logger.info("[테마별 팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	/*******************************
	 * 3.목록(list) 
	 *******************************/
	public static Command list(int param1){
		instance = new ListCommand();
		instance.execute(param1);
		logger.info("[팩토리] 시작={},끝 ={}",instance.getStart(),instance.getEnd());
		return instance;
	}
	public static Command list(int param1,int theme){
		instance = new ListCommand();
		instance.execute(param1,theme);
		logger.info("[테마별 팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
	/*******************************
	 * 4.크기(list) 
	 *******************************/
	public static Command size(){
		instance = new SizeCommand();
		instance.execute();
		logger.info("[팩토리] 전체 목록수 구하기 ");
		return instance;
	}
	public static Command size(int theme){
		instance = new SizeCommand();
		instance.execute(theme);
		logger.info("[테마별 팩토리] 전체 목록수 구하기 ");
		return instance;
	}
	/*******************************
	 * 5.카운팅(count) 
	 *******************************/
	
	public static Command count(String searchKey,String searchVal) {
		logger.info("[팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		instance = new CountCommand();
		instance.execute(searchKey, searchVal);
		return instance;
	}
	public static Command count(String searchKey,String searchVal,int theme) {
		instance = new CountCommand();
		instance.execute(searchKey, searchVal,theme);
		logger.info("[테마별 팩토리] 검색키={},검색값 ={}",instance.getSearchKey(),instance.getSearchVal());
		return instance;
	}
}
