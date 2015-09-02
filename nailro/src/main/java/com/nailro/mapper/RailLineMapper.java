package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.RailLineDto;
import com.nailro.factory.Command;

public interface RailLineMapper {
	/* 
	 * 추가 CREATE
	 * */
	public int insert(RailLineDto train);
	/*
	 * 수정
	 * */
	public int update(RailLineDto train);
	/*
	 * 삭제
	 * */
	public int delete(RailLineDto train);
	
	/*
	 * 요소의 전체 갯수 
	 * */
	public int countAll();
	/*
	 * 검색 결과로 나온 요소의 갯수 
	 * */
	public int countSome(Command command);
	/*
	 * ID 로 중복값 없이 추출
	 * */
	public RailLineDto getElementById(Command command);
	/*
	 * Name 으로 중복값 허용하며 추출
	 * */
	public List<RailLineDto> getElementsByName(Command command);
	/*
	 * 전체 목록 추출
	 * */
	public List<RailLineDto> list(Command command);
}
