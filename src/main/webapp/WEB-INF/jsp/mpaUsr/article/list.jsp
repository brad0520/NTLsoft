<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='far fa-clipboard'></i></span> <span>${board.name}</span>" />

<%@ include file="../common/head.jspf"%>
<!-- Board Info Start-->
<section class="board board-info" style='background-image: url("/img/board_info_bg${board.id}.jpg");'>
	<div class="container">
		<div class="info">
			<h2 class="info__title">${board.name}</h2>
		</div>
	</div>
</section>
<!-- Board Info End-->

<!-- List Start-->
<div class="section section-article-list">
	<div class="container mx-auto">
		<div class="wrapper">
			<div class="total-items">
				<span>TOTAL ITEMS : </span>
				<span>${totalItemsCount}</span>
			</div>
			<div class="total-pages">
				<span>TOTAL PAGES : </span>
				<span>${totalPage}</span>
			</div>
			<div class="page">
				<span>CURRENT PAGE : </span>
				<span>${page}</span>
			</div>
			<div class="box"></div>
			<div class="plain-link-wrap gap-3 mt-4">
	            <a href="write?boardId=${board.id}" class="plain-link">
	                <span><i class="fas fa-edit"></i></span>
	                <span>글 작성</span>
	            </a>
	        </div>

		</div>


		<div class="search-form-box mt-2 px-4">
			<form action="" class="grid gap-2">
				<input type="hidden" name="boardId" value="${board.id}" />

				<div class="form-control">
					<label class="label">
						<span class="label-text">선택</span>
					</label>
					<select class="select select-bordered" name="searchKeywordType">
						<option value="titleAndBody">제목+내용</option>
						<option value="title">제목</option>
						<option value="body">내용</option>
					</select>
					<script>
						const param__searchKeywordType = '${param.searchKeywordType}';
						if (param__searchKeywordType.length > 0) {
							$(
									'.search-form-box form [name="searchKeywordType"]')
									.val('${param.searchKeywordType}');
						}
					</script>
				</div>
				
				<div class="form-control">
					<label class="label">
						<span class="label-text">검색어</span>
					</label>
					<input value="${param.searchKeyword}" class="input input-bordered"
						name="searchKeyword" type="text" placeholder="검색어를 입력해주세요."
						maxlength="10" />
				</div>

				<div class="form-control">
					<label class="label">
						<span class="label-text"></span>
					</label>
					<input type="submit" class="" value="검색" />
				</div>

				<div class="box"></div>

			</form>
		</div>

		<div class="articles mt-2">
			<hr />
			<c:if test="${articles == null || articles.size() == 0}">
				검색결과가 존재하지 않습니다.
			</c:if>
			<c:forEach items="${articles}" var="article">
				<div class="flex">
					<a href="/mpaUsr/article/detail?id=${article.id}">
						<span>글번호 : ${article.id}</span>
						<span>제목 : ${article.title}</span>
					</a>
					<span class="box"></span>		
					<div class="flex">		
						<span>작성일 : ${article.regDate}</span>
						<span>수정일 : ${article.updateDate}</span>
					</div>
				</div>
				<hr />
			</c:forEach>
		</div>

		<div class="pages mt-4 mb-4 text-center">
			<c:set var="pageMenuArmSize" value="4" />
			<c:set var="startPage"
				value="${page - pageMenuArmSize >= 1 ? page - pageMenuArmSize : 1}" />
			<c:set var="endPage"
				value="${page + pageMenuArmSize <= totalPage ? page + pageMenuArmSize : totalPage}" />

			<c:set var="uriBase" value="?boardId=${board.id}" />
			<c:set var="uriBase"
				value="${uriBase}&searchKeywordType=${param.searchKeywordType}" />
			<c:set var="uriBase"
				value="${uriBase}&searchKeyword=${param.searchKeyword}" />
				
			<c:set var="aClassStr"
				value="px-2 inline-block border border-gray-200 rounded text-lg hover:bg-gray-200" />

			<c:if test="${startPage > 1}">
				<a class="${aClassStr}" href="${uriBase}&page=1">◀◀</a>
				<a class="${aClassStr}" href="${uriBase}&page=${startPage - 1}">◀</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a class="${aClassStr} ${page == i ? 'text-red-500' : ''}"
					href="${uriBase}&page=${i}">${i}</a>
			</c:forEach>

			<c:if test="${endPage < totalPage}">
				<a class="${aClassStr}" href="${uriBase}&page=${endPage + 1}">▶</a>

				<a class="${aClassStr}" href="${uriBase}&page=${totalPage}">▶▶</a>
			</c:if>
		</div>
	</div>
</div>
<!-- List End-->

<%@ include file="../common/foot.jspf"%>