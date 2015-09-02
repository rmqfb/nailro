package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.StationDto;

public interface StationMapper {
	/* 
	 * 추가 CREATE
	 * */
	public int insert(StationDto train);
	/*
	 * 수정
	 * */
	public int update(StationDto train);
	/*
	 * 삭제
	 * */
	public int delete(StationDto train);
	
	/*
	 * 요소의 전체 갯수 
	 * */
	public int countAll();
	/*
	 * 검색 결과로 나온 요소의 갯수 
	 * */
	public int countSome(String id);
	/*
	 * ID 로 중복값 없이 추출
	 * */
	public StationDto getElementById(String id);
	/*
	 * Name 으로 중복값 허용하며 추출
	 * */
	public List<StationDto> getElementsByName(String name);
	/*
	 * 전체 목록 추출
	 * */
	public List<StationDto> list();
}
