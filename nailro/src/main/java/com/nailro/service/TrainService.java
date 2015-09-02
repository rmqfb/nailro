package com.nailro.service;

import java.util.List;

import com.nailro.domain.TrainDto;
import com.nailro.factory.Command;

public interface TrainService {
/*===== executeUpdate =====*/	
	
	/*insert : 열차입력*/
    public int insertTrain(TrainDto bean);
    /*update : 열차정보 수정*/
    public int updateTrain(TrainDto bean);
    /*delete : 열차정보삭제*/
    public int deleteTrain(TrainDto bean);
    
    /*insert : 제조사입력*/
    public int insertMaker(TrainDto bean);
    /*update : 제조사정보 수정*/
    public int updateMaker(TrainDto bean);
    /*delete : 제조사정보삭제*/
    public int deleteMaker(TrainDto bean);
    
/*===== executeQuery =====*/    
    
    /*getElementsByName : 검색어로 열차/제조사 검색*/
    public List<TrainDto> search(Command command);
    /*list : 열차전체 목록*/
    public List<TrainDto> trainList();
    /*list : 제조사전체 목록*/
    public List<TrainDto> makerList();
    /**/

    /*countAll : 열차 갯수*/
    public int trainCountAll();
    /*countSome : 특정 열차 수*/
    public int trainCountSome(String trainName);
    /*getElementById : 열차상세정보*/
    public TrainDto trainDetail(String trainName);
    
    /*countAll : 제조사 갯수*/
    public int makerCountAll();
    /*countSome : 특정 제조사 수*/
    public int makerCountSome(String maker);
    /*제조사상세정보*/
    public TrainDto makerDetail(String makerId);

}
