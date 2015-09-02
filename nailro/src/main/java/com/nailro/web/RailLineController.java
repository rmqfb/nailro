package com.nailro.web;

import java.util.List;
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

import com.nailro.domain.RailLineDto;
import com.nailro.domain.StationDto;
import com.nailro.factory.CommandFactory;
import com.nailro.serviceImpl.RailLineServiceImpl;
import com.nailro.serviceImpl.StationServiceImpl;


@Controller
@RequestMapping(value="/railLine")
public class RailLineController {
	
	private static final Logger logger = LoggerFactory.getLogger(RailLineController.class);

	@Autowired
	RailLineServiceImpl railLineService;
	@Autowired
	StationServiceImpl stationService;
	@Autowired
	List<StationDto> stations;
	
	@RequestMapping(value = "/railLineList", method = RequestMethod.GET)
	public String home(
			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchVal", required = false) String searchVal,
			Locale locale, Model model) {
		logger.info("노선컨트롤러", locale);
		
		/*int PAGESIZE = 1;
		int pageNum = Integer.parseInt(pageNo);
		int start=(Integer.parseInt(pageNo) - 1) * PAGESIZE + 1;
		int end=Integer.parseInt(pageNo) * PAGESIZE;*/
		
		model.addAttribute("list", railLineService.railLineList(CommandFactory.list(Integer.parseInt(pageNo))));
		/*model.addAttribute("count",railLineService.railLineCountAll());*/
		
		return "views/railLine/raillineList.tiles";
	}
	
	@RequestMapping(value = "/railLineInput")
	public String inputForm(@ModelAttribute RailLineDto railDto, Locale locale, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchVal", required = false) String searchVal
			) {
		logger.info("노선입력폼컨트롤러", locale);
		model.addAttribute("stationList", stationService.stationList());
		return "views/railLine/raillineform.tiles";
	}
	
	@RequestMapping(value="/railLineInputForm",method = RequestMethod.POST)
	public String input(
			@ModelAttribute RailLineDto railDto,
			Locale locale,Model model,
			@RequestParam(value="railName")String railName,@RequestParam(value="stationSelect1")String station1
			,@RequestParam(value="stationSelect2")String station2,@RequestParam(value="stationSelect3")String station3
			,@RequestParam(value="stationSelect4")String station4,@RequestParam(value="stationSelect5")String station5
			,@RequestParam(value="stationSelect6")String station6,@RequestParam(value="stationSelect7")String station7
			,@RequestParam(value="stationSelect8")String station8,@RequestParam(value="stationSelect9")String station9
			,@RequestParam(value="stationSelect10")String station10
			){
		logger.info("노선입력컨트롤러", locale);
		
		logger.info("역1={}",station1);
		logger.info("역2={}",station2);
		logger.info("역3={}",station3);
		logger.info("역4={}",station4);
		logger.info("역10={}",station10);
	
		railDto.setLineName(railName);
		railDto.setStation1(station1);
		railDto.setStation2(station2);
		railDto.setStation3(station3);
		railDto.setStation4(station4);
		railDto.setStation5(station5);
		railDto.setStation6(station6);
		railDto.setStation7(station7);
		railDto.setStation8(station8);
		railDto.setStation9(station9);
		railDto.setStation10(station10);
		logger.info("노선 사이즈={}",stations.size());
		int ok=railLineService.insert(railDto);
		logger.info("노선 입력 : {}",ok);
		return "redirect:/railLine/railLineList";
	}
	
	@RequestMapping(value="/railLineUpdate")
	public String updateForm(Locale locale, Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") String pageNo,
			@RequestParam(value="railCode")String railCode,
			@RequestParam(value="railName")String railName
			){
		logger.info("노선수정폼컨트롤러",locale);
		logger.info("raillineCode={}",railCode);
		model.addAttribute("railList", railLineService.railLineList(CommandFactory.list(Integer.parseInt(pageNo))));
		model.addAttribute("railCode", railCode);
		model.addAttribute("railName", railName);
		model.addAttribute("stationList", stationService.stationList());
		/*model.addAttribute("railDetail",railLineService.railLineDetail(CommandFactory.detail(railCode, railName)));*/
	/* 
	역정보에 대한 addAttribute 설정 역1~역10까지 
	 * */
		/*model.addAttribute("station1", stationService.searchByKeyword(id));*/
		/*model.addAttribute("station2", stationService.stationDetail(railCode));
		model.addAttribute("station3", stationService.stationDetail(railCode));
		model.addAttribute("station4", stationService.stationDetail(railCode));
		model.addAttribute("station5", stationService.stationDetail(railCode));
		model.addAttribute("station6", stationService.stationDetail(railCode));
		model.addAttribute("station7", stationService.stationDetail(railCode));
		model.addAttribute("station8", stationService.stationDetail(railCode));
		model.addAttribute("station9", stationService.stationDetail(railCode));
		model.addAttribute("station10", stationService.stationDetail(railCode));*/
			
		return "views/railLine/raillineStatusForm.tiles";
	}
	@RequestMapping(value="/railLineUpdateForm",method = RequestMethod.POST)
	public String update( Locale locale,Model model,@ModelAttribute RailLineDto rail,
			@RequestParam(value="railCode")String railCode,@RequestParam(value="railName")String railName,
			@RequestParam(value="stationSelect1")String station1
			,@RequestParam(value="stationSelect2")String station2,@RequestParam(value="stationSelect3")String station3
			,@RequestParam(value="stationSelect4")String station4,@RequestParam(value="stationSelect5")String station5
			,@RequestParam(value="stationSelect6")String station6,@RequestParam(value="stationSelect7")String station7
			,@RequestParam(value="stationSelect8")String station8,@RequestParam(value="stationSelect9")String station9
			,@RequestParam(value="stationSelect10")String station10
			){
		logger.info("노선수정컨트롤러={}",locale);
		logger.info("raillineCode={}",railCode);
		rail.setLineCode(railCode);
		rail.setLineName(railName);
		rail.setStation1(station1);
		rail.setStation2(station2);
		rail.setStation3(station3);
		rail.setStation4(station4);
		rail.setStation5(station5);
		rail.setStation6(station6);
		rail.setStation7(station7);
		rail.setStation8(station8);
		rail.setStation9(station9);
		rail.setStation10(station10);
		int ok=railLineService.update(rail);
		logger.info("수정 성공 : {}",ok);
		return "redirect:/railLine/railLineList";
	}
	
	@RequestMapping(value="/railLineDelete")
	public String delete(@ModelAttribute RailLineDto rail,Locale locale, Model model,
			@RequestParam(value="railCode")String railCode){
		logger.info("노선삭제컨트롤러", locale);
		logger.info("railCode={}",railCode);
		rail.setLineCode(railCode);
		int ok=railLineService.delete(rail);
		logger.info("삭제 성공 : {}",ok);
		return "redirect:/railLine/railLineList";
	}
}
