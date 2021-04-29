<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='fas fa-sign-in-alt'></i></span> <span>FIND LOGIN ID</span>" />

<%@ include file="../common/head.jspf"%>

<script>
let MemberFindLoginId__submitFormDone = false;
function MemberFindLoginId__submitForm(form) {
    if ( MemberFindLoginId__submitFormDone ) {
        return;
    }

    form.name.value = form.name.value.trim();

    if ( form.name.value.length == 0 ) {
        alert('이름을 입력해주세요.');
        form.name.focus();

        return;
    }

    form.email.value = form.email.value.trim();

    if ( form.email.value.length == 0 ) {
        alert('이메일을 입력해주세요.');
        form.email.focus();

        return;
    }

    form.submit();
    MemberFindLoginId__submitFormDone = true;
}
</script>

<div class="section-member section-find-login-id flex px-2">
	<div class="container">
	    <form method="POST" action="doFindLoginId" onsubmit="MemberFindLoginId__submitForm(this); return false;">
	        <input type="hidden" name="redirectUri" value="${param.afterLoginUri}" />
	        
   	        <div class="flex flex-center border-2 font-size-20">
                <span class="py-8">
                    아이디 찾기
                </span>
            </div>	        
	        
			<div class="flex form-control mt-8 border-1">
                <label class="label">
                    이름
                </label>
                <input autofocus class="input input-bordered w-full" type="text" maxlength="30" name="name" placeholder="이름을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    이메일
                </label>
                <input class="input input-bordered w-full" type="email" maxlength="100" name="email" placeholder="이메일을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <a type="submit" href="../member/login" class="flex flex-grow flex-center border-main mr-4">
                    <span><i class="fas fa-sign-in-alt"></i></span>
                    &nbsp;
                    <span>아이디 찾기</span>
                </a>

                <a href="../member/login" type="submit" href="#" class="flex flex-grow flex-center border-2 ml-4 mr-4">
                    <span><i class="fas fa-sign-in-alt"></i></span>
                    &nbsp;
                    <span>로그인</span>
                </a>

                <a href="../member/join" type="submit" href="#" class="flex flex-grow flex-center border-2 ml-4 mr-4">
                    <span><i class="fas fa-sign-in-alt"></i></span>
                    &nbsp;
                    <span>회원가입</span>
                </a>

                <a href="../member/findLoginPw" type="submit" href="#" class="flex flex-grow flex-center border-2 ml-4 mr-4">
                    <span><i class="fas fa-sign-in-alt"></i></span>
                    &nbsp;
                    <span>비밀번호 찾기</span>
                </a>

                <a href="../home/main" class="flex flex-grow flex-center border-2 ml-4">
                    <span><i class="fas fa-home"></i></span>
                    &nbsp;
                    <span>홈</span>
                </a>
            </div>
	    </form>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>