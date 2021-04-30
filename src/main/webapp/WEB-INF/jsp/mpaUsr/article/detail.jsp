<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='far fa-clipboard'></i></span> <span>${board.name} ARTICLE DETAIL</span>" />

<%@ include file="../common/head.jspf"%>

<div class="section section-article-detail">

	<!-- Detail Info Start-->
	<section class="detail detail-info" style='background-image: url("/img/parallax_bg0.jpg");'>
		<div class="container">
			<div class="info">
				<h2 class="info__title">${board.name}</h2>
			</div>
		</div>
	</section>
	<!-- Detail Info End-->

	<div class="container mx-auto">
	    <div class="card">
            <div class="card-title">
                <a href="javascript:history.back();" class="cursor-pointer">
                    <i class="fas fa-chevron-left"></i>
                </a>
                <span>게시물 상세페이지</span>
            </div>
            <div>
                <h1 class="border-1">상세내용</h1>
                <div class="border-1 mt-8">
	                <div class="datial_info flex mt-8">
	                    <span class="border-2 mr-8">
	                        <span>Comments:</span>
	                        <span class="">30</span>
	                    </span>
	                    <span class="border-2 mr-8">
	                        <span>Views:</span>
	                        <span class="">60k</span>
	                    </span>
	                    <span class="border-2 mr-8">
	                        <span>Likes:</span>
	                        <span class="">120k</span>
	                    </span>
	                    <div class="flex-grow"></div>
	                </div>	                
                </div>
                
                
                <div class="flex-col mt-8">

                    <div class="article_info flex border-1">
                        <div class="border-2 mr-4">
                            <span class="badge mr-20">번호</span>
                            <span>${article.id}</span>
                        </div>

                        <div class="border-2 mr-4 ml-4">
                            <span class="badge mr-20">작성자</span>
                            <span>${article.extra__writerName}</span>
                        </div>

	                    <div class="flex-grow"></div>

                        <div class="border-2 mr-4 ml-4">
                            <span class="badge mr-20">등록날짜</span>
                            <span class="">${article.regDate}</span>
                        </div>

                        <div class="border-2 ml-4">
                            <span class="badge mr-20">수정날짜</span>
                            <span class=" ">${article.updateDate}</span>
                        </div>
                    </div>

                    <div class="article_title flex-left mt-8 border-1">
                        <span class="badge mr-20">제목</span>
                        <div class="border-2">
                            ${article.title}
                        </div>
                        <div class="flex-grow"></div>
					</div> 
                    
                    <div class="article_body flex mt-8 border-1">
                        <span class="flex badge mr-20">본문</span>
                        <div class="mt-3 mr-20">
                            <img class="" src="https://i.pravatar.cc/250?img=37" alt="">
                        </div>
                        <div class="mt-3">
                            ${article.bodyForPrint}
                        </div>
    	                    <div class="flex-grow"></div>
                    </div>
                </div>
            </div>

            <div class="reply flex mt-8 mb-8 border-1">
                <h1 class="px-4 mr-20">댓글</h1>
					<!-- 댓글 입력 시작 -->
                <form action="/" class="relative flex">
                    <input type="search" class="mr-20" placeholder="댓글을 입력해주세요." autocomplete="off">
                    <span>
                        <button type="submit" class="border-2">작성
                        </button>
                    </span>
                </form>
                <!-- 댓글 입력 끝 -->
            </div>
        </div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>