package com.nailro.mapper;

import java.util.List;

import com.nailro.domain.EventDto;
import com.nailro.domain.ReserveDto;
import com.nailro.factory.Command;

public interface EventMapper {
	
	//====== executeUpdate ======
	
		public int insert(EventDto eventDto); // 패키지 입력
		public int mtInsert(EventDto eventDto); //숙소 입력
		public int salerInsert(EventDto eventDto); // 판매자 입력
		public int ReserveInsert(EventDto eventDto); // 사용자 예매 입력
		
		public int delete(String key); // 패키지 삭제
		public int mtDelete(String key); // 숙소 삭제 
		public int salerDelete(String key);  // 판매자 삭제
		public int pkgCancel(String code); //패키지 예약삭제
		
		public int update(EventDto eventDto);// 패키지 수정
		public int mtUpdate(EventDto eventDto); //숙소수정
		public int salerUpdate(EventDto eventDto); // 판매자 수정
		
		//====== executeQuery ======
		
		public List<EventDto> list(Command command); // 패키지 리스트 
		public List<EventDto> mtList(Command command); 	// 숙소 리스트 
		public List<EventDto> salerList(Command command);
		public List<EventDto> goodsList(Command command); //사용자 전체 상품 리스트
		public List<EventDto> pkgRank(Command command); //패키지 순위
		
		public List<EventDto> search(Command command); // 패키지 조회
		public List<EventDto> mtSearch(Command command); // 숙소 조회 
		
		public EventDto detail(Command command); // 패키지 디테일
		public EventDto mtDetail(Command command); // 숙소 디테일
		public EventDto salerDetail(Command command); //판매자 디테일
		public EventDto userDetail(Command command); // user용 디테일
		public List<EventDto> pkgCheck(Command command);//패키지 예약확인
		
		public int size(Command command); // 패키지 사이즈
		public int count(Command command); // 패키지 카운트 
		public int pkgReserveCount(String userId); //패키지예약상품 갯수
		
		public List<ReserveDto> pkgTrainReList();//패키지열차예매 리스트
		
		
}

