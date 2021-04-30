<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ntlsoft.util.Util" %>

<c:set var="pageTitle"
	value="<span><i class='fas fa-sign-in-alt'></i></span> <span>MYPAGE</span>" />

<%@ include file="../common/head.jspf"%>

<div class="section-member flex section-mypage px-2">
    <div class="container">
        <!-- 회원 아이템, first -->
        <form class="px-4 py-8">
			<div
				class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">

				<div class="flex flex-center border-2 font-size-20">
	                <span class="py-8">
	                	마이페이지
	                </span>
	            </div>

				<div href="#" class="flex-left mt-8 border-1">
					<img class="rounded-full" src="https://i.pravatar.cc/100?img=37"
						alt="">
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">번호</span> <span>${rq.loginedMember.id}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">회원타입</span> <span>${rq.loginedMember.authLevelName}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">등록날짜</span> <span
						class="text-gray-600 text-light">${rq.loginedMember.regDate}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">수정날짜</span> <span
						class="text-gray-600 text-light">${rq.loginedMember.updateDate}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">로그인아이디</span> <span class="text-gray-600">${rq.loginedMember.loginId}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">이름</span> <span class="text-gray-600">${rq.loginedMember.name}</span>
				</div>

				<div href="#" class="flex-left border-1">
					<span class="mr-8">별명</span> <span class="text-gray-600">${rq.loginedMember.nickname}</span>
				</div>
			</div>

			<div class="flex mt-8">
                    <a href="../member/checkPassword?afterUri=${Util.getUriEncoded('../member/modify')}" class="flex mr-4">
                        <span class="flex-center border-2">
                            <i class="fas fa-edit"></i>
                            <span>수정</span>
                        </span>
                    </a>
                    <a onclick="if ( !confirm('삭제하시겠습니까?') ) return false;" href="#" class="flex-grow flex ml-4">
                        <span class="flex-center border-2">
                            <i class="fas fa-trash"></i>
                            <span>탈퇴</span>
                        </span>
                    </a>
                </div>
            </form>
    </div>
</div>

<%@ include file="../common/foot.jspf"%>