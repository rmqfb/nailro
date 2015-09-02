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

import com.nailro.domain.TrainDto;
import com.nailro.serviceImpl.TrainServiceImpl;


@Controller
@RequestMapping(value="/train")
public class TrainController {
	private static final Logger logger = LoggerFactory.getLogger(TrainController.class);

	@Autowired
	TrainServiceImpl trainService;
	
	@RequestMapping(value = "/trainList", method = RequestMethod.GET)
	public String trainHome(Locale locale, Model model) {
		logger.info("열차 컨트롤러", locale);
		model.addAttribute("trainList",trainService.trainList() );
		return "views/train/trainList.tiles";
	}
	
	@RequestMapping(value = "/makerList", method = RequestMethod.GET)
	public String makerHome(Locale locale, Model model) {
		logger.info("제조사 컨트롤러", locale);
		model.addAttribute("makerList",trainService.makerList() );
		return "views/train/makerList.tiles";
	}
	
	@RequestMapping(value = "/trainInputForm")
	public String trainInput(@ModelAttribute TrainDto train,
			Locale locale, Model model,
			@RequestParam(value="trainName")String trainName,
			@RequestParam(value="makerSelect")String makerCode,
			@RequestParam(value="seatCount")int seatCount
			) {
		logger.info("열차입력컨트롤러", locale);
		train.setTrainName(trainName);
		train.setMakerCode(makerCode);
		train.setSeatCount(seatCount);
		logger.info("열차입력 열차이름={},제조사코드={}", trainName,makerCode);
		logger.info("열차입력 인원수={}", seatCount);
		int ok=trainService.insertTrain(train);
		logger.info("열차 입력 성공 ={}",ok);
		return "redirect:/train/trainList";
	
	}
	
	@RequestMapping(value="/trainInput",method = RequestMethod.GET)
	public String trainInputForm(@ModelAttribute TrainDto train,Locale locale, Model model
			){
		logger.info("열차입력폼컨트롤러", locale);
		model.addAttribute("makerList",trainService.makerList() );
		return "views/train/trainform.tiles";
	}
	
	@RequestMapping(value="/trainUpdate",method = RequestMethod.GET)
	public String trainUpdateForm(Locale locale,Model model,@ModelAttribute TrainDto train,
			@RequestParam(value="trainCode")String trainCode,
			@RequestParam(value="trainName")String trainName,
			@RequestParam(value="seatCount")int seatCount,
			@RequestParam(value="makerName")String makerName,
			@RequestParam(value="makerCode")String makerCode
			){
		logger.info("차량수정폼컨트롤러={}",locale);
		logger.info("차량코드={},차량명={}",trainCode,trainName);
		logger.info("승차인원={}",seatCount);
		logger.info("제조사={}",makerName);
		model.addAttribute("trainCode", trainCode);
		model.addAttribute("trainName", trainName);
		model.addAttribute("makerCode", makerCode);
		model.addAttribute("makerList",trainService.makerList());
		model.addAttribute("seatCount", seatCount);
		logger.info("seatcount까지 완료");
		logger.info("makerCode={}",makerCode);
		train.setTrainCode(trainCode);
		logger.info("trainCode까지 완료");
		train.setTrainName(trainName);
		train.setMakerName(makerName);
		
		train.setSeatCount(seatCount);
		logger.info("seatCount까지 완료");
		logger.info("열차 코드 ={}",trainCode);
		return "views/train/trainStatusForm.tiles";
	}
	
	@RequestMapping(value="/trainUpdateForm",method = RequestMethod.POST)
	public String trainUpdate(@ModelAttribute TrainDto train,Locale locale, Model model,
			@RequestParam(value="trainNo")String trainCode,
			@RequestParam(value="trainName")String trainName,
			@RequestParam(value="seatCount")int seatCount,
			@RequestParam(value="makerSelect")String makerSelect,
			@RequestParam(value="makerCode")String makerCode
			){
		logger.info("열차수정컨트롤러", locale);
		logger.info("trainCode={}",trainCode);
		logger.info("trainName={}", trainName);
		logger.info("seatCount={}", seatCount);
		logger.info("makerSelect={}", makerSelect);
		logger.info("makerCode={}", makerCode);
		train.setTrainCode(trainCode);
		train.setTrainName(trainName);
		train.setMakerCode(makerSelect);
		train.setSeatCount(seatCount);
		int ok=trainService.updateTrain(train);
		logger.info("수정성공 : {}",ok);
		return "redirect:/train/trainList";
	}
	
	@RequestMapping(value="/trainDelete")
	public String trainDelete(@ModelAttribute TrainDto train,Locale locale, Model model,
			@RequestParam(value="trainCode")String trainCode){
		logger.info("제조사삭제컨트롤러", locale);
		logger.info("trainCode={}",trainCode);
		train.setTrainCode(trainCode);
		int ok=trainService.deleteTrain(train);
		logger.info("삭제 성공 : {}",ok);
		return "redirect:/train/trainList";
	}
	
	@RequestMapping(value = "/makerInput")
	public String makerInputForm(Locale locale, Model model) {
		logger.info("제조사입력폼컨트롤러", locale);
		return "views/train/makerform.tiles";
	}
	
	@RequestMapping(value="/makerInputForm",method = RequestMethod.GET)
	public String makerInput(@ModelAttribute TrainDto train,Locale locale, Model model,
			@RequestParam(value="makerName")String makerName){
		logger.info("제조사입력 컨트롤러",locale);
		logger.info("makerName={}",makerName);
		train.setMakerName(makerName);
		int ok=trainService.insertMaker(train);
		logger.info("입력 성공 : {}",ok);
		return "redirect:/train/makerList";
	}
	
	@RequestMapping(value="/makerUpdate")
	public String makerUpdateForm(Locale locale,Model model,@ModelAttribute TrainDto train,
			@RequestParam(value="makerCode")String makerCode,
			@RequestParam(value="makerName")String makerName
			){
		logger.info("제조사수정폼컨트롤러={}",locale);
		logger.info("제조사코드={},제조사명={}",makerCode,makerName);
		model.addAttribute("makerCode", makerCode);
		model.addAttribute("makerName", makerName);
		train.setMakerCode(makerCode);
		train.setMakerName(makerName);
		return "views/train/makerStatusForm.tiles";
	}
	@RequestMapping(value="/makerUpdateForm",method = RequestMethod.POST)
	public String makerUpdate(@ModelAttribute TrainDto train,Locale locale,Model model,
			@RequestParam(value="makerCode")String makerCode,
			@RequestParam(value="makerName")String makerName
			){
		logger.info("제조사수정폼컨트롤러={}",locale);
		logger.info("제조사코드={},제조사명={}",makerCode,makerName);
		train.setMakerCode(makerCode);
		train.setMakerName(makerName);
		int ok=trainService.updateMaker(train);
		logger.info("수정성공 : {}",ok);
		return "redirect:/train/makerList";
	}
	@RequestMapping(value="/makerDelete")
	public String makerDelete(@ModelAttribute TrainDto train,Locale locale, Model model,
			@RequestParam(value="makerCode")String makerCode){
		logger.info("제조사삭제컨트롤러", locale);
		logger.info("makerCode={}",makerCode);
		train.setMakerCode(makerCode);
		int ok=trainService.deleteMaker(train);
		logger.info("삭제 성공 : {}",ok);
		return "redirect:/train/makerList";
	}
}
