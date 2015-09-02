package com.nailro.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailro.domain.TrainDto;
import com.nailro.factory.Command;
import com.nailro.mapper.TrainMapper;
import com.nailro.service.TrainService;

@Service
public class TrainServiceImpl implements TrainService{
	private static final Logger logger = LoggerFactory.getLogger(TrainServiceImpl.class); 
	/*===== Field =====*/	
	Map<String,Object> map = new HashMap<String,Object>();
	TrainDto train = new TrainDto();
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int insertTrain(TrainDto bean) {
		logger.info("[ 서비스 ] 열차입력 이름={}",bean.getTrainName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.trainInsert(bean);
	}

	@Override
	public int updateTrain(TrainDto bean) {
		logger.info("[ 서비스 ] 열차수정 이름={}",bean.getTrainName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.trainUpdate(bean);
	}

	@Override
	public int deleteTrain(TrainDto bean) {
		logger.info("[ 서비스 ] 열차삭제 이름={}",bean.getTrainName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.trainDelete(bean);
	}

	@Override
	public int insertMaker(TrainDto bean) {
		logger.info("[ 서비스 ] 제조사입력 이름={}",bean.getMakerName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.makerInsert(bean);
	}

	@Override
	public int updateMaker(TrainDto bean) {
		logger.info("[ 서비스 ] 제조사수정 이름={}",bean.getMakerName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.makerUpdate(bean);
	}

	@Override
	public int deleteMaker(TrainDto bean) {
		logger.info("[ 서비스 ] 제조사삭제 이름={}",bean.getMakerName());
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
        return trainMapper.makerDelete(bean);

	}

	@Override
	public List<TrainDto> trainList() {
		logger.info("[ 서비스 ] 열차전체리스트 키워드");
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.trainList("bean");
	}

	@Override
	public List<TrainDto> makerList() {
		logger.info("[ 서비스 ] 제조사전체 리스트");
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.makerList("maker");
	}

	@Override
	public int trainCountAll() {
		logger.info("[ 서비스 ] 전체차량수 지나는 중....");
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.trainCountAll();
	}

	@Override
	public int trainCountSome(String trainName) {
		logger.info("[ 서비스 ] 특정차량명={}",trainName);
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.trainCountSome(trainName);
	}

	@Override
	public TrainDto trainDetail(String trainName) {
		logger.info("[ 서비스 ] 열차검색 열차번호={}",trainName);
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.getElementById(trainName);
	}

	@Override
	public int makerCountAll() {
		logger.info("[ 서비스 ] 전체제조사수 지나는 중....");
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.makerCountAll();
	}

	@Override
	public int makerCountSome(String maker) {
		logger.info("[ 서비스 ] 특정제조사명={}",maker);
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.makerCountSome(maker);
	}

	@Override
	public TrainDto makerDetail(String makerId) {
		logger.info("[ 서비스 ] 제조사상세검색 제조사번호={}",makerId);
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.getElementById(makerId);
	}

	@Override
	public List<TrainDto> search(Command command) {
		logger.info("[ 서비스 ] 제조사상세검색 제조사번호");
		TrainMapper trainMapper=sqlSession.getMapper(TrainMapper.class);
		return trainMapper.getElementsByName(command.getSearchVal());
	}

}
