<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>login</title>
</head>
<header>

</header>
<body>
	<div class = "container">
			<div class = "Data_Input">
				<p class = "Signup_text"> <a href="./signup_1.jsp"> SIGN-UP </a> </p>
				<form>
					<select id="age">
						<option id="age_option" selected>나이</option>
				        <option id="age_option"> 20
				        <option id="age_option"> 21
				        <option id="age_option"> 22
				        <option id="age_option"> 23
				        <option id="age_option"> 24
					</select>
					<select id="gender">
						<option id="gender_option" selected>남</option>
				        <option id="gender_option"> 여
					</select>
					<input type="text" id="introduction" placeholder="소개글">
					<input type="submit" id="Signup_button" value="회원가입">
				</form>
			</div>
	</div>
</body>

<!-- test -->

<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");					
	
	a{
	 text-decoration-line: none;
	 color: inherit;
	}

	*{
		margin: 0;
		padding: 0 0 0 0;
	}
	

	.container {
		background-color: #F5F5F5;
		width: 1440px;
		height: 1024px;
		margin: auto;
	}																			
	
	.Data_Input {
	background-color: white;
	border-radius: 50px;		
	width: 500px;
	height: 750px;
	margin: auto;
	position: relative;
    top: 137px;
	}										
	
	.Signup_text {
	font-size: 40px;
	color: #539A74;
	text-align: center;
	position: relative;
    top: 150px;
    font-weight: bold;
    font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
	}										
	
	
	#age{
	vertical-align: bottom;
	width: 145px;
	height: 40px;
	border-radius: 50px;		
	outline: 1px;
	border-color: #539A74;
	margin: auto;
	position: relative;
    top: 210px;
    margin-left: 90px;
    padding: 0 0 0 10px;
    color: #539A74;
    font-size: 30px;
	font-family: "Pretendard Variable";
	}
	
	#age_option{
	font-size: 30px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}
	
	#gender{
	vertical-align: bottom;
	width: 145px;
	height: 40px;
	border-radius: 50px;		
	outline: 1px;
	border-color: #539A74;
	margin: auto;
	position: relative;
    top: 210px;
    margin-left: 30px;
    padding: 0 0 0 10px;
    color: #539A74;
    font-size: 30px;
	font-family: "Pretendard Variable";
	}
	
	#gender_option{
	font-size: 30px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}
	
	#introduction {
	width: 320px;
	height: 180px;
	border-radius: 15px;		
	border-width: 2px;
	border-color: #539A74;
	position: relative;
    top: 250px;
    margin-left: 85px;
    padding: 0 0 0 10px;
    font-size: 30px;
	font-family: "Pretendard Variable";
	
	}
	
	#introduction::placeholder{
	width: 100%;
	height: 100%;
	vertical-align : top;
	font-size: 24px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}
    
    #Signup_button{
    width: 350px;
    height: 55px;
    position: relative;
    top: 300px;
    background-color: #539A74;
    color: white;
    border: none;
    font-size: 24px;
    border-radius: 15px;
    margin-left: 75px;
    }


</style>
</html>