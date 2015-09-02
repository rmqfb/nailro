package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.TrainDto;

public interface TrainMapper {
	/* 
	 * 추가 CREATE
	 * */
	public int makerInsert(TrainDto train);
	public int trainInsert(TrainDto train);
	/*
	 * 수정
	 * */
	public int trainUpdate(TrainDto train);
	public int makerUpdate(TrainDto train);
	/*
	 * 삭제
	 * */
	public int trainDelete(TrainDto train);
	public int makerDelete(TrainDto train);
	
	/*
	 * 요소의 전체 갯수 
	 * */
	public int makerCountAll();
	public int trainCountAll();
	/*
	 * 검색 결과로 나온 요소의 갯수 
	 * */
	public int trainCountSome(String trainName);
	/*
	 * 검색 결과로 나온 요소의 갯수 
	 * */
	public int makerCountSome(String makerName);
	/*
	 * ID 로 중복값 없이 추출
	 * */
	public TrainDto getElementById(String trainId);
	/*
	 * Name 으로 중복값 허용하며 추출
	 * */
	public List<TrainDto> getElementsByName(String trainName);
	/*
	 * 열차 전체 목록 추출
	 * */
	public List<TrainDto> trainList(String type);
	
	public List<TrainDto> makerList(String type);
}
