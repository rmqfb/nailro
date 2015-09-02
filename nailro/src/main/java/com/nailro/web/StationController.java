package com.nailro.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nailro.domain.StationDto;
import com.nailro.serviceImpl.StationServiceImpl;

@Controller
@RequestMapping(value="/station")
public class StationController {
	
	private static final Logger logger = LoggerFactory.getLogger(StationController.class);
	
	@Autowired
	StationServiceImpl stationService;
	
	@RequestMapping(value = "/stationList", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("역컨트롤러", locale);
		model.addAttribute("stationList",stationService.stationList());
		return "views/station/stationList.tiles";
	}
	
	@RequestMapping(value = "/stationInput")
	public String inputForm(Locale locale, Model model) {
		logger.info("역입력폼컨트롤러", locale);
		return "views/station/stationform.tiles";
	}

	@RequestMapping(value="/stationInputForm",method = RequestMethod.POST)
	public String input(@ModelAttribute StationDto station,Locale locale, Model model,
			@RequestParam(value="stationName")String stationName,@RequestParam(value="distance")int distance
			){
		logger.info("역입력컨트롤러", locale);
		logger.info("distance={}", distance);
		logger.info("stationName={}", stationName);
		station.setStationName(stationName);
		station.setDistance(distance);
		int ok= stationService.insertStation(station);
		logger.info("입력 성공 : {}",ok);
		/*return "views/station/stationList.tiles";*/
		return "redirect:/station/stationList";
	}
	
	@RequestMapping(value="/stationUpdateForm",method = RequestMethod.POST)
	public String update(@ModelAttribute StationDto station,Locale locale, Model model,
			@RequestParam(value="stationCode")String stationCode ,
			@RequestParam(value="stationName")String stationName,@RequestParam(value="distance")int distance){
		logger.info("역수정컨트롤러", locale);
		logger.info("stationCode={}",stationCode);
		logger.info("distance={}", distance);
		logger.info("stationName={}", stationName);
		station.setStationCode(stationCode);
		station.setStationName(stationName);
		station.setDistance(distance);
		int ok=stationService.updateStation(station);
		logger.info("수정 성공 : {}",ok);
		return "redirect:/station/stationList";
	}
	
	@RequestMapping(value = "/stationUpdate")
	public String updateForm(Locale locale, Model model,@ModelAttribute StationDto station,
			@RequestParam(value="stationCode")String stationCode ,
			@RequestParam(value="stationName")String stationName,@RequestParam(value="distance")int distance) {
		logger.info("역수정폼컨트롤러", locale);
		logger.info("stationCode={}",stationCode);
		logger.info("distance={}", distance);
		logger.info("stationName={}", stationName);
		model.addAttribute("stationCode",stationCode);
		model.addAttribute("distance",distance);
		model.addAttribute("stationName",stationName);
		station.setStationCode(stationCode);
		station.setStationName(stationName);
		station.setDistance(distance);
		return "views/station/stationStatusForm.tiles";
	}
	
	@RequestMapping(value="/stationDelete")
	public String delete(@ModelAttribute StationDto station,Locale locale, Model model,
			@RequestParam(value="stationCode")String stationCode){
		logger.info("역삭제컨트롤러", locale);
		logger.info("stationCode={}",stationCode);
		station.setStationCode(stationCode);
		int ok=stationService.deleteStation(station);
		logger.info("삭제 성공 : {}",ok);
		return "redirect:/station/stationList";
	}
}
