package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.ReserveDto;
import com.nailro.domain.RunTrainDto;
import com.nailro.factory.Command;

public interface ErpMapper {
/*수익관리*/
public  List<ReserveDto> profit();
/*운행열차*/
public  List<ReserveDto> runtrain(ReserveDto reserveDto);
/*열차정보 가져오기*/
public List<ReserveDto> selectList(ReserveDto reserveDto);
/*예매하기*/
public int insert(ReserveDto reserveDto);
/*예매 확인*/
public List<ReserveDto> select(Command command);
/*예매 취소*/
public int delete(Command command);
/*예매 관리 회원*/
public List<ReserveDto> selectAdminMem();
/*예매 관리 비회원*/
public List<ReserveDto> selectAdminNoMem();
/*운행열차 insert*/
public int runTraininsert(RunTrainDto runTrain);
/*운행열차 list*/
public List<RunTrainDto> runTrainlist();
/*운행열차 remove*/
public int runTrainRemove(RunTrainDto runTrain);
/*운행차량시간*/
public ReserveDto selectTrainTime(Command command);
/*운행차량 출발시간*/
public ReserveDto selectRunTime(ReserveDto reserveDto);
/*좌석 예매*/
public int insertSeat(ReserveDto reserve);
/*열차회원예매 insert*/
public int rvminsert(ReserveDto reserve);
/*열차회원예매 select*/
public ReserveDto rvmselect(ReserveDto reserve);
/*운임요금*/
public ReserveDto destance(Command command);
/*예약가능좌석가져오기*/
public List<ReserveDto> seatSel(Command command);
/*예매관리*/
public List<ReserveDto> reserveAdmin(Command command);
/*좌석삭제*/
public int deleteSeat(Command command);
/*좌석번호추출*/
public ReserveDto seatNum(Command command);
/*카운트*/
public int count();
}
