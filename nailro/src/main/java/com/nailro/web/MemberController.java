package com.nailro.web;


import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.nailro.domain.MemberDto;
import com.nailro.factory.CommandFactory;
import com.nailro.serviceImpl.MemberServiceImpl;
/*@date  :  2015.08.24
  @author : hanskim
 * 
 * */

@Controller
@SessionAttributes("user")
@RequestMapping(value="/member")

public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberServiceImpl MemberService ; 
	@Autowired MemberDto member ; 

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public @ResponseBody MemberDto login(@ModelAttribute MemberDto user,Model model
			){ 	  	
		logger.info("이거 보이면 로그인 시작 : id={}, pass={}",user.getId(),user.getPass());		
		String searchKey ="id", searchVal =user.getId();
		member= MemberService.login(CommandFactory.search(searchKey, searchVal));

		if (member !=null) {
			if (user.getPass().equals(member.getPass())) {
				logger.info("===== 이거 보이면 로그인 성공!! =====");
				model.addAttribute("user",member);
				logger.info("모델의 유저에 담긴 아이디 ={}", user.getId());
				logger.info("모델의 유저에 담긴 가입일 ={}", user.getJoindate());
				logger.info("멤버에 담긴 아이디 ={}",member.getId());
				return member;				
			} else {
				logger.info("===== 이거 보이면 비밀번호 일치하지 않음 =====");
				member = new MemberDto();
				member.setPass("passFail");
				return member;
			}
		} else {
			logger.info("===== 이거 보이면 아이디가 존재하지 않음!! =====");
			member = new MemberDto();
			member.setId("idNull");
			return member;
		}
	}
	
	@RequestMapping("/logOut")
	public String logOut(@ModelAttribute("user")MemberDto user,
			SessionStatus status){
		logger.info("로그아웃  처리 완료됨");	
	status.setComplete(); 
	user.setId("");
	member.setId("");
	logger.info("유저에 담긴 아이디 ={}",user.getId() );
	logger.info("멤버의 아이디 ={}",member.getId());
	 return "redirect:/home";
	}
	
	@RequestMapping("/moveHome")
	public String movehome(){
		logger.info("첫 화면으로 이동함");
	   return "home/templateMember.tiles";
	}
	/*관리자 멤버 메인 으로 이동*/
	@RequestMapping("/adminMemberMain")
	public String adminMemberMain(){
		logger.info("첫 화면으로 이동함");
	   return "views/member/adminMemberMain.tiles";
	}
	
	@RequestMapping("/adminForm")
	public String moveAdmin(){
		logger.info("관리자 로그인 창으로 이동");
		return "member/adminAuthorityForm.tiles";
	}
	

	@RequestMapping(value="/adminlogin", method=RequestMethod.GET)
	public @ResponseBody MemberDto adminLogin(
			@RequestParam("adminId")String id,
			@RequestParam("adminPass")String pass,
			@ModelAttribute MemberDto user,
			Model model){   	
		logger.info("로그인하는 관리자 아이디,패스워드: id={}, pass={}",id,pass);	
		String searchKey ="id", searchVal =id;
		member= MemberService.login(CommandFactory.search(searchKey, searchVal));

		if (member !=null) {
			if (pass.equals(member.getPass())) {
				logger.info("===== 이거 보이면 관리자 로그인 성공!! =====");
				model.addAttribute("user",member);
				model.addAttribute("member", member);
				model.addAttribute("msg", "환영합니다");
				return member;
			} else {
				logger.info("===== 이거 보이면 비밀번호 일치하지 않음 =====");
				model.addAttribute("msg", "비밀번호 일치하지 않음.");
				member = new MemberDto();
				member.setPass("adminPassFail");
				return member;
			}
		} else {
			logger.info("===== 이거 보이면 아이디가 존재하지 않음!! =====");
			model.addAttribute("msg", "아이디가 존재하지 않음.");
			member = new MemberDto();
			member.setId("adminIdNull");
			return member;
		}
	}

	@RequestMapping("/logOutAdmin")
	public String adminLogout(@ModelAttribute("user")MemberDto user,
			SessionStatus status){
		logger.info("관리자 로그아웃 처리됨");
		status.setComplete(); 
		user.setId("");
		member.setId("");
		logger.info("유저에 담긴 아이디 ={}",user.getId() );
		logger.info("멤버의 아이디 ={}",member.getId());
		 return "redirect:/home";
	}

	
	@RequestMapping("/moveAgree")
	public String moveAgree(){
		logger.info("이용약관 동의 창으로 이동");
		return "member/memberMain.tiles";

	}
	

	
	@RequestMapping("/moveMyPage")
	public String moveMyPage(
			@ModelAttribute("user")MemberDto user,
			Model model ){
		logger.info("마의페이지 창으로 이동 중");
		logger.info("세션에 담긴 가입일 ={}", user.getJoindate());
		logger.info("세션에 담긴 전화번호 ={}", user.getTelNo());
		logger.info("세션에 담긴 핸드폰 번호 ={}", user.getCellPhone());
		
		return "member/myPageForm.tiles";

	}

	@RequestMapping(value="/meJoin", method=RequestMethod.GET)
	public @ResponseBody MemberDto join(
			@RequestParam("email1")String email1,
			@RequestParam("email2")String email2,
			@ModelAttribute MemberDto member,
			Model model ){
		logger.info("회원가입 컨트롤러까지 옴");
		String email  =  email1+email2;
		member.setEmail(email);
		logger.info("회원가입 한 이메일 = {}", member.getEmail());
		logger.info("회원가입 : 아이디={}, 패스워드={}", member.getId(), member.getPass());
		int joinOk = MemberService.insert(member);
		logger.info("회원가입 성공여부 = {}", joinOk );
		
		if (joinOk == 1) {
			 member.setId("joinOkId");
		}else {
			 member.setId("joinFailId");
		}
		return member;
	}

	
	@RequestMapping(value="/memberAllList", method=RequestMethod.GET, 
			produces="text/plain;charset=UTF-8")
	public ModelAndView memberAllList(
				@RequestParam(value="command")String command,
				@RequestParam(value="pageNo",defaultValue="1")String pageNo,
				@RequestParam(value="searchKey",required=false)String searchKey,
				@RequestParam(value="searchVal",required=false)String searchVal,
				ModelAndView mav,Model model
				){
			logger.info("관리자 메인페이지에서 넘오온 명령어 ={}, 페이지넘버={}",command, pageNo);
			  
			switch (command) {
			case "list":
			     mav.addObject("memberList", MemberService.list(CommandFactory.list(Integer.parseInt(pageNo))));
			     mav.addObject("count", MemberService.size());
			     mav.setViewName("views/member/memberAllList.tiles");
				break;
			case "search":
				 switch (searchKey) {
			     case "list":
					 mav.addObject("memberList", MemberService.list(CommandFactory.list(Integer.parseInt(pageNo))));
				     mav.addObject("count", MemberService.size());
				     mav.setViewName("views/member/memberAllList.tiles");
					break;
				 case "id":
					logger.info("서치 키 값 ={}, 서치 밸류의 값 ={}",searchKey,searchVal);
					mav.addObject("valById",searchVal);
					mav.addObject("listById", MemberService.detail(CommandFactory.search(Integer.parseInt(pageNo),searchKey, searchVal)));
					mav.addObject("count", MemberService.count(CommandFactory.count(searchKey, searchVal)));
					mav.setViewName("views/member/searchSomeId.tiles");
					break;
				 case "name": 
					 logger.info("서치 키 값 ={}, 서치 밸류의 값 ={}",searchKey,searchVal);
					 mav.addObject("valByName",searchVal);
					 mav.addObject("listByName", MemberService.searchByName(CommandFactory.search(Integer.parseInt(pageNo),searchKey, searchVal)));
					 mav.addObject("count", MemberService.count(CommandFactory.count(searchKey, searchVal)));
					 mav.setViewName("views/member/searchSomeName.tiles");		
					break;				
				 default:
					break;
				 }
			   break ; 
		default:
			break;
		}			
	return mav;
	
  }

	
	@RequestMapping(value ="/meUpdate",method=RequestMethod.GET)
	public @ResponseBody MemberDto updateForm(@ModelAttribute MemberDto user,Model model){
		logger.info("수정페이지로 넘기기 위한 콘트롤러 이동 완료");
		String sessionEmail =member.getEmail();
		int a = sessionEmail.indexOf("@");
		logger.info("@의 위치 ={}",a);
		String preEmail = sessionEmail.substring(0, a);
		member.setEmail(preEmail);	
		return member;
	}
	
	@RequestMapping(value ="/myUpdate",method=RequestMethod.GET)
	public @ResponseBody MemberDto myUpdate(@ModelAttribute MemberDto user,Model model){
		logger.info("마의 페이지에서 넘오온 콘트롤러 ");
		logger.info("마의 페이지에서 넘어온 이메일 ={} ",user.getEmail());
	    model.addAttribute("member",user);	
	    return member;
	}

	
	@RequestMapping(value="/meRevise", method=RequestMethod.GET)	
    public @ResponseBody MemberDto update(
    		@ModelAttribute("user")MemberDto user,
			@RequestParam(value="newPass")String newPass,
			@RequestParam(value="cellPhone")String cellPhone,
			@RequestParam(value="telNo")String telNo,
			@RequestParam(value="email1")String email1,
			@RequestParam(value="email2")String email2,
			@RequestParam(value="merit")String merit,
			@RequestParam(value="address")String address,
			Model model){
		String email  =  email1+email2;
		member.setEmail(email);
		logger.info("member에 담긴 이메일",user.getEmail());
		user.setEmail(email);
		user.setPass(newPass);
		user.setCellPhone(cellPhone);
		user.setTelNo(telNo);
		user.setMerit(merit);
		user.setAddress(address);
		
		logger.info("비번 수정 됨!!{}",user.getPass());
		logger.info("핸드폰 수정 됨!!{}",user.getCellPhone());
		logger.info("집전화 수정 됨!!{}",user.getTelNo());
		logger.info("이메일 수정 됨!!{}",user.getEmail());
		logger.info("회원 메리트 수정 됨!!{}",user.getMerit());
		logger.info("주소 수정 됨!!{}",user.getAddress());
		model.addAttribute("member",user);
		
		int result = MemberService.update(user);
		logger.info("수정 후 결과보기{}",result);
		
		if (result == 1) {
			logger.info("업데이트 된 member의 패스 ={}",member.getPass());
			return member ;	
		
		} else {
			member = new MemberDto();
			member.setId("updataFail");
			return member;
		}
	}

	
	@RequestMapping(value="/meDelete", method=RequestMethod.GET)
	public @ResponseBody MemberDto delete(
			@ModelAttribute MemberDto user,
			Model model,
			SessionStatus status){
		logger.info("회원탈퇴 : 아이디={}", member.getId());
		int deleteOk = MemberService.delete(member);
		status.setComplete(); 
		logger.info("회원탈토 성공여부 = {}", deleteOk);
		return member;
	}

	
	@RequestMapping(value ="/searchByName" ,method=RequestMethod.GET, 
			produces="text/plain;charset=UTF-8" )
	public @ResponseBody List<MemberDto> searchByName(
			@RequestParam("inputName")String name,
			@RequestParam("inputCellPhone")String cellPhone){
		logger.info(" 넘어온 이름, 휴대전화번호 ={},{}",name,cellPhone);
		return MemberService.getElementInfo(CommandFactory.search(name,cellPhone));
	}
	 /* 회원 정보 추축(이름/핸드폰번호) */
		@RequestMapping(value ="/searchByName", method=RequestMethod.GET)
		public @ResponseBody MemberDto searchByName(
				@RequestParam("inputName")String searchKey,
				@RequestParam("inputCellPhone")String searchVal,
				Model model){
			logger.info(" 넘어온 이름, 휴대전화번호 ={},{}",searchKey,searchVal);	
			member = MemberService.findId(CommandFactory.search(searchKey,searchVal));
			logger.info("리졸트 아이디의 이름 ={}",member.getName());
			logger.info("리졸트 아이디의 전화번호 ={}",member.getCellPhone());
			logger.info("키값 ={}",searchKey);
			logger.info("전화번호 ={}",searchVal);
			searchVal = member.getCellPhone();
			
			if (member !=null) {
				return member;	
			}else{
				member = new MemberDto();
				member.setId("searchFail");
				return member;
			}
		}
		
		

		/* 회원 정보 추축(아이디/핸드폰번호) */
		@RequestMapping(value ="/searchById", method=RequestMethod.GET )
		public @ResponseBody MemberDto searchByPass(
				@RequestParam("inputId")String searchKey,
				@RequestParam("inputCellPhone")String searchVal,
				@ModelAttribute MemberDto user,Model model){
			logger.info("넘어온 값 : id={}, cellPhone={}", searchKey,searchVal);		
			member= MemberService.findPass(CommandFactory.search(searchKey, searchVal));

			logger.info("리졸트 아이디의 아이디 ={}",member.getId());
			logger.info("리졸트 아이디의 전화번호 ={}",member.getCellPhone());
			logger.info("리졸트 아이디의 패스워드 ={}",member.getPass());
			logger.info("키값 ={}",searchKey);
			logger.info("전화번호 ={}",searchVal);
			searchVal = member.getCellPhone();
			
			if (member !=null) {
				return member;	
			}else{
				member = new MemberDto();
				member.setId("searchFail");
				return member;
			}
		}

		@RequestMapping(value="/idChek/{inputId}", method=RequestMethod.GET)
		public @ResponseBody int idChek(
			    @ModelAttribute MemberDto user,Model model,
				@PathVariable("inputId") String inputId
	             ){ 
		String searchKey = "id", searchVal = inputId;
		int idchekResult;
	    logger.info("넘오온 인풋아이디값 : ={}",inputId);
	    logger.info("넘오온 서치키 : ={}",searchKey);
	    logger.info("넘오온 서치밸 : ={}",searchVal);
	    idchekResult= MemberService.count(CommandFactory.search(searchKey, searchVal));
	  
	      if(idchekResult == 1){
	    	 logger.info("사용할 수 없는 아아디 ");   	
	      }else if (idchekResult == 0) {
	    	logger.info("사용가능한 아이디 아이디");  	
		  }else{
			logger.info("시스템 오류");
		  }	
	      return idchekResult; 
	      
	   }
		
		 
}
