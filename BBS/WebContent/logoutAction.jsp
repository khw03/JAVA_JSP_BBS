<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<% 
		session.invalidate();
		
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>