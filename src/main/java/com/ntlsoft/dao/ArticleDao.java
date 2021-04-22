package com.ntlsoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ntlsoft.dto.Article;

@Mapper
public interface ArticleDao {

	int getArticlesTotalCount(@Param("boardId") int boardId, @Param("searchKeywordtype") String searchKeywordtype, @Param("searchKeyword") String searchKeyword);

	List<Article> getForPrintArticles(@Param("boardId") int boardId, @Param("searchKeywordtype")String searchKeywordtype, @Param("searchKeyword")String searchKeyword,
			@Param("itemsCountInAPage")int itemsCountInAPage, @Param("page") int page, @Param("limitForm") int limitForm, @Param("limitTake") int limitTake);

}
