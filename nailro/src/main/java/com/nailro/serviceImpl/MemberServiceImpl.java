package com.nailro.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nailro.domain.MemberDto;
import com.nailro.factory.Command;
import com.nailro.mapper.MemberMapper;
import com.nailro.service.MemberService;
/*@date  :  2015.08.24
@author : hanskim
*@part  :  member  
* 
* */
@Service
public class MemberServiceImpl implements MemberService {
private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	/*===== Field =====*/		
	@Autowired MemberDto memberDto;
	@Autowired private SqlSession sqlSession ;

	@Override
	public int insert(MemberDto memberDto) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원가입, 이름 ={}", memberDto.getName());
        return memberMapper.insert(memberDto);

	}

	@Override
	public int update(MemberDto memberDto) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원수정 이름 ={}", memberDto.getName());
  	  return memberMapper.update(memberDto);
	}

	@Override
	public int delete(MemberDto memberDto) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원탈퇴 이름 ={}", memberDto.getId());
		return memberMapper.delete(memberDto);
	}

	@Override
	public List<MemberDto> searchByName(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원검색 이름 ={}", command.getSearchVal());
		return memberMapper.getElementsByName(command);
	}
	
	@Override
	public List<MemberDto> searchById(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원검색 아이디 ={}", command.getSearchVal());
		return memberMapper.getElementsById(command);
	}

	
	@Override
	public List<MemberDto> detail(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 디테일 보기 회원아이디 ={}", command.getSearchVal());
		logger.info("[서비스] 디테일 보기 회원아이디 ={}", command.getStart());
		logger.info("[서비스] 디테일 보기 회원아이디 ={}", command.getEnd());
		return memberMapper.getElementsById(command);
	}

	@Override
	public List<MemberDto> list(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원목록 페이지번호 ={}", command.getPageNo());
        return  memberMapper.list(command);
	}

	@Override
	public MemberDto login(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 회원 검색 아이디(로그인) ={}", command.getSearchVal());
		return memberMapper.getElementById(command);
	}

	@Override
	public int size() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 전체 회원수 지나는 중... ");
		return memberMapper.countAll();
	}

	@Override
	public int count(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 특정 회원수  ={}", command.getSearchVal());
		return memberMapper.countSome(command);
	}

	public List<MemberDto> getElementInfo(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 검색 이름  ={}, 검색 핸드폰", command.getSearchVal(), command.getSearchKey());
		return memberMapper.getElementInfo(command);
	}
	@Override
	public MemberDto findId(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 검색 키  ={}, 검색 밸류 ={}", command.getSearchKey(), command.getSearchVal() );
		return memberMapper.findId(command);
	}

	@Override
	public MemberDto findPass(Command command) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		logger.info("[서비스] 검색 키  ={}, 검색 밸류 ={}", command.getSearchKey(), command.getSearchVal() );
		return memberMapper.findPass(command);
	}

	

}
