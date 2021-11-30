<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"  %>
<!DOCTYPE html>
<c:if test="${ member == null }">
   <script type="text/javascript">
  			alert("로그인 하세요.");
  			window.location = '/ex/login';
		</script>
   </c:if>
<html lang="en">
<div class="container">
<form role="form" id="writeForm" name="writeForm" method="post" action="writeform" enctype="multipart/form-data">
	<div id="layoutSidenav_content">
				<h2 class="mt-5" align="center">게시글 작성</h2><br>
			<div class="memberManager">
				<table class="table" id="list" style="table-layout: fixed;">
					
					<tbody>
					<tr>
					<td style="width: 30%;">제목</td>
					<td><input type="Text"style="width: 100%;" id="title" name="title" autocomplete="off"></td>
					</tr>
					<tr>
					<td style="width: 30%;">내용</td>
					<td><textarea name = content cols=85 rows=7 style="width: 100%;" id="content" name="content"></textarea></td>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${mobile ne null }">
								<td style="width: 30%;">첨부파일</td>
								<td><input type="button" class="btn btn-primary" onclick="cameraf()" value="사진찍기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary" onclick="camerag()" value="가져오기"><br/>
									<div class="select_img"><img id="coimg" src="" style="max-width: 100%; height: auto;"/></div>
								</td>
							</c:when>
							<c:otherwise>
								<td style="width: 30%;">첨부파일</td>
								<td>
									<div class="select_img">
									<div class="custom-file" id="inputFile">
                    				<input name="filen" type="file" class="custom-file-input" id="filen">
                    				<label class="custom-file-label" for="customFile"></label><br/><br/>
                    				<img class="" style="max-width: 100%; height: auto;" src = "" alt=""><br/><br/>
                    				<div style="float:right"><input type="button" class="btn btn-primary" onclick="de();" value="삭제"></div><br/></br>
                    				</div>
                					</div>
								</td>
							</c:otherwise>
						</c:choose>

					</tr>
					</tbody>

				</table>
				<input type="hidden" id="mem_id" name="mem_id" value="${member.mem_id }">
				<input type="hidden" id="imageData" name="imageData" value="">
				<input type="text" id="imageDatsa" name="imageDatsa" value="">
			</div>
	</div>
			<script>
  				$("#filen").change(function(){
   				if(this.files && this.files[0]) {
    				var reader = new FileReader;
    				reader.onload = function(data) {
     					$(".select_img img").attr("src", data.target.result);        
    					}
    				reader.readAsDataURL(this.files[0]);
    				document.getElementById("").value=imageData;
    				//$("#imageData").val("인증완료!");
   					}
  				});
  				
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
 				document.getElementById("imageDatsa").value="12";
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
	<div style="float:right">
	<button type="submit"class="btn btn-primary">등록</button>
	&nbsp;&nbsp;&nbsp;<button type="button"class="btn btn-primary" onclick="location.href='index'">취소</button>
	</div></form>
</div><br/><br/><br/>

      <script src='<c:url value="/resources/js/cordova_camera.js"/>'></script>
      <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>