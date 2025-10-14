<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주문한 음식은: ${param.menu}</h2>
    <h2>받고싶은 물건은: ${param.choice}</h2>
    <p>
    토핑1: ${paramValues.toppings[0]}
    토핑2: ${paramValues.toppings[1]}
    토핑3: ${paramValues.toppings[2]}
    토핑4: ${paramValues.toppings[3]}
    토핑5: ${paramValues.toppings[4]}
    </p>
    <h2>선택된 메뉴는: ${param.menu}</h2>

    <p> 
        전달한 채널번호:${param.ch}, 전달한 볼륨크기: ${param.val}
    </p>
</body>
</html>