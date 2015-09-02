/**
 * @Date : 2015/7/18;
 * @author : 유은규
 * @Story : 이벤트 DB 목록;
 */
package com.nailro.domain;

import org.springframework.stereotype.Component;

@Component("EventDto")
public class EventDto {
	private int pageNo; // 페이지 넘버
	private int count;
	private int num; // 전체 페이지 글수
	private String pkgCode; // 패키지 코드 넘버번호
	private String pkgName; // 패키지 이름
	private String pkgTermA; // 패키지 유효기간 시작
	private String pkgTermB; // 패키지 유효기간 끝
	private String pkgsaler; // 패키지 판매자
	private String pkgTel; // 패키지 문의전화번호
	private String areaName; // 패키지 분류지역
	private String areaCode; // 패키지 지역 코드
	private String pkgAbout; // 패키지 세부사항 (주의사항,주변 관광지설명)
	// 숙소 INFO
	private String mtCode; // 숙소 코드번호
	private String mtName; // 숙소 이름
	private String mtAddress; //  숙소 주소 
	private String mtPhone; // 숙소 연락처 
	private String mtPhone1; // 숙소 연락처 지역번호
	private String mtPhone2; // 숙소 연락처 앞자리
	private String mtPhone3; // 숙소 연락처 뒷자리
	private String mtInfo; // 패키지 숙소 객실정보(몇평,몇인실)
	private String mtAbout; // 패키지 숙소 세부사항(부대시설)
	private int mtPrice; // 패키지 숙소가격
	private String salerCode; // 판매자 코드번호
	private String salerName; // 판매자 이름
	private String salerPhone; // 판매자 연락처
	private String pkgKeepCode; // 패키지 예약 코드번호
	private int pkgPrice; // 패키지 
	private int grade;
	private String path;
	
	private String reserveCode; //열차예매 코드
	private String userid; // 아이디
	private String startDate;// 출발일
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getReserveCode() {
		return reserveCode;
	}
	public void setReserveCode(String reserveCode) {
		this.reserveCode = reserveCode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSalerName() {
		return salerName;
	}
	public void setSalerName(String salerName) {
		this.salerName = salerName;
	}
	public String getSalerPhone() {
		return salerPhone;
	}
	public void setSalerPhone(String salerPhone) {
		this.salerPhone = salerPhone;
	}
	
   

	public String getPkgCode() {
		return pkgCode;
	}
	public void setPkgCode(String pkgCode) {
		this.pkgCode = pkgCode;
	}
	public String getPkgName() {
		return pkgName;
	}
	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}
	public String getPkgTermA() {
		return pkgTermA;
	}
	public void setPkgTermA(String pkgTermA) {
		this.pkgTermA = pkgTermA;
	}
	public String getPkgTermB() {
		return pkgTermB;
	}
	public void setPkgTermB(String pkgTermB) {
		this.pkgTermB = pkgTermB;
	}
	public String getPkgsaler() {
		return pkgsaler;
	}
	public void setPkgsaler(String pkgsaler) {
		this.pkgsaler = pkgsaler;
	}
	public String getPkgTel() {
		return pkgTel;
	}
	public void setPkgTel(String pkgTel) {
		this.pkgTel = pkgTel;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String area) {
		this.areaName = area;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getPkgAbout() {
		return pkgAbout;
	}
	public void setPkgAbout(String pkgAbout) {
		this.pkgAbout = pkgAbout;
	}
	public String getMtCode() {
		return mtCode;
	}
	public void setMtCode(String mtCode) {
		this.mtCode = mtCode;
	}
	public String getMtName() {
		return mtName;
	}
	public void setMtName(String mtName) {
		this.mtName = mtName;
	}
	public String getMtAddress() {
		return mtAddress;
	}
	public void setMtAddress(String mtAddress) {
		this.mtAddress = mtAddress;
	}
	public String getMtPhone() {
		return mtPhone;
	}
	public void setMtPhone(String mtPhone) {
		this.mtPhone = mtPhone;
	}
	public String getMtPhone1() {
		return mtPhone1;
	}
	public void setMtPhone1(String mtPhone1) {
		this.mtPhone1 = mtPhone1;
	}
	public String getMtPhone2() {
		return mtPhone2;
	}
	public void setMtPhone2(String mtPhone2) {
		this.mtPhone2 = mtPhone2;
	}
	public String getMtPhone3() {
		return mtPhone3;
	}
	public void setMtPhone3(String mtPhone3) {
		this.mtPhone3 = mtPhone3;
	}
	public String getMtInfo() {
		return mtInfo;
	}
	public void setMtInfo(String mtInfo) {
		this.mtInfo = mtInfo;
	}
	public String getMtAbout() {
		return mtAbout;
	}
	public void setMtAbout(String mtAbout) {
		this.mtAbout = mtAbout;
	}
	public int getMtPrice() {
		return mtPrice;
	}
	public void setMtPrice(int mtPrice) {
		this.mtPrice = mtPrice;
	}
	public String getSalerCode() {
		return salerCode;
	}
	public void setSalerCode(String salerCode) {
		this.salerCode = salerCode;
	}
	public String getPkgKeepCode() {
		return pkgKeepCode;
	}
	public void setPkgKeepCode(String pkgKeepCode) {
		this.pkgKeepCode = pkgKeepCode;
	}
	public int getPkgPrice() {
		return pkgPrice;
	}
	public void setPkgPrice(int pkgPrice) {
		this.pkgPrice = pkgPrice;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}// 평점
	
	