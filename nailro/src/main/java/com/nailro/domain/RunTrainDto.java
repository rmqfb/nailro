package com.nailro.domain;

import org.springframework.stereotype.Component;

@Component("runTrain")
public class RunTrainDto {
private String runTrainCode;
private String runTimeCode;
private String railLineCode;
private String trainCode;
private String runTrainDate;
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
public String getRailLineCode() {
	return railLineCode;
}
public void setRailLineCode(String railLineCode) {
	this.railLineCode = railLineCode;
}
public String getTrainCode() {
	return trainCode;
}
public void setTrainCode(String trainCode) {
	this.trainCode = trainCode;
}
public String getRunTrainDate() {
	return runTrainDate;
}
public void setRunTrainDate(String runTrainDate) {
	this.runTrainDate = runTrainDate;
}


	
}
