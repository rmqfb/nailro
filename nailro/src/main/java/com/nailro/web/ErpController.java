package com.nailro.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nailro.domain.MemberDto;
import com.nailro.domain.ReserveDto;
import com.nailro.domain.RunTrainDto;
import com.nailro.factory.CommandFactory;
import com.nailro.service.ErpService;
import com.nailro.service.RailLineService;
import com.nailro.service.TrainService;


@Controller
@SessionAttributes("user")
@RequestMapping("/erp")
public class ErpController {
	
	private static final Logger logger = LoggerFactory.getLogger(ErpController.class);
	
	@Autowired ErpService erpService;
	@Autowired ReserveDto reserveDto;
	@Autowired RunTrainDto runTrain;
	/*노선서비스*/
	@Autowired RailLineService railLineService;
	/*열차서비스*/
	@Autowired TrainService trainService;
	
	@RequestMapping("/reserve")
	public String erpMain(Model model) {
		logger.info("메인지나가는중");
		
		return "erp/erpMain.tiles";
	}
	/*home 에서 옴운행열차 폼*/
	@RequestMapping(value="/homereserve",method=RequestMethod.POST)
	public String homeErpMain(@ModelAttribute ReserveDto reserveDto,Model model){
		logger.info("reserve지나가는중");
		model.addAttribute("startStation",reserveDto.getStartStation());
		model.addAttribute("endStation", reserveDto.getEndStation());
		model.addAttribute("startDate", reserveDto.getStartDate().replaceAll("/", ""));
		return "erp/erpMain.tiles";
	}
	/*운행열차 폼*/
	@RequestMapping(value="/runTrainWirteForm")
	public String runTrainWirteForm(@ModelAttribute RunTrainDto runTrain){
		logger.info("runTrainWirteForm지나가는중");
		return "views/erp/runTrainmain.tiles";
	}
	
	/*운행열차 select뽑아오기*/
	@RequestMapping(value="/runTrainSelectList")
	public @ResponseBody Map<String, Object> runTrainSelectList(@ModelAttribute RunTrainDto runTrain){
		logger.info("runTrainSelectList지나가는중");
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("railLine", railLineService.railLineList(CommandFactory.list(Integer.parseInt("1"))));
		map.put("train",trainService.trainList());
		return map;
	}
	/*운행열차 인서트*/
	@RequestMapping(value="/runTrainWirte/{runTrainCode}/{runTimeCode}/{railLineCode}/{trainCode}/{runTrainDate}")
	public @ResponseBody String runTrainWirte(@PathVariable String runTrainCode,@PathVariable String runTimeCode
			,@PathVariable String railLineCode
			,@PathVariable String trainCode
			,@PathVariable String runTrainDate){
		logger.info(runTrainCode);
		logger.info(railLineCode);
		logger.info(runTimeCode);
		logger.info(runTrainDate);
		logger.info(trainCode);
		runTrain.setRunTrainCode(runTrainCode);
		runTrain.setRailLineCode(railLineCode);
		runTrain.setRunTimeCode(runTimeCode);
		runTrain.setRunTrainDate(runTrainDate.replaceAll("-", ""));
		runTrain.setTrainCode(trainCode);
		int ok = erpService.runTraininsert(runTrain);
		return "1";
	}
	/*운행열차 뽑아오기
	@RequestMapping(value="/trainList/{startDate}/{startStation}/{endStation}")
	public @ResponseBody List<ReserveDto> trainList(@ModelAttribute ReserveDto reserveDto){
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		reserveDto.setStartDate(reserveDto.getStartDate().replace("/", ""));
		list = erpService.runtrain(reserveDto);
		
		return list;
	}*/
	
	/*운행열차 뽑아오기*/
	@RequestMapping(value="/trainList/{startDate}/{startStation}/{endStation}")
	public @ResponseBody List<ReserveDto> trainList(@ModelAttribute ReserveDto reserveDto){
		String startTime ;
		String endTime;
		String trainDate;
		String trainCode;
		String searchKey;
		String searchVal;
		int destance;
		ReserveDto reserveD;
		
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		ArrayList<ReserveDto> listInfo = new ArrayList<ReserveDto>();
		ReserveDto reserve = new ReserveDto();
		reserveDto.setStartDate(reserveDto.getStartDate().replace("/", ""));
		list = erpService.runtrain(reserveDto);
		/*운행열차 코드번호 뽑아와서  그역이 정차하는 역코드를 역명으로 변경*/
		switch (reserveDto.getStartStation()) {
		case "st10": reserveDto.setStartStation("서울");break;
		case "st20":reserveDto.setStartStation("부산"); break;
		case "st30":reserveDto.setStartStation("대전"); break;
		case "st40":reserveDto.setStartStation("대구");break;

		default:
			break;
		}
		switch (reserveDto.getEndStation()) {
		case "st10": reserveDto.setEndStation("서울");break;
		case "st20":reserveDto.setEndStation("부산"); break;
		case "st30":reserveDto.setEndStation("대전"); break;
		case "st40":reserveDto.setEndStation("대구");break;

		default:
			break;
		}
		
		logger.info("첫번째 배열값 = {}", list.get(0).getTrainCode());
		logger.info("출발역 = {}",reserveDto.getStartStation());
		logger.info("도착역 = {}",reserveDto.getEndStation());
		
		for (int i = 0; i < list.size(); i++) {
			searchVal = list.get(i).getTrainCode();
			searchKey = "TRAIN_CODE";
			reserveD = erpService.selectTrainTime(CommandFactory.detail(searchKey, searchVal));  /*차량코드로 가져온 차량 운행시간*/
			trainDate = reserveD.getRunTrainCode();
			trainCode = reserveD.getTrainCode();
		
			reserveDto.setTrainTime(trainDate);
			reserveDto.setTrainCode(trainCode);
			switch (reserveDto.getStartStation()) {
			case "서울": 	reserveDto.setStart("STN_1_TIME");	break;
			case "대전":	reserveDto.setStart("STN_3_TIME");	break;
			case "대구":	reserveDto.setStart("STN_7_TIME");	break;
			case "부산": 	reserveDto.setStart("STN_10_TIME");break;
			default:break;
			}
			switch (reserveDto.getEndStation()) {
			case "서울": 	reserveDto.setEnd("STN_1_TIME");	break;
			case "대전":	reserveDto.setEnd("STN_3_TIME");	break;
			case "대구":	reserveDto.setEnd("STN_7_TIME");	break;
			case "부산": 	reserveDto.setEnd("STN_10_TIME");	break;
			default:break;
			}
			logger.info("출발역코드 = {}",reserveDto.getStart());
			logger.info("도착역코드 = {}",reserveDto.getEnd());
			logger.info("열차시간 = {}",reserveDto.getTrainTime());
			reserveD = erpService.selectRunTime(reserveDto);
			startTime = reserveD.getStartTime();
			endTime = reserveD.getEndTime();
			startTime = startTime.substring(11, 19);
			endTime = endTime.substring(11, 19);
			logger.info("시간 = {}4",reserve.getStartDate());
			logger.info("열차 출발차량시간코드 : {}",trainDate);
			logger.info("열차 출발시간 : {} 도착시간 : {}", startTime, endTime);
			
			searchKey = "station_name";
			searchVal = reserveDto.getEndStation()+"역";
			logger.info("검색역 = {}", searchVal);
			destance=erpService.destance(CommandFactory.detail(searchKey, searchVal)).getPay();
			
			reserveDto.setStartTime(startTime);
			reserveDto.setEndTime(endTime);
			reserveDto.setPay(destance*100);
			logger.info("{}까지의 가격{}",reserveDto.getEndStation(), reserveDto.getPay());
			ReserveDto vo = new ReserveDto();
			vo.setTrainCode(reserveDto.getTrainCode());
			vo.setStartDate(reserveDto.getStartDate());
			vo.setStartStation(reserveDto.getStartStation());
			vo.setStartTime(reserveDto.getStartTime());
			vo.setEndStation(reserveDto.getEndStation());
			vo.setEndTime(reserveDto.getEndTime());
			vo.setPay(reserveDto.getPay());
			listInfo.add(vo);
			logger.info("메모리 참조값={}",listInfo.get(i).toString());
			logger.info("역코드={}, 출발일={}",	listInfo.get(i).getTrainCode(),listInfo.get(i).getStartDate());
			logger.info("출발역={}, 도착역={}",	listInfo.get(i).getStartStation(),listInfo.get(i).getEndStation());
			logger.info("운임요금={}, 출발시간={}", listInfo.get(i).getPay(),listInfo.get(i).getStartTime());
			logger.info("도착시간={}",	listInfo.get(i).getEndTime());
			/*logger.info("역코드={}, 출발일={}",	reserveDto.getTrainCode(),reserveDto.getStartDate());
			logger.info("출발역={}, 도착역={}",	reserveDto.getStartStation(),reserveDto.getEndStation());
			logger.info("운임요금={}, 출발시간={}", reserveDto.getPay(),reserveDto.getStartTime());
			logger.info("도착시간={}",	reserveDto.getEndTime());*/
			
		}
		logger.info("역코드={}, 출발일={}",	listInfo.get(0).getTrainCode(),listInfo.get(0).getStartDate());
		logger.info("출발역={}, 도착역={}",	listInfo.get(0).getStartStation(),listInfo.get(0).getEndStation());
		logger.info("운임요금={}, 출발시간={}", listInfo.get(0).getPay(),listInfo.get(0).getStartTime());
		logger.info("도착시간={}",	listInfo.get(0).getEndTime());
		
		logger.info("역코드={}, 출발일={}",	listInfo.get(1).getTrainCode(),listInfo.get(1).getStartDate());
		logger.info("출발역={}, 도착역={}",	listInfo.get(1).getStartStation(),listInfo.get(1).getEndStation());
		logger.info("운임요금={}, 출발시간={}", listInfo.get(1).getPay(),listInfo.get(1).getStartTime());
		logger.info("도착시간={}",	listInfo.get(1).getEndTime());
		
		logger.info("역코드={}, 출발일={}",	listInfo.get(2).getTrainCode(),listInfo.get(2).getStartDate());
		logger.info("출발역={}, 도착역={}",	listInfo.get(2).getStartStation(),listInfo.get(2).getEndStation());
		logger.info("운임요금={}, 출발시간={}", listInfo.get(2).getPay(),listInfo.get(2).getStartTime());
		logger.info("도착시간={}",	listInfo.get(2).getEndTime());
		
		
		return listInfo;
	}
	/* admin 운행열차 뽑아오기*/
	@RequestMapping(value="/admintrainList")
	public @ResponseBody List<RunTrainDto> trainList(){
		List<RunTrainDto> list = new ArrayList<RunTrainDto>();
		list = erpService.runTrainlist();
		
		return list;
	}
	/* admin 운행열차 삭제하기*/
	@RequestMapping(value="/runtrainRemove/{runTrainCode}")
	public @ResponseBody Integer trainList(@ModelAttribute RunTrainDto runTrain){
		
		int ok = erpService.runTrainRemove(runTrain);
		return ok;
	}
	/*예매확인*/
	@RequestMapping(value="/infoMain")
	public String infoMain(){
		logger.info("예매 확인 이동중");
		return "erp/infoMain.tiles";
	}
	/*예매정보 출력(파라미터값 존재할경우)*/
	@RequestMapping(value="/infoForm")
	public String infoForm(/*@RequestParam("startStation") String startStation,
			@RequestParam("arriveStation")String arriveStation,
			@RequestParam("date")String date,
			@RequestParam("time")String time,
			@RequestParam("people")String people,*/
			Model model){
			/*logger.info("예매정보 출력");
			reserveDto.setStartStation(startStation);
			reserveDto.setArriveStation(arriveStation);
			reserveDto.setDate(date);
			reserveDto.setTime(time);
			reserveDto.setPeople(people);
			erpService.selectList(reserveDto);*/
			return "erp/infoForm.tiles";
	}
	/*사이드메뉴바 예매하기 (파라미터값이 없는경우)*/
	@RequestMapping(value="/infoFormSnb.nr")
	public String infoFormSnb(Model model){
		return "erp/infoForm.tiles";
	}

	/*좌석정보 출력*/
	@RequestMapping(value="/seatSelect.nr")
	public String seatSelect(
			Model model){
			logger.info("좌석정보 출력");
			
			return "erp/seatSelect.tiles";
	}
	/*결제선택*/
	@RequestMapping(value="/reserveSelect.nr")
	public String reserveSelect(
			Model model){
			logger.info("예매선택 출력");
			
			return "erp/reserveSelect.tiles";
	}
	/*예매 확인*/
	@RequestMapping(value="/reserveInfo")
	public @ResponseBody List<ReserveDto> reserveInfo(@RequestParam(value="id",defaultValue="m01")String id,
			/*@ModelAttribute("user")  MemberDto memberDto,*/
			Model model){
		
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		List<ReserveDto> listDate = new ArrayList<ReserveDto>();
		
			logger.info("예매 확인");
				String searchKey = "id", searchVal = id;
				reserveDto.setId(id);
				list=erpService.select(CommandFactory.detail(searchKey, reserveDto.getId()));
				String startDate ;
				String startTime ;
				String endTime ;
				for (int i = 0; i < list.size(); i++) {
					ReserveDto reserve = new ReserveDto();
					reserve = list.get(i);
					startDate = list.get(i).getStartTime().substring(0, 10);
					startTime = list.get(i).getStartTime().substring(11, 16);
					endTime = list.get(i).getEndTime().substring(11, 16);
					reserve.setStartDate(startDate);
					reserve.setStartTime(startTime);
					reserve.setEndTime(endTime);
					listDate.add(i, reserve);
				}
				String train = list.get(0).getTrainNo();
				logger.info("트레인코드 넘어오나?={}",train);
				return listDate;
	}
	/*예매 취소*/
	@RequestMapping(value="/reserveCancel/{reserveNo}/{trainNo}")
	public @ResponseBody List<ReserveDto> reserveCancel(@RequestParam(value="id",defaultValue="m01")String id,
			@PathVariable("reserveNo")String reserveNo,
			@PathVariable("trainNo")String trainNo,
			Model model){
		List<ReserveDto>reserveList = new ArrayList<ReserveDto>();
		logger.info("예매 취소");
		String searchKey = "reseve_code", searchVal =reserveNo; 
		reserveDto.setReseveCode(reserveNo);
		String seatNum = erpService.seatNum(CommandFactory.detail(searchKey, searchVal)).getSeatNum();
		logger.info("추출된 좌석번호 = {}",seatNum);
		int confirm=erpService.delete(CommandFactory.detail(searchKey, searchVal));
		logger.info("취소키 ={}, 취소벨류={} ",searchKey, searchVal);
		
		searchKey=seatNum;
		searchVal=trainNo;
		
		erpService.deleteSeat(CommandFactory.detail(searchKey, searchVal));
		if (confirm == 1) {
			logger.info("예매반환 성공");
		} else {
			logger.info("예매반환 실패");
		}
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		List<ReserveDto> listDate = new ArrayList<ReserveDto>();
		
			logger.info("예매 확인");
				searchKey = "id";
				searchVal = id;
				reserveDto.setId(id);
				list=erpService.select(CommandFactory.detail(searchKey, reserveDto.getId()));
				String startDate ;
				String startTime ;
				String endTime ;
				for (int i = 0; i < list.size(); i++) {
					ReserveDto reserve = new ReserveDto();
					reserve = list.get(i);
					startDate = list.get(i).getStartTime().substring(0, 10);
					startTime = list.get(i).getStartTime().substring(11, 16);
					endTime = list.get(i).getEndTime().substring(11, 16);
					reserve.setStartDate(startDate);
					reserve.setStartTime(startTime);
					reserve.setEndTime(endTime);
					listDate.add(i, reserve);
				}
		return listDate;
	}
	/*예매관리*/
	@RequestMapping(value="/reserveAdmin",method=RequestMethod.GET)
	public String reserveAdmin(){
		logger.info("reserveAdminMain 지나는중");
		return "views/erp/reserveAdminMain.tiles";
	}
	/*수익관리폼*/
	@RequestMapping(value="/grossprofitAdmin/{carselect}",method = RequestMethod.GET)
	public ModelAndView profit(Model model,
			@PathVariable(value="carselect")String trainType,ModelAndView modelAndView) {
		logger.info("수익관리폼 ={}",trainType);
		
		modelAndView.setViewName("views/erp/grossprofitAdmin.tiles");
		return modelAndView;
	}
	/*수익관리*/
	@RequestMapping(value="/grossprofitAdmin",method = RequestMethod.GET)
	public @ResponseBody Map<String,String> profit1(Model model,
			@RequestParam(value="carselect",defaultValue="all")String trainType){
		logger.info("수익관리 찾는정보 map ={}",trainType);
		Map<String, String>map = new HashMap<String, String>();
		
			map=erpService.profit(trainType);	
		return map;
	}
	
	
	/*예매하기*/
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	
	public @ResponseBody ReserveDto insert(
			@ModelAttribute ReserveDto reserveDto
			){
		
		logger.info("차량코드 = {}",reserveDto.getTrainCode());
		logger.info("시간 = {}1",reserveDto.getStartDate());
		logger.info("출발역 = {}",reserveDto.getStartStation());
		logger.info("도착역 = {}",reserveDto.getEndStation());
		logger.info("좌석 = {}",reserveDto.getSeatNum());
		logger.info("좌석 = {}",reserveDto.getId());
		/*String startStation = reserve.getStartStation();
		startStation = startStation + "역";
		String endStation = reserve.getEndStation();
		endStation = endStation + "역";
		reserve.setStartStation(startStation);
		reserve.setEndStation(endStation);*/
		String startTime ;
		String endTime;
		logger.info("시간 = {}2",reserveDto.getStartDate());
		/*reserveD = erpService.selectTrainTime(CommandFactory.detail(searchKey, searchVal));  차량코드로 가져온 차량 운행시간*/
		
		
		
		switch (reserveDto.getStartStation()) {
		case "서울": 	reserveDto.setStart("STN_1_TIME");	break;
		case "대전":	reserveDto.setStart("STN_3_TIME");	break;
		case "대구":	reserveDto.setStart("STN_7_TIME");	break;
		case "부산": 	reserveDto.setStart("STN_10_TIME");break;
		default:break;
		}
		switch (reserveDto.getEndStation()) {
		case "서울": 	reserveDto.setEnd("STN_1_TIME");	break;
		case "대전":	reserveDto.setEnd("STN_3_TIME");	break;
		case "대구":	reserveDto.setEnd("STN_7_TIME");	break;
		case "부산": 	reserveDto.setEnd("STN_10_TIME");	break;
		default:break;
		}
		logger.info("출발역코드 = {}",reserveDto.getStartStation());
		logger.info("도착역코드 = {}",reserveDto.getEndStation());
		
		logger.info("시간 = {}4",reserveDto.getStartDate());
		logger.info("열차 출발시간 : {} 도착시간 : {}", reserveDto.getStartTime(), reserveDto.getEndTime());
		startTime = reserveDto.getStartDate() + " " + reserveDto.getStartTime();
		endTime = reserveDto.getStartDate() + " " + reserveDto.getEndTime();
		logger.info("열차 출발시간 : {} 도착시간 : {}", startTime, endTime);
		reserveDto.setStartTime(startTime);
		reserveDto.setEndTime(endTime);
		logger.info("시간 = {}5",reserveDto.getStartDate());
		int a;
		
		a = erpService.insertSeat(reserveDto);
		logger.info("좌석 예매 = {}",a);
		a = erpService.insert(reserveDto);
		logger.info("좌석 예매 = {}",a);
		logger.info("좌석번호 = {}", reserveDto.getSeatNum());
		return reserveDto;
	}
	
	/*좌석선택*/
	@RequestMapping(value="/seatSel/{trainCode}/{index}",method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> seatSel(
		@PathVariable("trainCode") String trainCode,
		@PathVariable("index")String index){
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		String searchKey = "run_train_code";
		String searchVal = trainCode;
		logger.info("좌석번호 추출 열차번호 = {}",trainCode);
		reserveDto = erpService.selectTrainTime(CommandFactory.detail(searchKey, searchVal));
		logger.info("운행열차코드 = {}", reserveDto.getTrainCode());
		searchKey = "run_train_code";
		searchVal = reserveDto.getTrainCode();
		list=erpService.seatSel(CommandFactory.detail(searchKey, searchVal));
		
		int j = 32 - list.size();
		for (int i = 0; i < j; i++) {
			ReserveDto reserve = new ReserveDto();
			list.add(reserve);
		}
		logger.info("배열 크기 = {}",list.size());
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("index", index);
		return map;
	}
	
	/*좌석선택 폼*/
	@RequestMapping(value="/seatSelTiles/{trainCode}/{index}",method=RequestMethod.GET)
	public String seatSelTiles(
		@PathVariable("trainCode") String trainCode,
		@PathVariable("index") String index,
		ModelAndView mav){
		logger.info("차량코드 = {}", trainCode);
		mav.addObject("trainCode", trainCode);
		mav.addObject("index", index);
		return "erp/seat.jsp";
	}
	
	
	/*예매관리*/
	@RequestMapping(value="/rsrvAdminInfo/{pageNo}",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> reserveAdminInfo(
			@PathVariable("pageNo") int pageNo){
		Map<String, Object>map = new HashMap<String,Object>();
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		List<ReserveDto> list2 = new ArrayList<ReserveDto>();
		List<ReserveDto> listDate = new ArrayList<ReserveDto>();
		logger.info("예매 확인");
		
		list=erpService.reserveAdmin(CommandFactory.list(pageNo));
		String startDate ;
		String startTime ;
		String endTime ;
		for (int i = 0; i < list.size(); i++) {
			ReserveDto reserve = new ReserveDto();
			reserve = list.get(i);
			startDate = list.get(i).getStartTime().substring(0, 10);
			startTime = list.get(i).getStartTime().substring(11, 16);
			endTime = list.get(i).getEndTime().substring(11, 16);
			reserve.setStartDate(startDate);
			reserve.setStartTime(startTime);
			reserve.setEndTime(endTime);
			listDate.add(i, reserve);
			
		}
		int num = 10 - listDate.size();
		logger.info("배열 사이즈 = {}", num);
		logger.info("listDate 사이즈 = {}",listDate.size());
		for (int j = 0; j < num; j++) {
			ReserveDto listNull = new ReserveDto();
			listDate.add(listNull);
		}
		
		logger.info("listDate 사이즈 = {}",listDate.size());
		
		map.put("listDate", listDate);
		map.put("pageNo", pageNo);
		return map;
	}
	/*관리자 예매 취소*/
	@RequestMapping(value="/reserveAdminCancel/{reserveNo}/{pageNo}/{trainNo}",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> reserveAdminCancel(
			@PathVariable("reserveNo")String reserveNo,
			@PathVariable("pageNo")int pageNo,
			@PathVariable("trainNo")String trainNo){
		logger.info("예매 취소");
		Map<String, Object>map = new HashMap<String,Object>();
		String searchKey = "reseve_code", searchVal =reserveNo; 
		reserveDto.setReseveCode(reserveNo);
		String seatNum = erpService.seatNum(CommandFactory.detail(searchKey, searchVal)).getSeatNum();
		logger.info("추출된 좌석번호 = {}",seatNum);
		int confirm=erpService.delete(CommandFactory.detail(searchKey, searchVal));
		logger.info("취소키 ={}, 취소벨류={} ",searchKey, searchVal);
		
		searchKey=seatNum;
		searchVal=trainNo;
		
		erpService.deleteSeat(CommandFactory.detail(searchKey, searchVal));
		if (confirm == 1) {
			logger.info("예매반환 성공");
		} else {
			logger.info("예매반환 실패");
		}
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		List<ReserveDto> listDate = new ArrayList<ReserveDto>();
		list=erpService.reserveAdmin(CommandFactory.list(pageNo));
		String startDate ;
		String startTime ;
		String endTime ;
		for (int i = 0; i < list.size(); i++) {
			ReserveDto reserve = new ReserveDto();
			reserve = list.get(i);
			startDate = list.get(i).getStartTime().substring(0, 10);
			startTime = list.get(i).getStartTime().substring(11, 16);
			endTime = list.get(i).getEndTime().substring(11, 16);
			reserve.setStartDate(startDate);
			reserve.setStartTime(startTime);
			reserve.setEndTime(endTime);
			listDate.add(i, reserve);
			logger.info("listDate 사이즈 = {}",listDate.size());
			
		
		}
		int num = 10 - listDate.size();
		for (int j = 0; j < num; j++) {
			ReserveDto listNull = new ReserveDto();
			listDate.add(listNull);
		}
		int size = erpService.count();
		logger.info("listDate 사이즈 = {}",listDate.size());
		map.put("listDate", listDate);
		map.put("pageNo", pageNo);
		map.put("size", size);
		return map;
	}

}
