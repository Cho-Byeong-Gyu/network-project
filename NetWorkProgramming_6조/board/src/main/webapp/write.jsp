<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판 글 추가하기</title>
</head>
<body>
	<div class="container">
		<div class="header">
		 	<div class="header__icons">
		     <form method="post" action="bbs.jsp">
                  <button><img src="./logo.svg" /></button>
	   		 </form>
	       	 <selection class = "header_menu">
			    <form class="bbs_form" method="post" action="bbs.jsp">
	                 <button class="header_button">팀원 모집 공고</button>
		   	    </form>
	                 <span><img src="./line.svg"> </span>
			    <form class="calendar_form" method="post" action="calendar.jsp">
	                 <button class="header_button">캘린더</button>
		   	    </form>
	                 <span><img src="./line.svg"></span>
			    <form class="myInfo_form" method="post" action="myInfo.jsp">
	                 <button class="header_button">내 정보</button>
		   	    </form>
		   	    	<span><img src="./line.svg"> </span>
		   	    <form class="logout_form" method="post" action="logoutAction.jsp">
	                 <button class="header_button">로그아웃</button>
		   	    </form>
	      	  </selection>
	        </div>
	   </div>
	   
	   <div class="article">
    		<form class="board_form" method="post" action="writeAction.jsp">
				<section class="board_header">
					<input type="button" class="back_btn" value=" < " onClick="location.href='./bbs.jsp'">
					<input type="text" class= "form-control" placeholder="글 제목" name= "bbsTitle" maxlength= "50">	
				    <input type= "submit" class= "write_btn" value= "작성완료"> 
			    </section>
			    <section class="board_body">
					<textarea class= "form-control_2" placeholder="내용을 입력해주세요.." name= "bbsContent" maxlength= "2048"></textarea>
			    </section>
    		</form>
		</div>
	</div>

</body>



<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");					
	
	html, body {
	    margin: 0;
	    padding: 0;
        height: 100%;
   		width: 100%; 
	}
	
	a{
		 text-decoration-line: none;
		 color: inherit;
		 background-color: white;
	}

	*{
		margin: 0;
		padding: 0 0 0 0;
		background-color: #F3F3F3;
	}

    .header	{
        display: flex;
        padding: 0px 180px;
        box-sizing: border-box;
        background: #FFFFFF;
        border: 3px solid  #F3F3F3;
        border-radius: 10px;		
        width: 1440px;
	    height: 100px;
	    margin: 0 auto;
    }	
    
    .header_button{
        display: flex;
        font-family: Pretendard;
        font-size: 24px;
        font-weight: 500;
        line-height: 28.64px;
        text-align: left;
    }
    .header__icons{
        display: flex;
        background: white;
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }
    .header_menu{
        display:flex;
        align-items: center;
        background: white;
        gap: 10px;
        color: #4B8D6A;	
    }

	.logo_form {
		display:flex;
	  	background: none;
		width: 480px;
		gap: 16px;
  	}

	.bbs_form {
		display:flex;
	  	background: none;
		width: 165px;
	}

	.calendar_form {
		display:flex;
	  	background: none;
		width: 72px;
	}

	.myInfo_form {
		display:flex;
	  	background: none;
		width: 90px;
	}
	
    button {
        background: white;
        color: inherit;
        border: none;
        padding: 0;
        font: inherit;
        cursor: pointer;
        outline: inherit;
    }	
    
    img {
        background: white;
    }

 	
 	input:focus {
 		outline: none;
 	}
 	
	
	
	.container {
		background-color: #F3F3F3;
		z-index: -1;
		width: 1440px;
		height: 1024px;
		margin: auto;
	}
	
    .article {
        position: relative;
        width: 1080px;
        height: 828px;
        border-radius: 15px;
        background: white;
   		margin: 0 auto;
   		vertical-align: middle;
   		top: 18px;
    }
    
    .board_header {
  	    display: flex;
        position: relative;
    	width: 1080px;
    	height: 130px;
 	  	text-align: center; 
	    align-items: center;   	    
    	margin: 0 auto;
 	  	border: none;
 	  	background: white;
 	  	border-radius: 15px;
 	  	margin-top: 30px;
    }
    
    .board_body {
       	margin: 0 auto;
    	width: 1080px;
    	height: 708px;
 	  	text-align: center; 
 	  	border: none;
 	  	background: white;
 	  	border-radius: 15px;
 	  	margin: 0 auto;
 	  	margin-top: 20px;
 	}
 	
 	.board_form{
      	margin: 0 auto;
        position: relative;
    	width: 1080px;
    	height: 120px;
 	    align-items: center;
 	    flex-direction: column;
 	}  

    
    .back_btn {
    	background: none;   		
    	display: flex;
  		color: #1C3427;
    	font-size: 35px;
    	border: none;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    	margin: 0 15px 0 30px;
    }
    
    
    
    .form-control {
    	background: white;   		
    	display: flex;
    	border: none;
    	font-size: 35px;
    	width: 770px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
  		color: #1C3427;
    }

	.form-control:focus {
		outline: none;
	}
	
    .write_btn {
    	background: #539A74;	
    	height: 44px;
    	width: 120px;
    	border: none;
    	font-size: 24px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
		color: white;
	    text-align: center;
	    margin: 0 auto;
	    vertical-align: middle;
	    border-radius: 10px;
    }
    
    .form-control_2 {
    	background: white;   		
    	outline: 1px #539A74;
    	border-width: 1.7px;
    	font-size: 24px;
    	width: 900px;
    	height: 640px;
    	border-radius: 30px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
  		color: #1C3427;
  		margin: 0 auto;
		resize: none;
    }
	
	textarea { 
    	padding: 12px 18px 12px 18px; 
    }
    
    input:-webkit-autofill {
    	-webkit-box-shadow: 0 0 0 500px none inset !important;
  }
    
</style>
