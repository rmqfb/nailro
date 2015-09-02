package com.nailro.service;

import java.util.List;
import com.nailro.domain.RailLineDto;
import com.nailro.factory.Command;

public interface RailLineService {
/*===== executeUpdate =====*/	
	
	/*insert : 노선입력*/
    public int insert(RailLineDto bean);
    /*update : 노선정보 수정*/
    public int update(RailLineDto bean);
    /*delete : 노선삭제*/
    public int delete(RailLineDto bean);
    
/*===== executeQuery =====*/    
    
    /*getElementsByName : 검색어로 회원 검색*/
    public List<RailLineDto> searchByKeyword(Command command);
    /*list : 노선전체 목록*/
    public List<RailLineDto> railLineList(Command command);

    /*countAll : 노선수*/
    public int railLineCountAll();
    /*countSome : 특정 노선수*/
    public int railLineCountSome(Command command);
    /*getElementById : 노선상세정보*/
    public RailLineDto railLineDetail(Command command);
}
