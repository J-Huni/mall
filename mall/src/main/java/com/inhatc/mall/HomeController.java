package com.inhatc.mall;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inhatc.service.HomeService;
import com.inhatc.vo.SignupVO;


@Controller
public class HomeController {
	
	@Inject
	private HomeService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}				
		return "/mall/main";
	}
	
	@RequestMapping(value = "/mall/modifyID", method = RequestMethod.GET)
	public void modify(SignupVO vo,Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		model.addAttribute("modify",service.modifyID(vo));
		System.out.print(service.modifyID(vo));
	}
	
	@RequestMapping(value = "/mall/adPage/admin", method = RequestMethod.GET)
	public void admin() throws Exception {

	}
	
	@RequestMapping(value = "/mall/adPage/user", method = RequestMethod.GET)
	public void adminuser(SignupVO vo,Model model) throws Exception {
		model.addAttribute("user",service.userList());
	}
	
	@RequestMapping(value = "/mall/adPage/product", method = RequestMethod.GET)
	public void adminproduct(Model model) throws Exception {
		model.addAttribute("product",service.productList());
	}
	
/*	@RequestMapping(value = "/mall/modifyID", method = RequestMethod.POST)
	public @ResponseBody Object modifyID(SignupVO vo, Model model, HttpSession session) throws Exception{
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", vo.getId());
		model.addAttribute("modify", );
		System.out.print(service.modifyID(vo.getId()));
		return paramMap;
	}*/
}
