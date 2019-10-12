package com.inhatc.mall;


import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

import com.inhatc.vo.LoginVO;
import com.inhatc.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Inject
	LoginService service;
	
	@RequestMapping(value = "/mall/login/login", method = RequestMethod.GET)
	public void login() {
	}
	
	@RequestMapping(value = "/mall/login/login", method = RequestMethod.POST)
	public @ResponseBody Integer login_check(Model model, LoginVO vo, HttpSession session) {
		int resultNo = 0;
		if(vo.getId().isEmpty() || vo.getPw().isEmpty()) {
			resultNo = 2;//아이디, 비밀번호 빈값
			return resultNo;
		}
		boolean result = service.login_check(vo.getId(), vo.getPw());
		System.out.println(result);
		if(result)
		{
			session.setAttribute("id", vo.getId());
			resultNo = 1; // 정상
			return resultNo;
		}
		else
		{
			return resultNo;		
		}
	}	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/";
		
	}	
}