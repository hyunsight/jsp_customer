<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
	<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
         crossorigin="anonymous"
    />

<!-- CSS -->
	<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<div class="wrap">
		<div class="container">
			<h1>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-people-fill" viewBox="0 2 16 15" style="color: #48a9c5">
  					<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
				</svg>&nbsp;
				<span>고객 관리</span>
			</h1>
			<br />

			<!-- 테이블 -->
			<table class="row customer_list">
				<thead>
					<tr class="row">
						<th class="col-1">ID</th>
						<th class="col-2">이름</th>
						<th class="col-3">휴대폰</th>
						<th class="col-2">포인트</th>
						<th class="col-2">등급</th>
						<th class="col-2">관리</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach var="customer" items="${customerList}">
						<tr class="row">
							<td class="col-1">${customer.id}</td>
							<td class="col-2 list__name"><a href="./view?id=${customer.id}">${customer.name}</a></td>
							<td class="col-3">${customer.phone}</td>
							<td class="col-2">${customer.point}</td>
							<td class="col-2">${customer.grade}</td>
							<td class="col-2 list__management">
								<a href="./edit?id=${customer.id}" >
									<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
 										<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
										<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
									</svg>
								</a>
								<a onclick="chkDelete(${customer.id}); return false;">
									<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  										<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/>
									</svg>
								</a>
							</td>	
						</tr>
					</c:forEach>	
				</tbody>
			</table>

			<!-- 버튼 -->			
			<div class="bt_page">
				<a href="#" class="bt first">&lt;&lt;</a>
				<a href="#" class="bt prev">&lt;</a>
				<a href="#" class="num on">1</a>
				<a href="#" class="num">2</a>
				<a href="#" class="num">3</a>
				<a href="#" class="num">4</a>
				<a href="#" class="num">5</a>
				<a href="#" class="bt next">&gt;</a>
				<a href="#" class="bt last">&gt;&gt;</a>
			</div>
			
			<div class="bt_wrap">
				<a href="register">등록하기</a>
			</div>
		</div>
	</div>
	
<!-- 부트스트랩 -->	
	<script
       src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
       crossorigin="anonymous">
	</script>
	
		
<!-- 자바스크립트 -->	
	<script type="text/javascript" src="./js/script.js"></script>	
</body>
</html>