package com.nailro.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nailro.domain.EventDto;
import com.nailro.domain.ReserveDto;
import com.nailro.factory.CommandFactory;
import com.nailro.service.EventService;
import com.nailro.util.FileUpload;


@Controller
@RequestMapping("/event")
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired EventDto event;
	@Autowired EventService eventService;

	//패키지 관리자 창
	@RequestMapping("/pkgAdmin")
	public String pkgAdmin(/*@PathVariable("pageNo")String paramPage,*/){
			logger.info("[이벤트컨트롤러]이벤트 관리자 접속");
		return "views/event/event.tiles";
	}		
	
	// 패키지 리스트
	@RequestMapping(value="/pkgList/{pageNo}")
	public @ResponseBody Map<String, Object> pkgList(
			@ModelAttribute EventDto event){
		logger.info("[이벤트컨트롤러]이벤트 리스트");
		Map<String, Object> map = new HashMap<String, Object>();
		List<EventDto> list = new ArrayList<EventDto>();
		String pageNo = String.valueOf(event.getPageNo());
		int count = eventService.count(CommandFactory.count("pageNo",pageNo));
		list = eventService.list(CommandFactory.list(event.getPageNo()));
		map.put("currentPage", pageNo);
		map.put("size", count);
		map.put("list", list);
		return map;
	}
	//패키지등록
		@RequestMapping(value="/pkgInsert",method=RequestMethod.POST)
		public @ResponseBody List<EventDto> pkgInsert(@ModelAttribute EventDto event,
					@RequestParam(value="file") MultipartFile multipartFile){
			logger.info("[이벤트컨트롤러] 패키지상품입력");
			logger.info("[컨트롤러 : 수정] 파일 ={}",multipartFile.toString());
			String path = "G:\\spring\\workspace\\nailro\\src\\main\\webapp\\resources\\image\\event\\";
		
			String fileName = multipartFile.getOriginalFilename();
			FileUpload fileUpload = new FileUpload();
			String fullPath = fileUpload.uploadFile(multipartFile, path, fileName);
			logger.info("[이벤트컨트롤러] 파일이름 ={}",fileName);
			event.setPath(fileName);
			logger.info("[이벤트컨트롤러] 파일업로드 경로 ={}",fullPath);
			int ok= eventService.insert(event);
			logger.info("[이벤트컨트롤러] 패키지상품 저장 확인={}",ok);
			String pageNo = String.valueOf(event.getPageNo());
			int count = eventService.count(CommandFactory.count("pageNo",pageNo));
			return eventService.list(CommandFactory.list(1));
		}
	//패키지삭제
	@RequestMapping(value="/pkgDelete/{key}")
	public @ResponseBody List<EventDto> pkgDelete(@PathVariable(value="key")String key){
		logger.info("[이벤트컨트롤러] 패키지삭제 key ={}",key);
		int ok =eventService.delete(key);
		logger.info("[이벤트컨트롤러] 패키지 삭제 여부:{}",ok);
		String pageNo = String.valueOf(event.getPageNo());
		int count = eventService.count(CommandFactory.count("pageNo",pageNo));
		return eventService.list(CommandFactory.list(1));
	}
	//패키지 수정조회
	@RequestMapping(value="/pkgDetail/{pkgKey}")
	public @ResponseBody EventDto pkgDetail(
											@PathVariable(value="pkgKey")String pkgKey){
		logger.info("[이벤트컨트롤러] 패키지수정 key ={}",pkgKey);
	//mav.addObject("pkg",eventService.detail(CommandFactory.detail("pkgCode", key)));		
		return eventService.detail(CommandFactory.detail(pkgKey, pkgKey));
	}
	//패키지 수정
	@RequestMapping(value="/pkgUpdate")
	public @ResponseBody List<EventDto> pkgUpdate(@ModelAttribute EventDto event){
		logger.info("[이벤트컨트롤러] 패키지 수정");
		logger.info("[패키지컨트롤러] 패키지 코드넘버 ={}",event.getPkgCode());
		logger.info("[패키지컨트롤러] 패키지 지역넘버 ={}",event.getAreaCode());
		int ok = eventService.update(event);
		String pageNo = String.valueOf(event.getPageNo());
		int count = eventService.count(CommandFactory.count("pageNo",pageNo));
		return eventService.list(CommandFactory.list(event.getPageNo()));
	}
/************* 숙 소 **************************************************************/	
	// 숙소정보 보기
	@RequestMapping(value="/mtInfo",method = RequestMethod.GET) 
	public String mtinfo(@RequestParam(value="pageNo",defaultValue="1")String paramPage,
									Model model){ 
		int pageNo= Integer.parseInt(paramPage);
		logger.info("[이벤트컨트롤러] 숙소정보 ");
		model.addAttribute("mtList",eventService.mtList(CommandFactory.list(pageNo)));
		return "event/mtView.jsp";
	}
	//숙소 리스트 
	@RequestMapping(value="/mtList") 
	public @ResponseBody List<EventDto> mtList(@RequestParam(value="pageNo",defaultValue="1")String paramPage,
									Model model){ 
		int pageNo= Integer.parseInt(paramPage);
		logger.info("[이벤트컨트롤러] 숙소정보 ");
		return eventService.mtList(CommandFactory.list(pageNo));
	}
	@RequestMapping(value="/mtInputForm",method = RequestMethod.GET)
	public String mtInputForm(ModelAndView mav){
		logger.info("[이벤트컨트롤러] 숙소입력");
		return "event/mtInsertForm.jsp";
	}
	//숙소입력
	@RequestMapping(value="/mtInsert",method = RequestMethod.POST)
	public String mtInsert(@ModelAttribute EventDto event,
										   ModelAndView mav){
		event.setMtPhone(event.getMtPhone1()+"-"+event.getMtPhone2()+"-"+event.getMtPhone3());
		logger.info("[이벤트컨트롤러] 입력숙소코드={}",event.getMtCode());
		logger.info("[이벤트컨트롤러] 입력숙소이름={}",event.getMtName());
		int ok = eventService.mtInsert(event);
		logger.info("[이벤트컨트롤러] 숙소저장 여부:{}",ok);
		return "redirect:/event/mtInfo";
		
	}
	//숙소삭제
	@RequestMapping(value="/mtDelete/{key}")
	public String mtDelet(@PathVariable("key")String key){
		logger.info("[이벤트컨트롤러] 삭제 key ={}",key);
		int ok =eventService.mtDelete(key);
		logger.info("[이벤트컨트롤러] 숙소정보 삭제 여부:{}",ok);
		return "redirect:/event/mtInfo";
	}
	
	//숙소수정폼으로 이동
	@RequestMapping("/mtRevisionForm/{key}")
	public String mtRevisionForm(@ModelAttribute EventDto event,
													@PathVariable("key")String key,
													Model model){
		logger.info("[이벤트컨트롤러]숙소수정 key={}",key);
		model.addAttribute("mt",eventService.mtDetail(CommandFactory.detail("mtCode",key)));
		return  "event/mtUpdateForm.jsp";
	}
	
	//숙소수정
	@RequestMapping(value="/mtRevision",method=RequestMethod.POST)
	public String mtRevision(@ModelAttribute EventDto event){
		logger.info("[이벤트컨트롤러]숙소수정 key={}",event.getMtCode());
		int ok = eventService.mtUpdate(event);
		logger.info("[이벤트컨트롤러]숙소수정 여부",ok);
		return  "redirect:/event/mtInfo";
	}

	/***************** 판매자 *****************/
	// 판매자 리스트
	@RequestMapping("/salerList")
	public @ResponseBody List<EventDto> salerList(){
		int pageNo =1 ;
		logger.info("[이벤트컨트롤러]판매자리스트");
		return eventService.salerList(CommandFactory.list(pageNo));
	}
	//판매자 수정조회
	@RequestMapping(value="/salerDetail/{Key}")
	public @ResponseBody EventDto salerDetail(
											@PathVariable(value="Key")String Key){
		logger.info("[이벤트컨트롤러] 판매자수정 key ={}",Key);
		return eventService.salerDetail(CommandFactory.detail(Key,Key));
	}
	//판매자 삭제
	@RequestMapping("/salerDelete/{key}")
	public @ResponseBody List<EventDto> salerDelete(@PathVariable(value="key")String key){
		logger.info("[이벤트컨트롤러] 판매자삭제 key ={}",key);
		eventService.salerDelete(key);
		int param1 = 1;
		return eventService.salerList(CommandFactory.list(param1));
	}
	// 판매자 입력 
	@RequestMapping("/salerInsert")
	public @ResponseBody List<EventDto> salerInsert(@ModelAttribute EventDto event){
		logger.info("[이벤트컨트롤러] 판매자등록");
		int ok = eventService.salerInsert(event);
		logger.info("[이벤트컨트롤러] 판매자등록 성공={}",ok);
		int param1 = 1;
		return eventService.salerList(CommandFactory.list(param1));
	}
	// 판매자 수정 
		@RequestMapping("/salerUpdate")
		public @ResponseBody List<EventDto> salerUpdate(@ModelAttribute EventDto event){
			logger.info("[이벤트컨트롤러] 판매자수정");
			logger.info("[이벤트컨트롤러] salerCode={}",event.getSalerCode());
			logger.info("[이벤트컨트롤러] salerName={}",event.getSalerName());
			logger.info("[이벤트컨트롤러] salerPhone={}",event.getSalerPhone());
			int ok = eventService.salerUpdate(event);
			logger.info("[이벤트컨트롤러] 판매자등록 성공={}",ok);
			int param1 = 1;
			return eventService.salerList(CommandFactory.list(param1));
		}
/*************사용자**************/
	//패키지 유저홈이동	
	@RequestMapping(value="/pkgHome")
	public String pkgHome(ModelAndView mav){
		logger.info("[ 이벤트컨트롤러 ] 메인 접속");
		return "event/eventUser.tiles";
	}
	//패키지 랭크
	@RequestMapping(value="/pkgRank")
	public @ResponseBody List<EventDto> pkgRank(){
		logger.info("[ 이벤트컨트롤러 ] 랭크");
		int param1 = 1;
		return eventService.pkgRank(CommandFactory.list(param1));
	}
	
	// 사용자  전체  상품 리스트
	@RequestMapping("/goodsList")
	public @ResponseBody List<EventDto> goodsList(){
		logger.info("[이벤트컨트롤러] 사용자 리스트");		
		
		return eventService.goodsList(CommandFactory.list(1));
	}
	// 사용자 예매 및 결제 하기
	@RequestMapping("/pkgReserve/{reservNo}/{pkgCode}/{userid}/{startDate}/{pay}")
	public @ResponseBody List<EventDto> pkgReserve(@PathVariable("reservNo")String reservNo,
																			@PathVariable("pkgCode")String pkgCode,
																			@PathVariable("userid")String userid,
																			@PathVariable("startDate")String startDate,
																			@PathVariable("pay")String pay){
		logger.info("[이벤트컨트롤러] 사용자 예매 입력");	
		event.setReserveCode(reservNo);
		event.setPkgCode(pkgCode);
		event.setUserid(userid);
		event.setStartDate(startDate);
		event.setPkgPrice(Integer.parseInt(pay));
		eventService.ReserveInsert(event);
		
		logger.info("insert 확인");
		return eventService.pkgCheck(CommandFactory.detail(userid, userid));
	}	
	@RequestMapping(value="/userDetail/{pkgCode}")
	public @ResponseBody EventDto userDetail(@PathVariable("pkgCode")String key){
		logger.info("[이벤트컨트롤러] 상품 상세정보");
		return eventService.userDetail(CommandFactory.detail(key, key));
	}
	@RequestMapping(value="/pkgCheck/{userId}")
	public @ResponseBody List<EventDto> pkgCheck(@PathVariable("userId")String userid){
		logger.info("[이벤트컨트롤러] id={} 예약확인",userid);
		
		return eventService.pkgCheck(CommandFactory.detail(userid, userid));
	}
/*
	@RequestMapping(value="/userForm",method = RequestMethod.POST)
	public String userForm(ModelAndView mav){
		logger.info("[ 이벤트컨트롤러 ] 예약창 접속");
		return "event/userForm.tiles";
	}*/
	/*헤더에서 이벤트 뷰로 이동*/
	@RequestMapping(value="/pkgReserveView")
	public String pkgcancleForm(ModelAndView mav){
		logger.info("[이벤트컨트롤러] 예약확인&취소창");
		return "event/pkgReserveView.tiles";
	}
	/*패키지예매리스트*/
	@RequestMapping(value="/pkgTrainReList")
	public @ResponseBody List<ReserveDto> pkgTrainReList(){
		logger.info("[이벤트컨트롤러] 패키지예매리스트");
		return eventService.pkgTrainReList();
	}
	//패키지예약 삭제 
	@RequestMapping(value="/pkgCancel/{pkgKeepCode}")
	public @ResponseBody List<EventDto> pkgUserDelete(
				@PathVariable("pkgKeepCode")String pkgKeepCode) {
		logger.info("[이벤트컨트롤러] 예약삭제 userId ={} 예약코드번호={}",pkgKeepCode);
		int ok = eventService.pkgCancel(pkgKeepCode);
		logger.info("[이벤트컨트롤러]삭제성공여부 :{}",ok);
		String userId = "m3";
		return eventService.pkgCheck(CommandFactory.detail(userId, userId));
	}
	//패지키 예약 갯수
	@RequestMapping(value="/pkgReserveCount/{userId}")
	public @ResponseBody int pkgReserveCount(@PathVariable("userId")String userId,
												Model model) {
		int count = eventService.pkgReserveCount(userId);
		logger.info("[이벤트컨트롤러] 갯수:{}",count);
		model.addAttribute(count);
		return count;
	}
		
}
