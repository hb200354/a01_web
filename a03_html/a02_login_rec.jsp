<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	a02_login_rec.jsp?id=himan&pwd=7777
	 -->
	<h2>서버에서 받은 id와 pwd</h2>
	<h3>id:${param.id}</h3>  <!-- 자바코드로 보다간편하게 받는 코드 -->
	<h3>pwd:${param.pwd}</h3>
	

</body>
</html>