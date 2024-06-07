<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입 테스트</title>
</head>
<header>

</header>
<body>
	<div class = "container">
		<div class = "Data_Input">
			<p class = "Signup_text"> <a href="./signup.jsp"> SIGN-UP </a> </p>
			<form action="signupAction.jsp" method="post">
				<input type="text" id="ID_Input" name="ID_Input" placeholder="ID" maxlength="20">
            	<input type="password" id="PW_Input" name="PW_Input" placeholder="PW" maxlength="20">
            	<input type="text" id="name_Input" name="name_Input" placeholder="이름" maxlength="20">
				<select id="age" name="age">
					<option id="age_option" selected>나이</option>
			        <option id="age_option"> 19
			        <option id="age_option"> 20
			        <option id="age_option"> 21
			        <option id="age_option"> 22
			        <option id="age_option"> 23
			        <option id="age_option"> 24
			        <option id="age_option"> 25
			        <option id="age_option"> 26
			        <option id="age_option"> 27
			        <option id="age_option"> 28
			        <option id="age_option"> 29
			        <option id="age_option"> 30
				</select>
				<select id="gender" name="gender">
					<option id="gender_option" selected>남</option>
			        <option id="gender_option"> 여
				</select>
				<textarea id="introduction" name="introduction" maxlength="200" placeholder="소개글" ></textarea>
				<input type="submit" id="Signup_button" value="회원가입">
			</form>
		</div>
	</div>
</body>


<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");					
	
	a{
	 text-decoration-line: none;
	 color: inherit;
	 background-color: white;
	}
	
	form {
		background-color: white;
	}

	*{
		margin: 0;
		padding: 0 0 0 0;
		background-color: #F3F3F3;
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
	    top: 45px;
   		background-color: white;
	    font-weight: bold;
	    font-family: "Pretendard Variable";
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
	    top: 100px;
	    margin-left: 85px;
	    padding: 0 0 0 10px;
	    font-size: 30px;
		font-family: "Pretendard Variable";
		background-color: white;
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
	    top: 135px;
	    margin-left: 85px;
	    padding: 0 0 0 10px;
	    font-size: 30px;
		font-family: "Pretendard Variable";
				background-color: white;
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
	    top: 170px;
	    margin-left: 85px;
	    padding: 0 0 0 10px;
	    font-size: 30px;
		font-family: "Pretendard Variable";
		background-color: white;
	}
	
	#name_Input::placeholder{
		width: 100%;
		height: 100%;
		font-size: 24px;
		color: #539A74;
		text-align: left;
		padding: 10px;
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
	    top: 195px;
	    margin-left: 90px;
	    padding: 0 0 0 10px;
	    color: #539A74;
	    font-size: 30px;
		font-family: "Pretendard Variable";
		background-color: white;
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
	    top: 195px;
	    margin-left: 30px;
	    padding: 0 0 0 10px;
	    color: #539A74;
	    font-size: 30px;
		font-family: "Pretendard Variable";
		background-color: white;
	}
	
	#gender_option{
		font-size: 30px;
		color: #539A74;
		text-align: left;
		padding: 10px;
	}
	
	#introduction {
	    position: relative;
   		top: 220px;
   		margin-left: 85px;
      	border-radius: 15px;
	    width: 280px;
	 	height: 140px;
		outline: none;
		border: 2px solid #539A74;
        background-color: white;
        font-family: "Pretendard Variable";
        word-wrap: break-word;
   		vertical-align : top;
		font-size: 24px;
		color: #539A74;
		padding: 20px;
		resize: none;
	}
	
	#introduction::placeholder{
		width: 100%;
		height: 100%;
		vertical-align : top;
		font-size: 24px;
		color: #539A74;
		text-align: left;
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
    
    #Signup_button{
	    width: 350px;
	    height: 55px;
	    position: relative;
	    top: 250px;
	    background-color: #539A74;
	    color: white;
	    border: none;
	    font-size: 24px;
	    border-radius: 15px;
	    margin-left: 75px;
    }

</style>
</html>
