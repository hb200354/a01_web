<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <body>
        <h2>등록된 자소서 내용</h2>
        <h3>이름:${param.name}</h3>
        <h3>암호:${param.pwd}</h3>
        <h3>자소서 내용</h3>
        <textarea cols="29" rows="5">${param.content}</textarea>
    </body>
</html>