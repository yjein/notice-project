<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>메인 화면</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
		.hi{
			text-align: right;
		} 
	</style>
	
</head>

<body>

	<div class="container">
	
	<%
		String username = (String)request.getAttribute("username");
		String result = (String)request.getAttribute("result");
	%>
	
		<h1>
		<c:out value="${result}"></c:out>
		</h1>
		
		<c:choose>
			<c:when test="${result eq '로그인 성공'}">
				<div class="alert alert-success">
	    			<strong>Login Success!</strong>
	  			</div>
				<h2 class="hi"><%=username %>님 반갑습니다.</h2>
			</c:when>
			<c:otherwise>		
				<h2>아이디 또는 패스워드가 틀렸습니다.</h2>
				<h3>로그인 실패 ID: ${username}</h3>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>