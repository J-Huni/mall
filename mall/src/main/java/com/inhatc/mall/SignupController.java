package com.inhatc.mall;


import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;

import com.inhatc.vo.SignupVO;
import com.inhatc.service.SignupService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SignupController {
	
	@Inject
	SignupService service;
	
	@RequestMapping(value = "/mall/login/signup", method = RequestMethod.GET)
	public void login() {
	}
	
	@RequestMapping(value = "/mall/login/signup", method = RequestMethod.POST)
	public String Signup(SignupVO vo, Model model, RedirectAttributes rttr) throws Exception {
		int result=service.Signup(vo);
		System.out.println(result);
		if(result==1){
			System.out.println("회원가입성공");
			rttr.addFlashAttribute("success","success");
			 return "redirect:/mall/login/login";
		}else{
			System.out.println("회원가입실패");
			model.addAttribute("success","fail");
			return "/mall/login/signup";	
		}
	}	
}