<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login page</title>
</head>

<body>
<%
	String myid = "user";
	String mypw = "userpw";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(myid.equals(id) && mypw.equals(pw)){
%>		
		<h2>�α��� ����</h2>
<% 
	}else{
%>
		<h2>�α��� ����</h2>
<% 
	}
%>

</body>
</html>