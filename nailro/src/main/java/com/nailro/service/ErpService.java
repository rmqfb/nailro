package com.nailro.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.nailro.domain.ReserveDto;
import com.nailro.domain.RunTrainDto;
import com.nailro.factory.Command;

public interface ErpService {
/*수익 구하기*/
public Map<String, String> profit(String trainType);
/*운행열차*/
public  List<ReserveDto> runtrain(ReserveDto reserveDto);
/*역정보를 가져오는 기능*/
public List<ReserveDto> selectList(ReserveDto reserve);
/*예매 기능*/
public int insert(ReserveDto reserve);
/*예매 확인*/
public List<ReserveDto> select(Command command);
/*예매 취소*/
public int delete(Command command);
/*예매 관리 회원*/
public List<ReserveDto> selectAdminMem();
/*예매 관리 회원*/
public List<ReserveDto> selectAdminNoMem();
/*운행열차 insert*/
public int runTraininsert(RunTrainDto runTrain);
/*운행열차 list*/
public List<RunTrainDto> runTrainlist();
/*운행열차 remove*/
public int runTrainRemove(RunTrainDto runTrain);
/*운행차량 시간*/
public ReserveDto selectTrainTime(Command command);
/*운행차량 출발시간*/
public ReserveDto selectRunTime(ReserveDto reserveDto);
/*좌석 예매*/
public int insertSeat(ReserveDto reserve);
/*열차회원예매 insert*/
public int rvminsert(ReserveDto reserve);
/*열차회원예매 select*/
public ReserveDto rvmselect(ReserveDto reserve);
/*예약가능좌석가져오기*/
public List<ReserveDto> seatSel(Command command);
/*예매관리*/
public List<ReserveDto> reserveAdmin(Command command);
/*운임요금*/
public ReserveDto destance(Command command);
/*좌석삭제*/
public int deleteSeat(Command command);
/*좌석번호추출*/
public ReserveDto seatNum(Command command);
/*카운트*/
public int count();

}
