package com.nailro.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailro.domain.StationDto;
import com.nailro.mapper.StationMapper;
import com.nailro.service.StationService;

@Service
public class StationServiceImpl implements StationService {
	private static final Logger logger = LoggerFactory.getLogger(StationServiceImpl.class); 
	/*===== Field =====*/	
	Map<String,Object> map = new HashMap<String,Object>();
	StationDto station=new StationDto();
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int insertStation(StationDto bean) {
		logger.info("[ 서비스 ] 역입력 이름={}",station.getStationName());
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
        return stationMapper.insert(bean);
	}

	@Override
	public int updateStation(StationDto bean) {
		logger.info("[ 서비스 ] 역수정 이름={},수정 코드={}",bean.getStationName(),bean.getStationCode());
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
        return stationMapper.update(bean);
	}

	@Override
	public int deleteStation(StationDto bean) {
		logger.info("[ 서비스 ] 역삭제 이름={}",bean.getStationName());
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
        return stationMapper.delete(bean);
	}

	@Override
	public List<StationDto> searchByKeyword(String id) {
		logger.info("[ 서비스 ] 역검색 키워드={}",id);
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
		return stationMapper.getElementsByName(id);
	}
	
	@Override
	public List<StationDto> stationList() {
		logger.info("[ 서비스 ] 역목록 리스트 지나는중");
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
        return stationMapper.list();
	}

	@Override
	public int stationCountAll() {
		logger.info("[ 서비스 ] 전체역수 지나는 중....");
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
		return stationMapper.countAll();
	}

	@Override
	public int stationCountSome(String id) {
		logger.info("[ 서비스 ] 특정역명={}",id);
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
		return stationMapper.countSome(id);
	}

	@Override
	public StationDto stationDetail(String stationId) {
		logger.info("[ 서비스 ] 역검색 역번호={}",stationId);
		StationMapper stationMapper=sqlSession.getMapper(StationMapper.class);
		return stationMapper.getElementById(stationId);
	}

}
