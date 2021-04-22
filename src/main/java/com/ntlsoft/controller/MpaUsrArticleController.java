package com.ntlsoft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MpaUsrArticleController {
	
	@RequestMapping("/mpaUsr/article/list")
	public String showList(HttpServletRequest request, @RequestParam(defaultValue = "1") int boardId, String searchKeywordtype, String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		
		
		
		return "/mpaUsr/article/list";
	}
	
	@RequestMapping("/mpaUsr/article/detail")
	public String showDetail() {
		
		return "/mpaUsr/article/detail";
	}

	@RequestMapping("/mpaUsr/article/write")
	public String showWrite() {
		
		return "/mpaUsr/article/write";
	}
	
	@RequestMapping("/mpaUsr/article/doWrite")
	public String doWrite() {
		
		return "/mpaUsr/article/doWrite";
	}
	
	@RequestMapping("/mpaUsr/article/modify")
	public String showModify() {
		
		return "/mpaUsr/article/modify";
	}
	
	@RequestMapping("/mpaUsr/article/DoModify")
	public String doModify() {
		
		return "/mpaUsr/article/doModify";
	}
	
	@RequestMapping("/mpaUsr/article/delete")
	public String showDelete() {
		
		return "/mpaUsr/article/delete";
	}
	
	@RequestMapping("/mpaUsr/article/doDelete")
	public String doDelete() {
		
		return "/mpaUsr/article/doDelete";
	}
	
}
