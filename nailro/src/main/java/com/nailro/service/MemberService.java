package com.nailro.service;

import java.util.List;
import com.nailro.domain.MemberDto;
import com.nailro.factory.Command;
/*@date  :  2015.08.24
@author : hanskim
*@part  :  member  
* 
* */

public interface MemberService {
	
/*===== executeUpdate =====*/	
	
	/*insert : 회원가입*/
    public int insert(MemberDto dto);
    
    /*update : 회원정보 수정*/
    public int update(MemberDto dto);
    
    /*delete : 회원탈퇴*/
    public int delete(MemberDto dto);
    
/*===== executeQuery =====*/    
    
  /*  디테일 */
    public List<MemberDto> detail(Command command);
 
    /*searchByName : 이름으로 회원 검색*/
    public List<MemberDto> searchByName(Command command);


    /*searchById : 이름으로 회원 검색*/
    public List<MemberDto> searchById(Command command);
    
    /*list : 회원전체 목록*/
    public List<MemberDto> list(Command command);
    
    /*list : 회원전체 목록*/
    public List<MemberDto> getElementInfo(Command command);
       
     
    /*login : 로그인*/
   public MemberDto login(Command command);
   
    /*size : 크기 */ 
    public int size();

    /*count : 전체회원수*/
    public int count(Command command);

    /* 회원 정보 추축(이름/핸드폰번호) */

    public MemberDto findId(Command command);
    
	 /* 회원 정보 추축(아이디/핸드폰번호) */
    public MemberDto findPass(Command command);
    
    
    

}
