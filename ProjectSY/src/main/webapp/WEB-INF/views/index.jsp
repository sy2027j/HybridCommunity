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
  <script>
 
  $(function() {   
	  	var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		if(dd < 10){
			dd = '0'+dd
		}

		if(mm < 10){
			mm = '0'+mm
		}

      $( "#date" ).datepicker();
      $( "#date" ).datepicker( "option", "dateFormat", "yyyy-mm-dd" );
  }); 
  
	//검색 키워드와 날짜 받아오기
  	String keyword=request.getParameter("keyword");
	String date = request.getParameter("date");
	String date2 = request.getParameter("date2");
  </script>
  
  <!-- 로그인 세션이 없을 때 -->
  <c:if test="${ member == null }">
   <script type="text/javascript">
  			alert("로그인 하세요.");
  			window.location = '/ex/login';
	</script>
  </c:if>
  
<div class="container">
	<div id="layoutSidenav_content">
		<h2 class="mt-5" align="center">게시글 목록</h2><br>
			<div style="float:right" >
				<form role="form" method="get" autocomplete="off" action="search">
					<input  id="keyword" name="keyword" type="text" placeholder="검색창" value='<c:if test="${keyword ne null }">${keyword}</c:if>'>&nbsp;
					<input  id="date" name="date" type="date" value='<c:if test="${date ne null }">${date}</c:if>'>
					<input  id="date2" name="date2" type="date" value='<c:if test="${date2 ne null }">${date2}</c:if>'>
					<button class="btn btn-primary" type="submit">검색</button>
				</form><br/>
			</div><br>
	<div class="memberManager">
		<table class="table table-hover" id="list" style="table-layout: fixed;">
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
				<c:forEach items="${List}" var="list" varStatus="status">
					<!-- 테이블 아무데나 눌러도 넘어가게 -->
					<tr onclick="location.href='show?no=${list.getNo()}'">
						<!-- 게시물 총 개수 - index번째 - 페이지 번호 * 게시물개수 -->
						<td><c:out value="${(Paging.totalCount - status.index)-((Paging.pageNo-1)*10)}"/></td>
						<td><c:out value="${list.getTitle() }" /></td>
						<td><c:out value="${list.getMem_id() }" /></td>
						<td><c:out value="${list.getDate() }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<!-- 검색 키워드와 날짜가 null 이면 모든 게시글 목록을 보여주기 -->
				<c:choose>
				<c:when test="${keyword eq null || date eq null}">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
								<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
										<li class="page-item disabled">
											<a class="page-link" href="index?page=${Paging.prevPageNo}">이전</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="index?page=${Paging.prevPageNo}">이전</a>
										</li>
									</c:otherwise>
								</c:choose>
								<!-- 페이지 갯수만큼 버튼 생성 -->
								<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
									<c:choose>
										<c:when test="${i eq Paging.pageNo }">
											<li class="page-item disabled">
												<a class="page-link" href="index?page=${i}"><c:out value="${i }"/></a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="index?page=${i}"><c:out value="${i }"/></a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
										<li class="page-item disabled">
											<a class="page-link" href="index?page=${Paging.nextPageNo}">다음</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="index?page=${Paging.nextPageNo}">다음</a>
										</li>
									</c:otherwise>
								</c:choose>
					</ul>
				</nav>
				</c:when>
				<c:when test="${keyword ne null || date ne null}">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
								<!-- 첫 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.firstPageNo }">
										<li class="page-item disabled">
											<a class="page-link" href="search?page=${Paging.prevPageNo}&keyword=${keyword}&date=${date}&date2=${date2}">이전</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="search?page=${Paging.prevPageNo}&keyword=${keyword}&date=${date}&date2=${date2}">이전</a>
										</li>
									</c:otherwise>
								</c:choose>
								<!-- 페이지 갯수만큼 버튼 생성 -->
								<c:forEach var="i" begin="${Paging.startPageNo }" end="${Paging.endPageNo }" step="1">
									<c:choose>
										<c:when test="${i eq Paging.pageNo }">
											<li class="page-item disabled">
												<a class="page-link" href="search?page=${i}&keyword=${keyword}&date=${date}&date2=${date2}"><c:out value="${i }"/></a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="search?page=${i}&keyword=${keyword}&date=${date}&date2=${date2}"><c:out value="${i }"/></a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 마지막 페이지면 Disabled 아니라면 Enabled -->
								<c:choose>
									<c:when test="${Paging.pageNo eq Paging.finalPageNo }">
										<li class="page-item disabled">
											<a class="page-link" href="search?page=${Paging.nextPageNo}&keyword=${keyword}&date=${date}&date2=${date2}">다음</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="search?page=${Paging.nextPageNo}&keyword=${keyword}&date=${date}&date2=${date2}">다음</a>
										</li>
									</c:otherwise>
								</c:choose>
					</ul>
				</nav>
				</c:when>
				</c:choose>
				<!-- 검색 키워드와 날짜가 null이 아니면 검색된 게시물 목록만 보여주기 -->
			</div>
	</div>
	<button type="button"style="float: right;"class="btn btn-primary" onclick="location.href='write'">등록</button>
</div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </body>
</html>
