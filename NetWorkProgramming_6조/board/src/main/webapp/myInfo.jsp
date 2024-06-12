<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO, user.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
<div class="container">
	<div class="header">
	 	<div class="header__icons">
		     <form class="logo_form" method="post" action="bbs.jsp">
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
	<div class = "Data_Input">
	    <h1>내 정보</h1>
	    <%
	    UserDAO userDao = new UserDAO();
	    
		String userID = null;
		userID=(String)session.getAttribute("ID");
		
	    if (userID == null) {
	        out.println("<p>로그인이 필요합니다.</p>");
	    } else {
	        User user = userDao.getMyInfo(userID);
	        if (user != null) {
	    %>    
	    		<input type="text" class="ID_Data"  placeholder="ID:  <%= user.getID() %>" disabled>
	        	<input type="text" class="Name_Data"  placeholder="이름:  <%= user.getName() %>" disabled>
	        	<input type="text" class="Age_Data"  placeholder="나이:  <%= user.getAge() %>" disabled>
	        	<input type="text" class="Gender_Data"  placeholder="성별:  <%= user.getGender() %>" disabled>
	        	<textarea class="Introduction_Data" maxlength="200" disabled> 소개글: <%= user.getIntroduction() %></textarea>
	    <%    } else {
	            out.println("<p> 사용자 정보를 조회할 수 없습니다. </p>");
	        }
	    }
	    %>
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

	*{
		margin: 0;
		padding: 0 0 0 0;
		background-color: #F3F3F3;
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
	
    .header	{
    
        position: absolute;
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
	
	
	
		
	.container {
		background-color: #F3F3F3;
		z-index: -1;
		width: 1440px;
		height: 1024px;
		margin: auto;
	}
	
	.Data_Input {
		background-color: white;
		border-radius: 50px;		
		width: 500px;
		height: 750px;
		margin: 0 auto;
	    text-align: center;
		position: relative;
	    top: 180px;
	}		
	
	h1{
		position:  relative;
		top: 65px;
		background-color: white;
		color:  #539A74;
		font-size: 45px;
	    text-align: center;
    	font-family: "Pretendard Variable";
		border-radius: 50px;		
	}
	
	.ID_Data{
		border-radius: 15px;
		width: 350px;
		height: 30px;		
		outline: none;
		border: 2px solid #539A74;
		background-color: white;
    	font-family: "Pretendard Variable";
		margin-top: 110px;
		padding: 10px 0px 0px 0px;
	}	
 	
	.ID_Data::placeholder{
		width: 100%;
		height: 100%;
		font-size: 24px;
		color: #539A74;
		background: white;
		text-align: center;
    	font-family: "Pretendard Variable";
	}
	
	.Name_Data{
		border-radius: 15px;
		width: 350px;
		height: 30px;		
		outline: none;
		border: 2px solid #539A74;
		background-color: white;
    	font-family: "Pretendard Variable";
		margin-top: 40px;
		padding: 10px 0px 0px 0px;
	}	
	
	.Name_Data::placeholder{
		width: 100%;
		height: 100%;
		font-size: 24px;
		color: #539A74;
		background: white;
		text-align: center;
    	font-family: "Pretendard Variable";
	}
	
	.Age_Data{
		border-radius: 15px;
		width: 350px;
		height: 30px;		
		outline: none;
		border: 2px solid #539A74;
		background-color: white;
    	font-family: "Pretendard Variable";
		margin-top: 40px;
		padding: 10px 0px 0px 0px;
	}	
	
	.Age_Data::placeholder{
		width: 100%;
		height: 100%;
		font-size: 24px;
		color: #539A74;
		background: white;
		text-align: center;
    	font-family: "Pretendard Variable";
	}
	
	.Gender_Data{
		border-radius: 15px;
		width: 350px;
		height: 30px;		
		outline: none;
		border: 2px solid #539A74;
		background-color: white;
    	font-family: "Pretendard Variable";
		margin-top: 40px;
		padding: 10px 0px 0px 0px;
	}	
	
	.Gender_Data::placeholder{
		width: 100%;
		height: 100%;
		font-size: 24px;
		color: #539A74;
		background: white;
		text-align: center;
    	font-family: "Pretendard Variable";
	}
	
	.Introduction_Data{
      border-radius: 15px;
        width: 350px; 
        height: 180px; 
		outline: none;
		border: 2px solid #539A74;
        background-color: white;
        font-family: "Pretendard Variable", sans-serif;
        margin-top: 40px; 
        padding: 15px 10px 10px 10px;
        word-wrap: break-word;
        box-sizing: border-box; 
		font-size: 24px;
		color: #539A74;
		resize: none;
	}	

	
	

</style>
</html>
