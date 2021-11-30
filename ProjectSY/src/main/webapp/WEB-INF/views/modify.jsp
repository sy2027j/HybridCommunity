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
				<h2 class="mt-5" align="center">게시글 수정</h2><br>
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
<input type="hidden" name="no" id="no" value="${detail.getNo()}" /> <br>
			<div class="memberManager">
				<table class="table" id="list" style="table-layout: fixed;">
					
					<tbody>
					<tr>
					<td style="width: 30%;">제목</td>
					<td><input type="Text"style="width: 100%;" id="title" name="title" value="${detail.getTitle()}"></td>
					</tr>
					<tr>
					<td style="width: 30%;">내용</td>
					<td><textarea name = content cols=85 rows=7 style="width: 100%;" id="content" name="content">${detail.getContent() }</textarea></td>
					</tr>
					<tr>
					<!-- 앱일 떄와 웹일 때를 구분해서 앱에서는 카메라와 갤러리를 사용할 수 있게 한다 -->
					<c:choose>
							<c:when test="${mobile ne null }">
								<td style="width: 30%;">첨부파일</td>
								<td><div style="float:left"><input type="button" class="btn btn-primary" onclick="cameraf()" value="사진찍기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary" onclick="camerag()" value="가져오기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary" onclick="d();" value="삭제"></div><br/><br/>
									<div class="select_img"><img id="coimg" src='<c:url value="/resources/image/${detail.getFile_name() }"/>' style="max-width: 100%; height: auto;"/></div>
								</td>
							</c:when>
							<c:otherwise>
								<td style="width: 30%;">첨부파일</td>
								<td>
									<div class="select_img">
									<div class="custom-file" id="inputFile">
                    				<input name="filen" type="file" class="custom-file-input" id="filen">
                    				<label class="custom-file-label" for="customFile">${detail.getFile_name() }</label><br/><br/>
                    				<img class="" style="max-width: 100%; height: auto;" src = '<c:url value="/resources/image/${detail.getFile_name() }"/>' alt=""><br/><br/>
                    				<div style="float:right"><input type="button" class="btn btn-primary" onclick="de();" value="삭제"></div><br/></br>
                    				</div>
                					</div>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					</tbody>
				</table>
				<!-- 첨부파일 수정하지 않았을 때 원래 있던 파일명을 넘겨준다 -->
				<input type="hidden" id="origin" name="origin" value="${detail.getFile_name() }">
				<input type="hidden" id="mem_id" name="mem_id" value="${member.mem_id }">
				<!-- 앱에서 사진찍거나 갤러리에서 가져온 사진 데이터(base64) 받는 hidden -->
				<input type="hidden" id="imageData" name="imageData" value=""> 
			</div>
			<div style="float:right">
	<button type="submit"class="btn btn-primary">저장</button>
	&nbsp;&nbsp;&nbsp;<button type="button"class="btn btn-primary" onclick="history.go(-1)">취소</button>
	</div></form>
	</div>
			<script>
				//이미지 선택했을 떄 바로 밑에 선택한 이미지 보이게 하는 스크립ㅌ ㅡ
  				$("#filen").change(function(){
   				if(this.files && this.files[0]) {
    				var reader = new FileReader;
    				reader.onload = function(data) {
     					$(".select_img img").attr("src", data.target.result);        
    					}
    				reader.readAsDataURL(this.files[0]);
   					}
   				
  				});
				
				//브라우저 체크
  				var agent = navigator.userAgent.toLowerCase();
  				if (agent.indexOf("mobile") != -1) {
  					var s = document.createElement("script");
  					s.type = "text/javascript";
  					s.src = '<c:url value="/resources/js/cordova.js"/>';
  					$("head").append(s);
  				}
 			</script>
 			<script>
				$(".custom-file-input").on("change", function() {
  					var fileName = $(this).val().split("\\").pop();
  					$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  					
				});
			</script>
			<script>
				//앱 수정할떄 이미지 삭제
				function d(){
					$(".select_img img").attr("src", "");
					document.getElementById("imageData").value="";
					document.getElementById("origin").value="";
				}
				//웹 수정할떄 이미지 삭제
				function de(){
					$(".select_img img").attr("src", "");
					$(".custom-file-input").siblings(".custom-file-label").addClass("selected").html("");
					document.getElementById("origin").value="";
				}
			</script>
	
</div><br/><br/><br/>
<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
         <script src='<c:url value="/resources/js/cordova_camera.js"/>'></script>
    </body>
</html>
