package com.nailro.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ListCommand extends Command {
	private static final Logger Logger = LoggerFactory.getLogger(ListCommand.class);
	@Override
	public void execute(int pageNo) {
		// TODO Auto-generated method stub
		setPageNo(pageNo);
		Logger.info("[리스트 커맨드] 시작={},끝 ={}",getStart(),getEnd());
	}
	@Override
	public void execute(int pageNo,int theme) {
		// TODO Auto-generated method stub
		setPageNo(pageNo);
		setTheme(theme);
		Logger.info("[테마별 리스트 커맨드] 시작={},끝 ={}",getStart(),getEnd());
	}
}
