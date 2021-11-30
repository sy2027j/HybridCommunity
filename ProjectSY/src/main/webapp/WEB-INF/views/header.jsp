<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <title>전서영</title>
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 		<link rel="stylesheet" href="/resources/demos/style.css">
 		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 		<link href="./resources/css/styles.css" rel="stylesheet" />
 		<link href="./resources/js/cordova.js" rel="stylesheet" />
		<style>
		th {
			text-align: center;
		}

		td {
			text-align: center;
		}
</style>
</head>
    <body id="page-top">
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase" id="mainNav">
            <div class="container">
            <div>
                <label style="color:white; font-weight:normal;">미니프로젝트_전서영</label>
                <button type="button" class="btn" style="color:white;" onclick="location.href='index'">게시판</button>
                </div>
                <div>
                <!-- 로그인 세션 값이 null인지 판단해서 메뉴가 다르게 나타난다 -->
                    <c:if test="${ member == null }"> 
      					<button type="button" class="btn" style="color:white;" onclick="location.href='login'">로그인</button>
      				</c:if>
      				<c:if test="${ member != null }">
      					<label style="color:white; font-weight:normal;">${member.mem_id } 님</label>
      					<button type="button" class="btn" style="color:white;" onclick="location.href='logout'">로그아웃</button>
      				</c:if>
                </div>
            </div>
        </nav>