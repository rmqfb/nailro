/**
 * @Date : 2015/6/22;
 * @author : 김호영
 * @Story : 노선정보 빈
 *          lineCode : 노선코드
			lineName : 노선명
 */

package com.nailro.domain;

import org.springframework.stereotype.Component;

@Component("RailLineDto")
public class RailLineDto {
	// 노선정보VO---------------------------
	private String lineCode; // 노선코드
	private String lineName;
	// 노선명
	/*
	 * private List<StationDto> stations; //역정보
	 */ 
	private String station1, station2, station3, station4, station5, station6, station7, station8, station9,
			station10;

	public String getStation1() {
		return station1;
	}

	public void setStation1(String station1) {
		this.station1 = station1;
	}

	public String getStation2() {
		return station2;
	}

	public void setStation2(String station2) {
		this.station2 = station2;
	}

	public String getStation3() {
		return station3;
	}

	public void setStation3(String station3) {
		this.station3 = station3;
	}

	public String getStation4() {
		return station4;
	}

	public void setStation4(String station4) {
		this.station4 = station4;
	}

	public String getStation5() {
		return station5;
	}

	public void setStation5(String station5) {
		this.station5 = station5;
	}

	public String getStation6() {
		return station6;
	}

	public void setStation6(String station6) {
		this.station6 = station6;
	}

	public String getStation7() {
		return station7;
	}

	public void setStation7(String station7) {
		this.station7 = station7;
	}

	public String getStation8() {
		return station8;
	}

	public void setStation8(String station8) {
		this.station8 = station8;
	}

	public String getStation9() {
		return station9;
	}

	public void setStation9(String station9) {
		this.station9 = station9;
	}

	public String getStation10() {
		return station10;
	}

	public void setStation10(String station10) {
		this.station10 = station10;
	}

	public String getLineCode() {
		return lineCode;
	}

	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	/*
	 * public List<StationDto> getStations() { return stations; } public void
	 * setStations(List<StationDto> stations) { this.stations = stations; }
	 */
}
/*
 * 노선관리 : 김호영
 * 
 * lineCode : 노선코드 lineName : 노선명 stations : 역명
 * 
 */
