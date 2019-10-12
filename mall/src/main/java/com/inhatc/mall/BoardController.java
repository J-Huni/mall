package com.inhatc.mall;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;	
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.inhatc.service.BoardService;
import com.inhatc.vo.BoardVO;
import com.inhatc.service.BuyService;
import com.inhatc.vo.BuyVO;

@Controller
@RequestMapping(value = "/mall/category/")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private BoardService service;
	
	@Inject
	private BuyService Bservice;
	
	@RequestMapping(value = "/japan", method = RequestMethod.GET)
	public void JapanList(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		model.addAttribute("list",service.JapanList());
	}
	
	@RequestMapping(value = "/createbrd", method = RequestMethod.GET)
	public void createdetail() {
	}
	
	@RequestMapping(value = "/createbrd", method = RequestMethod.POST)
	public @ResponseBody Object UpldJapan(Model model, BoardVO vo, RedirectAttributes rttr, HttpSession session, MultipartFile file) throws Exception{
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		logger.info("파일이름 : "+file.getOriginalFilename());
		logger.info("파일크기 : "+file.getSize());
		logger.info("컨텐트 타입 : "+file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		model.addAttribute("savedName", savedName);
		service.create(savedName);
		paramMap.put("name", savedName);
		return paramMap;
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+ originalName;
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData,  target);
		
		return savedName;
	}
	
	
	
	@RequestMapping(value = "/createDetail", method = RequestMethod.POST)
    public String createdt(Model model, BoardVO vo, RedirectAttributes rttr, HttpSession session, MultipartFile file) throws Exception{
		String savedName = uploadSummernote(file.getOriginalFilename(), file.getBytes());
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		logger.info("파일이름 : "+file.getOriginalFilename());
		logger.info("파일크기 : "+file.getSize());
		logger.info("컨텐트 타입 : "+file.getContentType());
		model.addAttribute("savedName", savedName);
		paramMap.put("name", savedName);
		return "http://";
    }
	private String uploadSummernote(String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+ originalName;
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData,  target);
		
		return savedName;
	}
	
/*	@RequestMapping(value = "/uploadSummer", method = RequestMethod.POST)
    public String createsummer(MultipartHttpServletRequest request) throws Exception{
		MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
		List<MultipartFile> list = multiFileMap.get(FILE2);
		MultipartFile multipartFile = list.get(0);
		Logger.info(multipartFile.getOriginalFilename());
    }*/
	
	@RequestMapping(value = "/china", method = RequestMethod.GET)
	public void ChinaList(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		model.addAttribute("list",service.ChinaList());
	}
	
	@RequestMapping(value = "/america", method = RequestMethod.GET)
	public void AmericaList(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		model.addAttribute("list",service.UsaList());
	}
	
	@RequestMapping(value = "/productread", method = RequestMethod.GET)
	public void productread(@RequestParam("p_no") int p_no, Model model, HttpSession session) throws Exception {
		if(session.getAttribute("id") != null) {
			model.addAttribute("session", "yes");
		}
		model.addAttribute("read",service.read(p_no));
	}
	
	@RequestMapping(value = "/productread", method = RequestMethod.POST)
	public void productDetail(BuyVO vo, Model model, HttpSession session) throws Exception {
		session.getAttribute("id");
	}
	
/*	@RequestMapping(value = "/eu", method = RequestMethod.GET)
	public void EuList(Model model) throws Exception {
		model.addAttribute("list",service.EuList());
		}*/
}
