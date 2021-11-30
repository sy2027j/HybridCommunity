<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="./header.jsp"  %>
         <header class="masthead text-center">
<div class="container">
	<div id="layoutSidenav_content">
				<br><h2 class="mt-4" align="center">게시글 목록</h2><br>
				<div style="float:right">
				<form method="get" id="mem_Search" name="mem_Search" action="Search">
					<input id="keyword" name="keyword" type="text" placeholder="검색창">&nbsp;
					<input id="datepicker" name="datepicker" type="text">
					<button class="btn btn-primary" type="submit">검색</button>
				</form><br>
				</div>
			<br>
			<div class="memberManager">
				<table class="table table-hover" id="qnalist" style="table-layout: fixed;">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
					<tr>
					<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					</thead>
					<tbody>
					<tr>
							<tr>
								<td><a style="color: black; text-decoration: none"></a></td>
								<td></td>
								<td></td>
							</tr>
					</tbody>
				</table>
			</div>
	</div>
	<button type="button"style="float: right;"class="btn btn-primary" onclick="location.href='write'">등록</button>
</div>
</header>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

</body>
</html>