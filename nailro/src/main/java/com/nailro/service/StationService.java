package com.nailro.service;

import java.util.List;

import com.nailro.domain.StationDto;
import com.nailro.factory.Command;

public interface StationService {
/*===== executeUpdate =====*/	
	
	/*insert : 역입력*/
    public int insertStation(StationDto bean);
    /*update : 역정보 수정*/
    public int updateStation(StationDto bean);
    /*delete : 역삭제*/
    public int deleteStation(StationDto bean);
    
/*===== executeQuery =====*/    
    
    /*getElementsByName : 검색어로 회원 검색*/
    public List<StationDto> searchByKeyword(String id);
    /*list : 역전체 목록*/
    public List<StationDto> stationList();

    /*countAll : 역 갯수*/
    public int stationCountAll();
    /*countSome : 특정 역 수*/
    public int stationCountSome(String stationName);
    /*getElementById : 역상세정보*/
    public StationDto stationDetail(String stationId);
}
