/**
 * @Date : 2015/6/22;
 * @author : 김호영
 * @Story : 역정보 빈
 * 			stationCode : 역코드
			stationName : 역명
			distance : 거리
 */

package com.nailro.domain;

import org.springframework.stereotype.Component;

@Component("StationDto")
public class StationDto {
	  //역정보 ------------------------------		
			private String stationCode; //역코드
			private String stationName; //역명
			private int distance; // 거리
			
			public String getStationName() {
				return stationName;
			}
			public void setStationName(String stationName) {
				this.stationName = stationName;
			}
			public int getDistance() {
				return distance;
			}
			public void setDistance(int distance) {
				this.distance = distance;
			}
			public String getStationCode() {
				return stationCode;
			}
			public void setStationCode(String stationCode) {
				this.stationCode = stationCode;
			}
}
/*역관리 : 김호영 
 *stationCode : 역코드
  stationName : 역명
  distance : 거리
 * 
 *    
 *    */
 