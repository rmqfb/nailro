package com.nailro.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SearchCommand extends Command {
	private static final Logger Logger = LoggerFactory.getLogger(SearchCommand.class);
     @Override
    public void execute(int pageNo,String searchKey, String searchVal) {
      setPageNo(pageNo);
      setSearchKey(searchKey);
      setSearchVal(searchVal);
      Logger.info("서치커맨드 검색키={} 검색값={}",getSearchKey(),getSearchVal());
    	
    }
   @Override
    public void execute(int pageNo, String searchKey, String searchVal,int theme) {
    	 setSearchKey(searchKey);
         setSearchVal(searchVal);
         setPageNo(pageNo);
         setTheme(theme);
    	 Logger.info("테마별 서치커맨드 검색키={} 검색값={}",getSearchKey(),getSearchVal());
    }
   @Override
   public void execute(String searchKey, String searchVal) {
     setSearchKey(searchKey);
     setSearchVal(searchVal);
     Logger.info("서치커맨드 검색키={} 검색값={}",getSearchKey(),getSearchVal());
   	
   }
 
}
