<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>서버에서 받은 값</h2>
	<h3>이름:${param.name01}</h3> 
	<!-- html 주석 아래 jsp 코드의 경우 실행이 된다.
	     1개의 key을 1개의 value를 받은 경우-->
	<%-- java코드에서(jsp) 주석처리..
	<h3>넘겨온 취미의 갯수: ${paramValues.hobby.length}</h3>
	 --%>

	<h3>취미1:${paramValues.hobby[0]}</h3>
	<h3>취미2:${paramValues.hobby[1]}</h3>
	<h3>취미3:${paramValues.hobby[2]}</h3>
	<h3>취미4:${paramValues.hobby[3]}</h3>
</body>
</html>