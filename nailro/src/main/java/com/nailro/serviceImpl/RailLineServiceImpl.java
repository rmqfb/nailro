package com.nailro.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailro.domain.RailLineDto;
import com.nailro.factory.Command;
import com.nailro.mapper.RailLineMapper;
import com.nailro.service.RailLineService;

@Service
public class RailLineServiceImpl implements RailLineService{
	private static final Logger logger = LoggerFactory.getLogger(RailLineServiceImpl.class); 
	/*===== Field =====*/	
	Map<String,Object> map = new HashMap<String,Object>();
	RailLineDto railLineDto=new RailLineDto();
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int insert(RailLineDto bean) {
		logger.info("[ 서비스 ] 노선 입력={}",bean.getLineName());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
		return railLineMapper.insert(bean);
	}

	@Override
	public int update(RailLineDto bean) {
		logger.info("[ 서비스 ] 노선 수정={}",railLineDto.getLineName());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
        return railLineMapper.update(bean);
	}

	@Override
	public int delete(RailLineDto bean) {
		logger.info("[ 서비스 ] 노선 삭제={}",railLineDto.getLineName());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
        return railLineMapper.delete(bean);
	}

	@Override
	public List<RailLineDto> searchByKeyword(Command command) {
		logger.info("[ 서비스 ] 노선검색 키워드={}",command.getSearchVal());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
		return railLineMapper.getElementsByName(command);
	}

	@Override
	public List<RailLineDto> railLineList(Command command) {
		logger.info("[ 서비스 ] 노선목록");
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
        return railLineMapper.list(command);
	}

	@Override
	public int railLineCountAll() {
		logger.info("[ 서비스 ] 전체노선수 지나는 중....{}");
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
		return railLineMapper.countAll();
	}

	@Override
	public int railLineCountSome(Command command) {
		logger.info("[ 서비스 ] 특정노선수={}",command.getSearchVal());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
		return railLineMapper.countSome(command);
	}

	@Override
	public RailLineDto railLineDetail(Command command) {
		logger.info("[ 서비스 ] 노선검색 노선번호={}",command.getSearchVal());
		RailLineMapper railLineMapper = sqlSession.getMapper(RailLineMapper.class);
		return railLineMapper.getElementById(command);
	}

}
