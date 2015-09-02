/**
 * @Date : 2015/6/22;
 * @author : 김호영
 * @Story : 차량정보 빈
 * 			maker :  제조사
			seatNo :  좌석 번호
		    capa : 승차가능인원
		    trainTypeCode : 차량종류코드 ktx..
		    trainName : 차량명
		    trainNo : 차량코드
		    startDate : 출발시간
		    destinationDate : 도착시간
	        startStation : 출발역
	        endStation : 도착역
 * 
 * 
 */

package com.nailro.domain;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

@Component("TrainDto")
public class TrainDto {

	//열차 차량정보---------------------------
		private String makerCode; // 제조사코드
		private String makerName; // 제조사명
		private Set<String> seatNo; // 좌석 번호
		private int seatCount; // 승차가능인원
		private String trainCode; //차량정보코드 ktx..
		private String trainName; //차량명
		private String runTrainCode;//운행차량코드
		private String runTimeCode; //운행시간코드
		private String startDate ; // 출발시간
		private String destinationDate ; // 도착시간
	    private List<RailLineDto> railLine; //노선정보
		private List<StationDto> runStationTime;// 역별 정차 시간
		
		public String getMakerCode() {
			return makerCode;
		}
		public void setMakerCode(String makerCode) {
			this.makerCode = makerCode;
		}
		public String getMakerName() {
			return makerName;
		}
		public void setMakerName(String makerName) {
			this.makerName = makerName;
		}
		public Set<String> getSeatNo() {
			return seatNo;
		}
		public void setSeatNo(Set<String> seatNo) {
			this.seatNo = seatNo;
		}
		public int getSeatCount() {
			return seatCount;
		}
		public void setSeatCount(int seatCount) {
			this.seatCount = seatCount;
		}
		public String getTrainCode() {
			return trainCode;
		}
		public void setTrainCode(String trainCode) {
			this.trainCode = trainCode;
		}
		public String getTrainName() {
			return trainName;
		}
		public void setTrainName(String trainName) {
			this.trainName = trainName;
		}
		public String getRunTrainCode() {
			return runTrainCode;
		}
		public void setRunTrainCode(String runTrainCode) {
			this.runTrainCode = runTrainCode;
		}
		public String getRunTimeCode() {
			return runTimeCode;
		}
		public void setRunTimeCode(String runTimeCode) {
			this.runTimeCode = runTimeCode;
		}
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String startDate) {
			this.startDate = startDate;
		}
		public String getDestinationDate() {
			return destinationDate;
		}
		public void setDestinationDate(String destinationDate) {
			this.destinationDate = destinationDate;
		}
		public List<RailLineDto> getRailLine() {
			return railLine;
		}
		public void setRailLine(List<RailLineDto> railLine) {
			this.railLine = railLine;
		}
		public List<StationDto> getRunStationTime() {
			return runStationTime;
		}
		public void setRunStationTime(List<StationDto> runStationTime) {
			this.runStationTime = runStationTime;
		}
}
/*
 *열차 차량정보  : 김호영
 *
		makerCode :  제조사코드
		makerName : 제조사명
		seatNo : 좌석 번호
		seatCount : 승차가능인원
		trainCode : 차량정보코드 ktx..
		trainName : 차량명
		runTrainCode : 운행차량코드
		runTimeCode : 운행시간코드
		startDate : 출발시간
		destinationDate : 도착시간
	    railLine : 노선정보
		runStationTime : 역별 정차 시간
 *    
 *    
 *    */
 