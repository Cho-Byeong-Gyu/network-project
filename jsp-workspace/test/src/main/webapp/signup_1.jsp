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
					<input type="text" id="ID_Input" placeholder="ID">
	            	<input type="password" id="PW_Input" placeholder="PW">
	            	<input type="text" id="name_Input" placeholder="이름">
	            	<input type="button" id="next_button" value="다음"  onClick="location.href='./signup_2.jsp'">
				</form>
			</div>
	</div>
</body>

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
	
	#ID_Input {
	vertical-align: bottom;
	width: 320px;
	height: 40px;
	border-radius: 50px;		
	outline: 1px;
	border-color: #539A74;
	margin: auto;
	position: relative;
    top: 210px;
    margin-left: 85px;
    padding: 0 0 0 10px;
    font-size: 30px;
	font-family: "Pretendard Variable";
	}
	
	#ID_Input::placeholder{
	width: 100%;
	height: 100%;
	font-size: 24px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}

	#PW_Input {
	width: 320px;
	height: 40px;
	border-radius: 50px;		
	outline: 1px;
	border-color: #539A74;
	margin: auto;
	position: relative;
    top: 253px;
    margin-left: 85px;
    padding: 0 0 0 10px;
    font-size: 30px;
	font-family: "Pretendard Variable";
	}
	
	#PW_Input::placeholder{
	width: 100%;
	height: 100%;
	font-size: 24px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}
	
	#name_Input {
	width: 320px;
	height: 40px;
	border-radius: 50px;		
	outline: 1px;
	border-color: #539A74;
	margin: auto;
	position: relative;
    top: 296px;
    margin-left: 85px;
    padding: 0 0 0 10px;
    font-size: 30px;
	font-family: "Pretendard Variable";
	}
	
	#name_Input::placeholder{
	width: 100%;
	height: 100%;
	font-size: 24px;
	color: #539A74;
	text-align: left;
	padding: 10px;
	}
	
    
    #next_button{
    width: 350px;
    height: 55px;
    position: relative;
    top: 395px;
    background-color: #539A74;
    color: white;
    border: none;
    font-size: 24px;
    border-radius: 15px;
    margin-left: 75px;
    }


</style>
</html>