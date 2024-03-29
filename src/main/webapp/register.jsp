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
	<div class="wrap wrap_write">
		<div class="container">
			<h1>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 2 16 15" style="color: #48a9c5">
  					<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
 					<path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
				</svg>&nbsp;
				<span>고객 등록</span>
			</h1>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-9">
					<form name="frm" method="post" action="insert" enctype="multipart/form-data"> 
						<div class="mb-3 row">
							<label for="inputName" class="col-sm-2 col-form-label frm_required">이름</label>
                            <div class="col-sm-5">
								<input type="text" class="form-control" id="inputName" name="name" maxlength="13" placeholder="필수 입력" />
                            </div>
                           	<div class="col-sm-1"></div>
                            <label for="inputAge" class="col-sm-1 col-form-label">나이</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="inputAge" name="age" maxlength="3"/>
                            </div>
                       	</div>
                        <div class="mb-3 row">
							<label for="inputPhone" class="col-sm-2 col-form-label frm_required">휴대폰</label>
							<div class="col-sm-5">
                            	<input type="tel" class="form-control" name="phone" maxlength="15" id="inputPhone" placeholder="필수 입력" />
                            </div>
                            <div class="col-sm-1"></div>
                            <label for="inputAge" class="col-sm-1 col-form-label">성별</label>
                            <div class="col-sm-3" style="display: flex;">
                            	<div class="form-check" style="padding-right: 1rem;">
                         			<input class="form-check-input" type="radio" name="gender" id="check_gender1" value="남" />
                                	<label class="form-check-label" for="check_gender1">남</label>
                                </div>
								<div class="form-check">
                         			<input class="form-check-input" type="radio" name="gender" id="check_gender2" value="여" />
                                	<label class="form-check-label" for="check_gender2">여</label>
                         		</div>
                            </div>
                        </div>
                        <div class="mb-3 row">
							<label for="inputAddress" class="col-sm-2 col-form-label frm_required">주소</label>
							<div class="col-sm-10">
                            	<input type="text" class="form-control" name="address" maxlength="50" id="inputAddress" placeholder="필수 입력" />
                            </div>
                        </div> 
                        <div class="mb-3 row">
                        	<label for="inputGrade" class="col-sm-2 col-form-label frm_required">등급</label>
                            <div class="col-sm-5">
                            	<select class="form-select" name="grade" aria-label="grade" id="inputGrade">
                            	    <option value=null selected>선택</option>
                                    <option value="일반">일반</option>
                                    <option value="silver">silver</option>
                                    <option value="gold">gold</option>
                                    <option value="vip">vip</option>
                                 </select>
                            </div>
                            <div class="col-sm-1"></div>
                            <label for="inputPoint" class="col-sm-1 col-form-label frm_required">포인트</label>
							<div class="col-sm-3">
                            	 <input type="text" class="form-control" name="point" maxlength="10" id="inputPoint" placeholder="필수 입력" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                        	<label for="inputFile" class="col-sm-2 col-form-label">이미지 업로드</label>
							<div class="col-sm-10">                        	
	                        	<input type="file" name="file" id="inputFile" />
                            </div>
                        </div>
            		</form>
            	</div>
            	<div class="col-md-1"></div>
           	</div>
           	<div class="bt_wrap">
				<a onclick="chkForm(); return false;" class="on">등록</a>
				<a class="bt cancle" href="index">취소</a>
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