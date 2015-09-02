package com.nailro.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DetailCommand extends Command {
	private static final Logger logger = LoggerFactory.getLogger(DetailCommand.class);
	@Override
	public void execute(String searchKey, String searchVal) {
		// TODO Auto-generated method stub
		setSearchKey(searchKey);
		setSearchVal(searchVal);
		logger.info("[팩토리] 검색키={},검색값 ={}",getSearchKey(),getSearchVal());
	}
	@Override
	public void execute(String searchKey,String searchVal, int theme) {
		// TODO Auto-generated method stub
		setSearchKey(searchKey);
		setSearchVal(searchVal);
		setTheme(theme);
		setSeq(theme);
		logger.info("[테마별 팩토리] 검색키={},검색값 ={}",getSearchKey(),getSearchVal());
		
	}
}
