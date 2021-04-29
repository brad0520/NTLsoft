<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle"
	value="<span><i class='fas fa-user-plus'></i></span> <span>MEMBER JOIN</span>" />

<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
let MemberJoin__submitFormDone = false;
function MemberJoin__submitForm(form) {
    if ( MemberJoin__submitFormDone ) {
        return;
    }

    form.loginId.value = form.loginId.value.trim();

    if ( form.loginId.value.length == 0 ) {
        alert('로그인아이디를 입력해주세요.');
        form.loginId.focus();

        return;
    }

    form.loginPwInput.value = form.loginPwInput.value.trim();

    if ( form.loginPwInput.value.length == 0 ) {
        alert('로그인비밀번호을 입력해주세요.');
        form.loginPwInput.focus();

        return;
    }

    form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

    if ( form.loginPwConfirm.value.length == 0 ) {
        alert('로그인비밀번호 확인을 입력해주세요.');
        form.loginPwConfirm.focus();

        return;
    }

    if ( form.loginPwInput.value != form.loginPwConfirm.value ) {
        alert('로그인비밀번호가 일치하지 않습니다.');
        form.loginPwConfirm.focus();

        return;
    }

    form.name.value = form.name.value.trim();

    if ( form.name.value.length == 0 ) {
        alert('이름을 입력해주세요.');
        form.name.focus();

        return;
    }

    form.nickname.value = form.nickname.value.trim();

    if ( form.nickname.value.length == 0 ) {
        alert('별명을 입력해주세요.');
        form.nickname.focus();

        return;
    }

    form.cellphoneNo.value = form.cellphoneNo.value.trim();

    if ( form.cellphoneNo.value.length == 0 ) {
        alert('휴대전화번호를 입력해주세요.');
        form.cellphoneNo.focus();

        return;
    }


    form.email.value = form.email.value.trim();

    if ( form.email.value.length == 0 ) {
        alert('이메일을 입력해주세요.');
        form.email.focus();

        return;
    }

    form.loginPw.value = sha256(form.loginPwInput.value);
    form.loginPwInput.value = '';
    form.loginPwConfirm.value = '';

    form.submit();
    MemberJoin__submitFormDone = true;
}
</script>

<div class="section-member section-join flex px-2">
	<div class="container">
	    <form method="POST" action="doJoin" onsubmit="MemberJoin__submitForm(this); return false;">
	        <input type="hidden" name="loginPw">
	        
    	        <div class="flex flex-center border-2 font-size-20">
                <span class="py-8">
                    회원가입
                </span>
               
            </div>
	        
	        <div class="flex form-control mt-8 border-1">
                <label class="label">
                    아이디
                </label>
                <input class="" type="text" maxlength="30" name="loginId" placeholder="로그인아이디를 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    비밀번호
                </label>
                <input class="" type="password" maxlength="30" name="loginPwInput" placeholder="로그인비밀번호를 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    비밀번호 확인
                </label>
                <input class="" type="password" maxlength="30" name="loginPwConfirm" placeholder="로그인비밀번호 확인을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    이름
                </label>
                <input class="" type="text" maxlength="30" name="name" placeholder="이름을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    별명
                </label>
                <input class="" type="text" maxlength="30" name="nickname" placeholder="별명을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    휴대전화번호
                </label>
                <input class="" type="tel" maxlength="30" name="cellphoneNo" placeholder="휴대전화번호를 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <label class="label">
                    이메일
                </label>
                <input class="" type="email" maxlength="50" name="email" placeholder="이메일을 입력해주세요." />
            </div>

            <div class="flex form-control mt-8 border-1">
                <a type="submit" class="border-main flex flex-grow flex-center mr-4">
                    <span><i class="fas fa-user-plus"></i></span>
                    &nbsp;
                    <span>가입</span>
                </a>
			
                <a href="../home/main" class="border-2 flex flex-grow flex-center ml-4">
                    <span><i class="fas fa-home"></i></span>
                    &nbsp;
                    <span class="class=border-2">홈</span>
                </a>
            </div>
	    </form>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>