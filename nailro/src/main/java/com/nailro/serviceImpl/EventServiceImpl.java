package com.nailro.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.http.mapper.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailro.domain.EventDto;
import com.nailro.domain.ReserveDto;
import com.nailro.factory.Command;
import com.nailro.mapper.EventMapper;
import com.nailro.service.EventService;

@Service
public class EventServiceImpl implements EventService{
	private static final Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int insert(EventDto eventDto) {
		logger.info("[서비스] 입력");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.insert(eventDto);
	}	
	@Override
	public int mtInsert(EventDto eventDto) {
		logger.info("[서비스] 숙소입력");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtInsert(eventDto);
	}
	@Override
	public int delete(String key) {
		logger.info("[서비스] 삭제");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.delete(key);
	};
	@Override
	public int mtDelete(String key) {
		logger.info("[서비스] 삭제");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtDelete(key);
	}
	@Override
	public int update(EventDto eventDto) {
		logger.info("[서비스] 패키지 수정");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.update(eventDto);
	}
	@Override
	public int mtUpdate(EventDto eventDto) {
		logger.info("[서비스] 숙소 수정");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtUpdate(eventDto);
	}
	@Override
	public List<EventDto> list(Command command) {
		logger.info("[서비스] 리스트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.list(command);
	}
	@Override
	public List<EventDto> mtList(Command command) {
		logger.info("[서비스] 숙소리스트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtList(command);
	}
	@Override
	public List<EventDto> search(Command command) {
		logger.info("[서비스] 패키지검색");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.search(command);
	}
	@Override
	public List<EventDto> mtSearch(Command command) {
		logger.info("[서비스] 숙소검색");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtSearch(command);
	}
	
	@Override
	public EventDto detail(Command command) {
		logger.info("[서비스] 상세정보");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.detail(command);
	}
	@Override
	public EventDto mtDetail(Command command) {
		logger.info("[서비스] 상세정보");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.mtDetail(command);
	}
	@Override
	public List<EventDto> salerList(Command command) {
		logger.info("[서비스] 판매자리스트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.salerList(command);
	}
	@Override
	public int salerDelete(String key) {
		logger.info("[서비스] 판매자 삭제");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.salerDelete(key);
	}
	@Override
	public int salerInsert(EventDto eventDto) {
		logger.info("[서비스] 판매자 입력");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.salerInsert(eventDto);
	}
	@Override
	public EventDto salerDetail(Command command) {
		logger.info("[서비스] 판매자 입력");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.salerDetail(command);
	}
	@Override
	public int salerUpdate(EventDto eventDto) {
		logger.info("[서비스] 판매자 수정");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.salerUpdate(eventDto);
	}
	@Override
	public int size(Command command) {
		logger.info("[서비스] 패키지 사이즈");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.size(command);
	}
	@Override
	public int count(Command command) {
		logger.info("[서비스] 패키지 카운트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.count(command);
	}
	@Override
	public List<EventDto> goodsList(Command command) {
		logger.info("[서비스] 사용자 패키지 상품 리스트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.goodsList(command);
	}
	@Override
	public EventDto userDetail(Command command) {
		logger.info("[서비스] 사용자 상품 디테일");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.userDetail(command);
	}
	@Override
	public int ReserveInsert(EventDto eventDto) {
		logger.info("[서비스] 사용자 패키지 예약");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.ReserveInsert(eventDto);
	}
	@Override
	public List<ReserveDto> pkgTrainReList() {
		logger.info("[서비스] 패키지 열차 리스트");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.pkgTrainReList();
	}
	@Override
	public List<EventDto> pkgCheck(Command command) {
		logger.info("[서비스] 패키지 예약확인");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.pkgCheck(command);
	}
	@Override
	public int pkgCancel(String code) {
		logger.info("[서비스]예약삭제");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.pkgCancel(code);
	}
	@Override
	public int pkgReserveCount(String userId) {
		logger.info("[서비스]패키지예약상품 갯수");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.pkgReserveCount(userId);
	}
	@Override
	public List<EventDto> pkgRank(Command command) {
		logger.info("[서비스]패키지순위");
		EventMapper mapper = sqlSession.getMapper(EventMapper.class);
		return mapper.pkgRank(command);
	}

}

