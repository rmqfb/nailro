package com.nailro.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.nailro.domain.ReserveDto;
import com.nailro.domain.RunTrainDto;
import com.nailro.factory.Command;
import com.nailro.mapper.ErpMapper;
import com.nailro.service.ErpService;
import com.nailro.web.ErpController;

@Service
public class ErpServiceImpl implements ErpService {
	   
	   @Autowired SqlSessionTemplate sqlSession;
	   private static final Logger logger = LoggerFactory.getLogger(ErpController.class);
	@Override
	public Map<String, String> profit(String trainType){
		Map<String, String>map = new HashMap<String, String>();
		ModelAndView modelAndView = new ModelAndView();
		List<ReserveDto> list= new ArrayList<ReserveDto>();
		int total = 0;
		int cnt =0;
		String train ="", year1="", month1="",day1="",now1=""; //db에서 불러오는 날짜
		String month="", day="", year=""; //현재 날짜
		Date date = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		year= (dateFormat.format(date)).substring(0, 4); //년도만 남게 자른다.
		month =(dateFormat.format(date)).substring(0, 7);//달까지만 남게 자른다.
		day =(dateFormat.format(date)).substring(0, 10);//일까지만 남게 자른다.
		logger.info("year={}", year);
		switch (trainType){
		case "all": train="전체"; break;
		case "mugungwha": train="무궁화"; break;
		case "saemaeul":  train="새마을";break;
		case "KTX":  train="KTX"; break;
		default:
			break;
		}
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		list = erpMapper.profit();
		//list 가 널이면 첫  페이지 들어갈대 널값이면 url 만 뿌려준다. 
		if (!(list == null)) {
			
			//년도 수익
			cnt =0; //이용자수
			total =0;//금액
			for (ReserveDto profit : list){
				logger.info("날짜 ={}",profit.getStartTime());
				year1=String.valueOf(profit.getStartTime()).substring(0, 4);//년2015
				logger.info("쪼갠날짜 ={}",year1);
				if(year.equals(year1)){
				if(profit.getTrainName().equals(train)){				
					total+=profit.getPay();
					cnt +=1;
				}
				else if("전체".equals(train)){	
					System.out.println(profit.getPay());
					total+=profit.getPay();
					cnt +=1;
				}
			}
					    
			}
			map.put("yeartotal", String.valueOf(total));
			map.put("yearuseCnt", String.valueOf(cnt));
			modelAndView.addObject("yeartotal",String.valueOf(total));
			modelAndView.addObject("yearuseCnt",String.valueOf(cnt));
			//달수익
			cnt =0;
			total =0;
			for (ReserveDto profit : list){
				System.out.println(year1);
				month1=String.valueOf(profit.getStartTime()).substring(0,7); //월7
				if(month.equals(month1)){
				if(profit.getTrainName().equals(train)){	
					System.out.println(profit.getPay());
					
					total+=profit.getPay();
					cnt +=1;
				}
				else if("전체".equals(train)){	
					System.out.println(profit.getPay());
					total+=profit.getPay();
					cnt +=1;
				}
			}				    
}
			map.put("monthtotal", String.valueOf(total));
			map.put("monthuseCnt", String.valueOf(cnt));
			modelAndView.addObject("monthtotal",String.valueOf(total));
			modelAndView.addObject("monthuseCnt",String.valueOf(cnt));
			//일수익
			cnt =0;
			total =0;
			for (ReserveDto profit : list){ 
				day1=String.valueOf(profit.getStartTime()).substring(0,10);//일16
				if(day.equals(day1)){
				if(profit.getTrainName().equals(train)){				
					total+=profit.getPay();
					cnt +=1;
				}
				else if("전체".equals(train)){	
					total+=profit.getPay();
					cnt +=1;
				}
			}
					    
			}
			logger.info("일 이용객수={}",String.valueOf(total));
			map.put("daytotal", String.valueOf(total));
			map.put("dayuseCnt", String.valueOf(cnt));
			modelAndView.addObject("daytotal",String.valueOf(total));
			modelAndView.addObject("dayuseCnt",String.valueOf(cnt));
		}
		return map;
	}
	/*운행열차*/
	@Override
	public List<ReserveDto> runtrain(ReserveDto reserveDto) {
		ErpMapper mapper = sqlSession.getMapper(ErpMapper.class);
		logger.info("날짜={}",reserveDto.getStartDate());
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		list =mapper.runtrain(reserveDto);
		for (ReserveDto reserveDto2 : list) {
			reserveDto2.setStartDate(reserveDto.getStartDate());
			reserveDto2.setStartStation(reserveDto.getStartStation());
			reserveDto2.setEndStation(reserveDto.getEndStation());
			switch (reserveDto.getStartStation()) {
			case "st10": reserveDto2.setStartStation("서울");break;
			case "st20":reserveDto2.setStartStation("부산"); break;
			case "st30":reserveDto2.setStartStation("대구"); break;
			case "st40":reserveDto2.setStartStation("대전");break;

			default:
				break;
			}
			switch (reserveDto2.getEndStation()) {
			case "st10": reserveDto2.setEndStation("서울");break;
			case "st20":reserveDto2.setEndStation("부산"); break;
			case "st30":reserveDto2.setEndStation("대구"); break;
			case "st40":reserveDto2.setEndStation("대전");break;

			default:
				break;
			}
		}
		return list;
	}
	/*역정보를 가져오는 기능*/
	@Override
	public List<ReserveDto> selectList(ReserveDto reserveDto) {
		logger.info("역정보 확인 = {}", reserveDto.getStartStation());
		ErpMapper mapepr= sqlSession.getMapper(ErpMapper.class);
		return mapepr.selectList(reserveDto);
	}
	/*예매기능*/
	@Override
	public int insert(ReserveDto reserveDto) {
		logger.info("예매회원 아이디 = {}", reserveDto.getId());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.insert(reserveDto);
		
	}
	/*예매확인*/
	@Override
	public List<ReserveDto> select(Command command) {
		logger.info("예매확인 아이디 = {}", command.getSearchVal());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.select(command);
	}
	/*예매 취소*/
	@Override
	public int delete(Command command) {
		logger.info("예매취소 아이디 = {}", command.getSearchVal());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.delete(command);
	}
	@Override
	public List<ReserveDto> selectAdminMem() {
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.selectAdminNoMem();
	}
	@Override
	public List<ReserveDto> selectAdminNoMem() {
		// TODO Auto-generated method stub
		return null;
	}
	/*운행열차 인서트*/
	@Override
	public int runTraininsert(RunTrainDto runTrain) {
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.runTraininsert(runTrain);
	}
	@Override
	public ReserveDto selectTrainTime(Command command) {
		logger.info("예매번호 추출중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.selectTrainTime(command);
	}
	@Override
	public ReserveDto selectRunTime(ReserveDto reserveDto) {
		logger.info("예매번호 추출중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.selectRunTime(reserveDto);
	}
	@Override
	public int insertSeat(ReserveDto reserveDto) {
		logger.info("예매회원 아이디 = {}", reserveDto.getId());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.insertSeat(reserveDto);
	}
	@Override
	public int rvminsert(ReserveDto reserveDto) {
		 logger.info("예매회원 아이디 = {}", reserveDto.getId());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.rvminsert(reserveDto);
	}
	@Override
	public ReserveDto rvmselect(ReserveDto reserveDto) {
		logger.info("예매회원  ={}", reserveDto.getReseveCode());
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.rvmselect(reserveDto);
	}
	/*runtrainlist*/
	@Override
	public List<RunTrainDto> runTrainlist() {
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.runTrainlist();
	}
	/*runtrainRemove*/
	@Override
	public int runTrainRemove(RunTrainDto runTrain) {
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.runTrainRemove(runTrain);
	}
	/*좌석예약 상태 가져오기*/
	@Override
	public List<ReserveDto> seatSel(Command command) {
		logger.info("예약가능 좌석번호 추출중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.seatSel(command);
	}
	/*예매관리*/
	@Override
	public List<ReserveDto> reserveAdmin(Command command) {
		logger.info("예매관리 이동중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.reserveAdmin(command);
	}
	/*운임요금*/
	@Override
	public ReserveDto destance(Command command) {
		logger.info("예매관리 이동중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.destance(command);
	}
	/*좌석삭제*/
	@Override
	public int deleteSeat(Command command) {
		logger.info("좌석 삭제중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.deleteSeat(command);
	}
	/*좌석번호추출*/
	@Override
	public ReserveDto seatNum(Command command) {
		logger.info("좌석 삭제중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.seatNum(command);
	}
	/*카운트*/
	@Override
	public int count() {
		logger.info("좌석 삭제중");
		ErpMapper erpMapper = sqlSession.getMapper(ErpMapper.class);
		return erpMapper.count();
	}
	
}
