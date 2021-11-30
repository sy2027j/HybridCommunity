<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./header.jsp"  %>
<!DOCTYPE html>
<html lang="en">
    
<header class="masthead text-center">

<div class="container">
	<div style="float: center;">
			<div class="card" style="width:20rem; border-radius:20px; position:absolute; left:50%; top:50%; transform:translate(-50%,-50%);">
			
			<div class="card-title" style="margin-top:30px;">
				<h2 class="card-title text-center" style="color:#113366;">로그인</h2>
			</div>
		
			<div class="card-body">
      			<form method="POST" id="Login" action="gologin">
        			<input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="ID" required autofocus autocomplete="off"><BR>
        			<input type="password" id="mem_pw" name="mem_pw" class="form-control" placeholder="Password" required><br>
        			<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button><br/><br/>
     	 		</form>
			</div>
		
	</div>
	</div>
</div>

        </header>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
