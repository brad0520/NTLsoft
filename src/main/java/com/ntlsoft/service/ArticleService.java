package com.ntlsoft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ntlsoft.dao.ArticleDao;
import com.ntlsoft.dto.Article;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	
	public int getArticlesTotalCount(int boardId, String searchKeywordtype, String searchKeyword) {
		if (searchKeyword != null && searchKeyword.length() == 0) {
			searchKeyword = null;
		}
		
		return articleDao.getArticlesTotalCount(boardId, searchKeywordtype, searchKeyword);
	}

	public List<Article> getForPrintArticles(int boardId, String searchKeywordtype, String searchKeyword,
			int itemsCountInAPage, int page) {
		
		int limitForm = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
		
		return articleDao.getForPrintArticles(boardId, searchKeywordtype, searchKeyword, itemsCountInAPage, page, limitForm, limitTake);
	}

}
