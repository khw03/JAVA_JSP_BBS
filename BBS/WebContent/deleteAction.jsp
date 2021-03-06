<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   

<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>

<% request.setCharacterEncoding("UTF-8"); %>

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
	
	//
	String userID = null;
	if (session.getAttribute("userID") != null)
	{
		userID = (String)session.getAttribute("userID");
	}
	
	if (userID == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} 
	
	//
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	// 번호가 반드시 존재해야지 특정한 글을 볼수 있다
	if (bbsID == 0) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
		
	}
	
	// 작성자가 작성자 본인인지 확인
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
		
	}
	else {
		
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
				
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}	

     }

		
		
%>
</body>
</html>