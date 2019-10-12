package com.inhatc.mall;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inhatc.service.BuyService;
import com.inhatc.vo.BoardVO;
import com.inhatc.vo.BuyVO;

@Controller
@RequestMapping(value = "/mall/order/")
public class BuyContoller {
	
	@Inject
	private BuyService service;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(BoardVO vo, Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
			model.addAttribute("order",service.OrderList(vo));
			model.addAttribute("b_amount", vo.getB_amount());
			return "/mall/order/order";
		}
		else{
			return "redirect:/mall/login/login";
		}
	}
	
/*	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public void orderdetail(BuyVO vo, Model model) throws Exception {
		service.buyProduct(vo);
		
	}
	*/
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public @ResponseBody Object orderdetail(BuyVO vo, Model model) throws Exception {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		int result = service.buyProduct(vo);
		paramMap.put("success", result);
		System.out.println(result);
		return paramMap;
	}
	
}