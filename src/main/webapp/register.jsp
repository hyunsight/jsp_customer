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
			<h1>고객 등록</h1>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form name="frm" method="post" action="insert" enctype="multipart/form-data"> 
						<div class="mb-3 row">
							<label for="inputName" class="col-sm-2 col-form-label">이름</label>
                            <div class="col-sm-5">
								<input type="text" class="form-control" id="inputName" name="name" maxlength="15" placeholder="필수 입력" />
                            </div>
                            <label for="inputAge" class="col-sm-2 col-form-label">나이</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="inputAge" name="age" maxlength="5"/>
                            </div>
                       	</div>
                        <div class="mb-3 row">
							<label for="inputPhone" class="col-sm-2 col-form-label">휴대폰</label>
							<div class="col-sm-5">
                            	<input type="tel" class="form-control" name="phone" maxlength="15" id="inputPhone" placeholder="필수 입력" />
                            </div>
                            <label for="inputAge" class="col-sm-2 col-form-label">성별</label>
                            <div class="col-sm-3" style="display: flex;">
                            	<div class="form-check" style="padding-right: 1rem;">
                         			<input class="form-check-input" type="radio" name="gender" id="check_gender1" />
                                	<label class="form-check-label" for="check_gender1">남</label>
                                </div>
								<div class="form-check">
                         			<input class="form-check-input" type="radio" name="gender" id="check_gender2" />
                                	<label class="form-check-label" for="check_gender2">여</label>
                         		</div>
                            </div>
                        </div>
                        <div class="mb-3 row">
							<label for="inputAddress" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
                            	<input type="text" class="form-control" name="address" maxlength="50" id="inputAddress" placeholder="필수 입력" />
                            </div>
                        </div> 
                        <div class="mb-3 row">
                        	<label for="inputGrade" class="col-sm-2 col-form-label">등급</label>
                            <div class="col-sm-5">
                            	<select class="form-select" name="grade" aria-label="Default select example" id="inputGrade">
                                    <option value="일반" selected>일반</option>
                                    <option value="silver">silver</option>
                                    <option value="gold">gold</option>
                                    <option value="vip">vip</option>
                                 </select>
                            </div>
                            <label for="inputPoint" class="col-sm-2 col-form-label">포인트</label>
							<div class="col-sm-3">
                            	 <input type="text" class="form-control" name="point" maxlength="50" id="inputPoint" placeholder="필수 입력" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                        	<label for="inputFile'">이미지 업로드</label>
                        	<input type="file" name="file" id="inputFile" />
                        </div>
            		</form>
            	</div>
            	<div class="col-md-2"></div>
           	</div>
           	<div class="bt_wrap">
				<a onclick="chkForm(); return false;" class="on">등록</a>
				<a href="index">취소</a>
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