package com.ntlsoft.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ntlsoft.dto.Article;
import com.ntlsoft.dto.Board;
import com.ntlsoft.service.ArticleService;
import com.ntlsoft.service.BoardService;
import com.ntlsoft.util.Util;

@Controller
public class MpaUsrArticleController {
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/mpaUsr/article/list")
	public String showList(HttpServletRequest request, @RequestParam(defaultValue = "1") int boardId, String searchKeywordtype, String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		// 게시판번호 초기값 설정 1, 페이지 번호 초기값 설정 1
		
		// list.jsp에서 사용할 보드 관련 데이터를 검색 
		Board board = boardService.getBoardById(boardId);
		
		if (Util.isEmpty(searchKeywordtype)) {
			searchKeywordtype = "titleAndBody";
		}
		
		if (board == null) {
			return Util.msgAndBack(request, boardId + "번 게시판이 존재하지 않습니다.");
		}
		
		// list.jsp에서 사용할 데이터는 request에 담아서 전달 / list에서 보드 관련 데이터는 board에 담겨 있어 바로 활용 가 
		request.setAttribute("board", board);
		
		// 페이지네이션에 필요한 데이터 정리 및 전달 
		
		// 퀴리에 입력된 조건에 맞는 게시글의 수 (보드아이디, 키워드타입, 키워드) 
		int totalItemsCount = articleService.getArticlesTotalCount(boardId, searchKeywordtype, searchKeyword);
		
		// list.jsp에서 사용할 데이터는 request에 담아서 전달 
		request.setAttribute("totalItemsCount", totalItemsCount);
		
		// 한 페이지에 보여줄 게실물의 개수 
		int itemsCountInAPage = 20;
		// 검색된 총 페이지 개수 
		int totalPage = (int)(Math.ceil(totalItemsCount / (double)itemsCountInAPage));
		
		// list.jsp에서 사용할 데이터는 request에 담아서 전달 
		request.setAttribute("page", page);		
		request.setAttribute("totalPage", totalPage);		
		
		// 리스트에 보여줄 게시물들 
		List<Article> articles = articleService.getForPrintArticles(boardId, searchKeywordtype, searchKeyword, itemsCountInAPage , page);
		
		// list.jsp에서 사용할 데이터는 request에 담아서 전달 
		request.setAttribute("articles", articles);
		
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
