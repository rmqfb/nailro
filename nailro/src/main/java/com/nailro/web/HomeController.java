package com.nailro.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/*로그인 하지 않은 일반 사용자(user) 통과하는 홈 메소드*/
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale){
		logger.info("홈컨트롤러", locale);
		
		return "home/template.tiles";	
	}
	/*로그인 완료한 사용자(member)  통과하는 홈 메소드*/
	/*@RequestMapping(value = "/memberhome", method = RequestMethod.GET)
	public String homeMember(Locale locale, Model model) {
		logger.info("홈멤버 콘트롤러까지 옴(로그인 상태)", locale); 
		return "home/templateMember.tiles";	
	}*/
	/*로그인 완료한 사용자(member)  통과하는 홈 메소드*/
	@RequestMapping(value = "/memberhome", method = RequestMethod.GET)
	public String homeMember(Locale locale, Model model) {
		logger.info("홈멤버 콘트롤러까지 옴(로그인 상태)", locale); 
		return "home/template.tiles";	
	}
	@RequestMapping(value = "/adminForm", method = RequestMethod.GET)
	public String adminForm(Locale locale, Model model) {
		logger.info("관리자 로그인폼으로 ", locale);
		return "member/adminAuthorityForm.tiles";
	}
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String admin(Locale locale, Model model) {
		logger.info("관리자 로그인성공", locale);
		return "views/erp/grossprofitAdmin.tiles";
	}
	
}
