package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.ArticleService;
import kr.co.util.Criteria;
import kr.co.util.PageMaker;
import kr.co.util.SearchCriteria;
import kr.co.vo.ArticleVO;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
	private ArticleService service;
	
	//등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGet() throws Exception {
		logger.info("writeGet");
		
		return "/article/write";
	}
	
	//등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes rttr) throws Exception {
		logger.info("writePOST");
		
		service.create(articleVO);
		rttr.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/article/listPaging";
	}
	
	//조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo
					 , @ModelAttribute("searchCriteria") SearchCriteria searchCriteria 
					 , Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("article", service.read(articleNo));
		
		return "/article/read";
	}
	
	//수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo
						  , @ModelAttribute("searchCriteria") SearchCriteria searchCriteria 
						  , Model model) throws Exception {
		logger.info("modifyGET");
		
		model.addAttribute("article", service.read(articleNo));
		
		return "/article/modify";
	}
	
	//수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO
							,RedirectAttributes rttr
							,SearchCriteria searchCriteria) throws Exception {
		logger.info("modifyPOST");
		
		service.update(articleVO);
		rttr.addAttribute("page", searchCriteria.getPage());
		rttr.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		rttr.addAttribute("searchType", searchCriteria.getSearchType());
		rttr.addAttribute("keyword", searchCriteria.getKeyword());
		rttr.addFlashAttribute("msg", "modSuccess");
		
		return "redirect:/article/listPaging";
	}
	
	//삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String deletePOST(@RequestParam("articleNo") int articleNo
							,RedirectAttributes rttr
							,SearchCriteria searchCriteria) throws Exception {
		logger.info("deletePOST");
		
		service.delete(articleNo);
		rttr.addAttribute("page", searchCriteria.getPage());
		rttr.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		rttr.addAttribute("searchType", searchCriteria.getSearchType());
		rttr.addAttribute("keyword", searchCriteria.getKeyword());
		rttr.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/article/listPaging";
	}
	
	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listPaging(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
		logger.info("listPaging");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(service.countSearchArticles(searchCriteria));
		
		model.addAttribute("articles", service.listSearch(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/article/listPaging";
	}

}
