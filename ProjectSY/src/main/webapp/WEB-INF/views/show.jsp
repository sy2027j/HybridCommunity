<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"  %>
<!DOCTYPE html>
<html lang="en">
   <c:if test="${ member == null }">
   <script type="text/javascript">
  			alert("로그인 하세요.");
  			window.location = '/ex/login';
		</script>
   </c:if>
<div class="container">
	<div id="layoutSidenav_content">
				<h2 class="mt-5" align="center">게시글 조회</h2><br>
			<div class="memberManager">
			
				<table class="table" id="list" style="table-layout: fixed;">
					
					<tbody>
					<tr>
					<td style="width: 30%;">제목</td>
					<td style="text-align:left;"><c:out value="${detail.getTitle() }" /></td>
					
					<td style="width: 30%;">작성자</td >
					<td style="text-align:left;"><c:out value="${detail.getMem_id() }" /></td>
					</tr>
					<tr>
					<td style="width: 30%;">작성일</td>
					<td colspan = "3" style="text-align:left;"><c:out value="${detail.getDate() }" /></td>
					</tr>
					<tr>
					<td style="width: 30%;">내용</td>
					<td colspan = "3"><textarea disabled="disabled" name = content cols=85 rows=7 style="width: 100%;" id="content" name="content" readonly><c:out value="${detail.getContent() }" /></textarea></td>
					</tr>
					<tr>
					<td style="width: 30%;">첨부파일</td>
					<td colspan = "3"><img align="left" class="" style="max-width: 100%; height: auto;" src = '<c:url value="/resources/image/${detail.getFile_name() }"/>' alt=""></td>
					</tr>
					</tbody>
					
				</table>
				
			</div>
	</div>
	<div style="float:right">
	<!-- 작섣자 아아디와 로그인 세션의 아이디가 같으면 수정 삭제 버튼을 보여준다 -->
	<c:if test="${ member.mem_id eq detail.getMem_id() }">
	<button type="button"class="btn btn-primary" onclick="location.href='modify?no=${detail.getNo()}'">수정</button>
	&nbsp;&nbsp;&nbsp;<button type="button"class="btn btn-primary" onclick="location.href='delete?no=${detail.getNo()}'">삭제</button>
	</c:if>
	&nbsp;&nbsp;&nbsp;<button type="button"class="btn btn-primary" onclick="location.href='index'">목록</button>
	</div>
</div><br/><br/><br/>

</body>
</html>