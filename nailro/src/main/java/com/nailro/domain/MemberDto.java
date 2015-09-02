package com.nailro.domain;

import org.springframework.stereotype.Component;

/*@date  :  2015.08.24
@author : hanskim
@Story : 멤버에 대한 필요한 값 선언 , 주석 일괄 처리

name ;  // 회원 이름
id ;    // 회원아이디
pass ;  //회원 패스워드
age  ;   // 회원나이
cellPhone ;  // 회원 핸드폰 번호
telNo ;  // 회원 일반 번호
gender ;   // 회원성별	
email ;    // 회원이메일
profile ;  // 회원 상세내역의 사진 정보
// 이상 회원가입 <I> 필요 변수
 * 
// 이상 게시판 후기 필요한 변수 ( + memberId+ memberPasswordl)
*/
@Component("member")
public class MemberDto {
	private String id ;  
	private String name ;  
	private String pass ;  
	private int age  ;  
	private String cellPhone ; 
	private String telNo ;  
	private int gender ;  
	private String email ;
	private String joindate ;
	
	private String merit ;
	private String address ;
		
	private String memo ; 
	private String rank ;   
	private String rankName ;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	} 
	
	public String getMerit() {
		return merit;
	}
	public void setMerit(String merit) {
		this.merit = merit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	

	
}
