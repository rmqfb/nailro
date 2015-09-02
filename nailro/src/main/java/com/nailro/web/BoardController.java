package com.nailro.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

import com.nailro.domain.BoardDto;
import com.nailro.factory.CommandFactory;
import com.nailro.serviceImpl.BoardServiceImpl;
import com.nailro.util.FileUpload;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardDto board;
	@Autowired BoardServiceImpl boardService;
		@RequestMapping("/notice")
		public String notice(Model model) {
			logger.info("보드메인 타는중");
			return "board/notice.tiles";			
		}
		@RequestMapping("/review")
		public String review(Model model) {
			logger.info("보드메인 타는중");
			return "board/review.tiles";		
		}
		@RequestMapping("/faq")
		public String faq(Model model) {
			logger.info("보드메인 타는중");
			return "board/faq.tiles";
		}		
		
		@RequestMapping("/list/{theme}/{pageNo}")
		public @ResponseBody Map<String,Object> list(
				@PathVariable("pageNo")int pageNo,
				@PathVariable("theme")int theme) {
			Map<String,Object> map = new HashMap<String,Object>();
			List<BoardDto> list= new ArrayList<BoardDto>();
			logger.info("게시판 이름 ={} 페이지 번호 = {}",theme,pageNo);
			int size = boardService.size(CommandFactory.size(theme));
			logger.info("컨트롤 사이즈 : "+size);
			list=boardService.list(CommandFactory.list(pageNo,theme));	
			map.put("currentPage", pageNo);
			map.put("size", size);
			map.put("list", list);
			return map;
		}
		@RequestMapping("/detail/{theme}/{brdNo}/{readCnt}/{replePageNo}")
		public @ResponseBody Map<String,Object> detail(@ModelAttribute BoardDto board){
			logger.info("게시판에서 넘어온 명령어 ={},{}",board.getTheme(), board.getBrdNo());
			logger.info("게시판에서 넘어온 명령어 ={}",board.getReadCnt());
			String theme = String.valueOf(board.getTheme());
			String brdNo = String.valueOf(board.getBrdNo());
			String readCnt = String.valueOf(board.getReadCnt());			
			int size = 0;				
			List<BoardDto> list= new ArrayList<BoardDto>();
			Map<String,Object> map = new HashMap<String,Object>();
			if(board.getTheme() == 2){				
				logger.info("게시판에서 넘어온 명령어 ={}",board.getTheme());
				int pageNo = board.getReplePageNo();
				map.put("currentPage", pageNo);
				list = boardService.repleList(board);
				size = boardService.repleSize(CommandFactory.count("brdNo", brdNo));
				
			}else{
				logger.info("게시판에서 넘어온 명령어 ={}",board.getTheme());
				list = null;
				size = 0;
			}
			boardService.readCnt(CommandFactory.count(brdNo, readCnt, board.getTheme()));		
			board = boardService.detail(CommandFactory.detail(theme, brdNo));			
			map.put("brdNo", board.getBrdNo());
			map.put("id", board.getId());
			map.put("readCnt", board.getReadCnt());
			map.put("boardDate", board.getBoardDate());
			map.put("title", board.getTitle());
			map.put("content", board.getContent());
			map.put("path", board.getPath());
			map.put("list", list);
			map.put("size", size);
			
			return map;
		}
		@RequestMapping(value="/write", method=RequestMethod.POST)
		public String write(@ModelAttribute BoardDto board,
				@RequestParam(value="file",required=false) MultipartFile multipartFile
				){
				logger.info("게시판 등록여부={} , {}",board.getTheme(),board.getPageNo());
				logger.info("게시판 등록여부={} , {}",board.getTitle(),board.getContent());
				logger.info(" 넘어온 아이디 = {}",board.getId());
				if(board.getTheme() == 2){
				String path="C:\\Users\\cyi\\spworkspace\\nailro\\src\\main\\webapp\\resources\\image\\board\\";
				FileUpload fileUpLoad = new FileUpload();
				String fileName = multipartFile.getOriginalFilename();
				String fullPath = fileUpLoad.uploadFile(multipartFile, path, fileName);
				logger.info("[컨트롤러 : 수정] 파일 업로드 경로 = {}",fullPath);
				board.setPath(fileName);
				}
				boardService.insert(board);				
				
				return "redirect:/board//list/"+board.getTheme()+"/"+board.getPageNo();
		}
		@RequestMapping(value="/update",method=RequestMethod.POST)
		public String update(@ModelAttribute BoardDto board,
				@RequestParam(value="file",required=false) MultipartFile multipartFile){
			logger.info("게시판 등록여부={} , {}",board.getTheme(),board.getPageNo());
			logger.info("게시판 등록여부={} , {}",board.getTitle(),board.getContent());
			logger.info(" 넘어온 아이디 = {}",board.getId());
			if(board.getTheme() == 2){
			String path="C:\\Users\\cyi\\spworkspace\\nailro\\src\\main\\webapp\\resources\\image\\board\\";
			FileUpload fileUpLoad = new FileUpload();
			String fileName = multipartFile.getOriginalFilename();
			String fullPath = fileUpLoad.uploadFile(multipartFile, path, fileName);
			logger.info("[컨트롤러 : 수정] 파일 업로드 경로 = {}",fullPath);
			board.setPath(fileName);
			}
			boardService.update(board);
			return "redirect:/board//detail/"+board.getTheme()+"/"+board.getBrdNo()+"/"+board.getReadCnt()+"/1";
		}
		@RequestMapping(value="/repleInsert",method=RequestMethod.GET)
		public @ResponseBody Map<String,Object> repleInsert(@ModelAttribute BoardDto board){
			logger.info("게시판 이름 ={}, 게시물 번호 = {}",board.getTheme(),board.getBrdNo());
			logger.info("리플 내용 = {}, 등록 중인 아이디",board.getRepleContent(),board.getId());
			boardService.repleInsert(board);
			String theme = String.valueOf(board.getTheme());
			String brdNo = String.valueOf(board.getBrdNo());
			int size = 0;
			int pageNo = board.getReplePageNo();
			List<BoardDto> list= new ArrayList<BoardDto>();
			Map<String,Object> map = new HashMap<String,Object>();			
			list = boardService.repleList(board);
			size = boardService.repleSize(CommandFactory.count("brdNo", brdNo));				
			board = boardService.detail(CommandFactory.detail(theme,brdNo));
			map.put("currentPage", pageNo);
			map.put("brdNo", board.getBrdNo());
			map.put("id", board.getId());
			map.put("path", board.getPath());
			map.put("readCnt", board.getReadCnt());
			map.put("boardDate", board.getBoardDate());
			map.put("title", board.getTitle());
			map.put("content", board.getContent());
			map.put("list", list);
			map.put("size", size);
		
			return map;
		}
		@RequestMapping(value="/delete/{theme}/{brdNo}")
		public @ResponseBody List<BoardDto> delete(@PathVariable("theme")int theme,
				@PathVariable("brdNo")int brdNo){
			BoardDto board = new BoardDto();
			logger.info("게시판 번호 ={}, 게시판 코드 = {}",theme,brdNo);
			board.setBrdNo(brdNo);
			board.setTheme(theme);
			boardService.subDelete(board);
			boardService.delete(board);			
			List<BoardDto> list= new ArrayList<BoardDto>();
			list=boardService.list(CommandFactory.list(1,theme));
			return list;
		}
		@RequestMapping(value="/repleDelete/{theme}")
		public @ResponseBody Map<String,Object> repleDelete(@ModelAttribute BoardDto board){
			
			logger.info("게시물 번호 ={}, 리플 번호 = {}",board.getBrdNo(),board.getRepleNo());
			
			boardService.repleDelete(board);
			String theme = String.valueOf(board.getTheme());
			String brdNo = String.valueOf(board.getBrdNo());
			int size = 0;
			int pageNo = board.getReplePageNo();
				List<BoardDto> list= new ArrayList<BoardDto>();
				Map<String,Object> map = new HashMap<String,Object>();				
				list = boardService.repleList(board);
				size = boardService.repleSize(CommandFactory.count("brdNo", brdNo));
				board = boardService.detail(CommandFactory.detail(theme,brdNo));
				map.put("currentPage", pageNo);
				map.put("brdNo", board.getBrdNo());
				map.put("id", board.getId());
				map.put("readCnt", board.getReadCnt());
				map.put("boardDate", board.getBoardDate());
				map.put("title", board.getTitle());
				map.put("content", board.getContent());
				map.put("list", list);
				map.put("size", size);
			
			return map;
		}
		@RequestMapping(value="/search/{theme}/{pageNo}",method=RequestMethod.GET)
		public @ResponseBody Map<String,Object> search(@ModelAttribute BoardDto board){
			Map<String,Object> map = new HashMap<String,Object>();
			List<BoardDto> list= new ArrayList<BoardDto>();
			logger.info("게시판 번호 ={}, 게시판 코드 = {}",board.getTheme(),board.getPageNo());
			logger.info("게시판 검색 키 ={}, 게시판 검색 값 = {}",board.getSearchKey(),board.getSearchVal());
			switch (board.getSearchKey()) {
			case "all": 				
			int	count = boardService.allCount(CommandFactory.count(board.getSearchKey(), board.getSearchVal(), board.getTheme()));		
				list = boardService.allSearch(board);
				map.put("searchKey", board.getSearchKey());
				map.put("searchVal", board.getSearchVal());
				map.put("currentPage", board.getPageNo());
				map.put("size", count);
				map.put("list", list);			
			break;
	
			case "title": board.setSearchKey("BBS_TITLE");
				logger.info("게시판 검색 키 ={}, 게시판 검색 값 = {}",board.getSearchKey(),board.getSearchVal());
			 count = boardService.count(CommandFactory.count(board.getSearchKey(), board.getSearchVal(), board.getTheme()));				
				list =  boardService.search(board);
				map.put("searchKey", board.getSearchKey());
				map.put("searchVal", board.getSearchVal());
				map.put("currentPage", board.getPageNo());
				map.put("size", count);
				map.put("list", list);
			break;
			
			case "content": board.setSearchKey("BBS_CONTENT");
			count = boardService.count(CommandFactory.count(board.getSearchKey(), board.getSearchVal(), board.getTheme()));				
			list =  boardService.search(board);
			map.put("searchKey", board.getSearchKey());
			map.put("searchVal", board.getSearchVal());
			map.put("currentPage", board.getPageNo());
			map.put("size", count);
			map.put("list", list);
			break;
			
			case "id": board.setSearchKey("ID");
			count = boardService.count(CommandFactory.count(board.getSearchKey(), board.getSearchVal(), board.getTheme()));				
			list =  boardService.search(board);
			map.put("searchKey", board.getSearchKey());
			map.put("searchVal", board.getSearchVal());
			map.put("currentPage", board.getPageNo());
			map.put("size", count);
			map.put("list", list);
			break;
			
			default: logger.info("검색한 내용이 없습니다."); break;
			
			}
			return map;
		}
	}
