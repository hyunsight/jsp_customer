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
	<div class="wrap wrap_view">
		<div class="container">
			<h1>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill" viewBox="0 2 16 15" style="color: #48a9c5">
  					<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
				</svg>&nbsp;
				<span>고객 정보</span>
			</h1>
			<div class="card mb-3">
  				<div class="row g-5">
   					<div class="col-md-3">
    					<img src="./Temp${customer.img}" class="img-fluid h-100 rounded-start" width="250" height="250" alt="이미지">
   					</div>
    				<div class="col-md-9">
     					 <div class="card-body">
     	  					<div class="info" style="position: relative;">
     	  						<div class="row info_details1">
			    					<div class="col-2">     	  					
										<dl>
											<dt>이름</dt>
										</dl>
								    </div>
			    					<div class="col-4">     	  					
										<dl>
											<dd>${customer.name}</dd>
										</dl>
								    </div>								    
			    					<div class="col-2">     	  					
										<dl>
											<dt>나이</dt>
										</dl>									    
								    </div>
			    					<div class="col-4">     	  					
										<dl>
											<dd>${customer.age}</dd>
										</dl>
								    </div>									    								    
  								</div>
     	  						<div class="row info_details1">
			    					<div class="col-2">    	
										<dl>
											<dt>휴대폰</dt>
										</dl>				    					
								    </div>
			    					<div class="col-4">    	
										<dl>
											<dd>${customer.phone}</dd>
										</dl>				    					
								    </div>	
			    					<div class="col-2">     	  					
										<dl>
											<dt>성별</dt>
										</dl>									    
								    </div>
			    					<div class="col-4">     	  					
										<dl>
											<dd>${customer.gender}</dd>
										</dl>									    
								    </div>								    				    							    
  								</div>			    												
     	  						<div class="row info_details1">
 			    					<div class="col-2">     	  					
										<dl>
											<dt>주소</dt>
										</dl>									    
								    </div>
								    <div class="col-10">     	  					
										<dl>								    
											<dd>${customer.address}</dd>	
										</dl>								    
								    </div>		
  								</div>	
							</div>
					     </div>
    				</div>
  				</div>
			</div>
  			<div class="row text-center info_details2">
			    <div class="col">
      				<dl>
						<dt>포인트</dt>
						<dd>${customer.point}</dd>
					</dl>
    			</div>
    			<div class="col">
     				<dl>
						<dt>등급</dt>
						<dd>${customer.grade}</dd>
					</dl>
    			</div>
    			<div class="col">
    				<dl>
						<dt>가입일</dt>
						<dd>${customer.reg_date}</dd>
					</dl>
    			</div>
  			</div>
			<div class="bt_wrap">
				<a href="index" class="on">목록</a>
				<a href="edit?id=${customer.id}">수정</a>
				<a class="bt delete" onclick="chkDelete(${customer.id}); return false;">삭제</a>
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