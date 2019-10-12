package com.inhatc.mall;

import java.text.DateFormat;
import java.util.Date;
import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;	
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.service.CenterService;
import com.inhatc.vo.CenterVO;
import com.inhatc.vo.Criteria;
import com.inhatc.vo.Search;;

@Controller
@RequestMapping(value = "/mall/qna/")
public class CenterController {
	@Inject
	private CenterService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String ListAll(Criteria cri,Search sch,Model model, HttpSession session) throws Exception {
		cri.setSizeOfPage(10);
		cri.setNumberOfRecords(service.searchBoardCount(sch));
		cri.makePaging();
		if(session.getAttribute("id") != null)
			model.addAttribute("session", "yes");
		model.addAttribute("page", service.search(sch, cri));
		model.addAttribute("pager", cri);
		model.addAttribute("search", sch);
		return "/mall/qna/list";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void CreateGET(HttpSession session, Model model) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String CreatePOST(Model model, CenterVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		service.create(vo);
		rttr.addFlashAttribute("result", "success");

		return "redirect:/mall/qna/list";
		}
	
	@RequestMapping(value ="/read", method = RequestMethod.GET)
    public void detail(@RequestParam("c_no") int c_no, Model model, HttpSession session) throws Exception{
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		
        System.out.println("글 번호"+c_no+"번의 상세내용 페이지");
        
        model.addAttribute("read", service.read(c_no));
        
    }
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String DeleteList(Model model, CenterVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		service.deleteList(vo.getC_no());
		
		return "redirect:/mall/qna/list";
		}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void UpdateList(Model model, CenterVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		model.addAttribute("update", service.read(vo.getC_no()));
		}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String Update(CenterVO vo) throws Exception {
		service.UpdateList(vo);
		return "redirect:/mall/qna/list";
		}
}
