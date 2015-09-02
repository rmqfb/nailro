package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.MemberDto;
import com.nailro.factory.Command;

/*@date  :  2015.08.24
  @author : hanskim
 *@part  :  member  
 * 
 * */

public interface MemberMapper {
	/* 
	 * 추가 CREATE
	 */
	public int insert(MemberDto member);
	/*
	 * 수정
	 * */
	public int update(MemberDto member);
	/*
	 * 삭제
	 * */
	public int delete(MemberDto member);

	/*
	 * 요소 전체의 갯수 
	 * */
	public int countAll();
	
	
	/* 검색 결과로 나온 요소의 갯수
	 * 
	 */
	public int countSome(Command command);
	/*
	 * ID 로 중복값 없이 추출
	 * */
	public MemberDto getElementById(Command command);

	/*
	 * Name 으로 중복값 허용하며 추출
	 * */
	public List<MemberDto> getElementsByName(Command command);
	
	/*
	 * Id 로 중복값 허용하며 추출
	 * */
	public List<MemberDto> getElementsById(Command command);
	
	/*
	 * name, cellPhone으로 로 중복값 허용하며 추출
	 * */
	
	public List<MemberDto> getElementInfo(Command command);
	
	/*
	 * 전체 목록 추출
	  */
	public List<MemberDto> list(Command command);

	/*
	 * 로그인
	  */
	public MemberDto login(Command command);
	 /* 회원 정보 추축(이름/핸드폰번호) */

    public MemberDto findId(Command command);
    
	 /* 회원 정보 추축(아이디/핸드폰번호) */
    public MemberDto findPass(Command command);
    
	
}
