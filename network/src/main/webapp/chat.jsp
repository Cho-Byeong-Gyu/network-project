<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
</head>
<body>
    <div class="container">
        <section class = "header">       	
            <div class="header__icons">
                    <button><img src="./logo.svg" /></button>
                <div class = "header_menu">
                    <button class="header_button">팀원 모집 공고</button>
                    <span><img src="./line.svg"> </span>
                    <button class="header_button">내 팀 들어가기</button>
                    <span><img src="./line.svg"></span>
                    <button class="header_button">내 정보</button>
                </div>
            </div>
        </section>
        <div class="chat">
            <section class="article">
					<form class="input_div">
						<input type="text" id="text_box" placeholder="내용을 입력해주세요..">
						<input type="button" id="submit_button" value="보내기"> 
					</form>
            </section>
            <section class="friends">
                <ul>
                    <li class="friend_list"> 
                    	
                        <img class="profile" src="http://placehold.co/40" />
						<p id="profile_name">user1</p>
                    </li>
                    <li class="friend_list"> 
                    	
                        <img class="profile" src="http://placehold.co/40" />
						<p id="profile_name">user2</p>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</body>


<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");
	
	*{
		margin: 0;
		padding: 0 0 0 0;
		background-color: #F3F3F3;
	}
	
    .container {
		background-color: #F3F3F3;
		height: 1024px;
        width: 1440px;
   		margin: auto;
        display: relative;
	}
	
	body{
	outline: 1px;
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
        gap: 16px;
    }
    .chat{
        display: flex;
        align-items: center;
        gap: 48px;
        width: 100%;
        padding: 148px 180px;
    }
    .article{
    	display: flex;
        position: relative;
        width: 826px;
        height: 828px;
        border-radius: 15px;
        opacity: 0px;
        background: #FFFFFF;
   		padding: 0px 0px 20px 0px;
   		align-items:flex-end;
    }
    
    .input_div{
        margin: 0 auto;
    	 display: flex;
         position: relative;
   		 width: 750px;     
   		 height: 50px;
   		 border-radius: 15px;
   		 background: white;
   		 border: 3px solid  #539A74;
   		 
    }
    
    
    #text_box{
   		display: flex;
   		position: relative;
   	 	background: white;  
   	 	width: 660px; 
  		margin: 0px 0px 0px 15px;
  		border: none;
  		outline: none;
    }
    
    #text_box::placeholder{
   		background: white;   
   		color: #539A74;
  		border: none;
    }
    
    #submit_button{
    	position: relative;
    	margin: 5px auto;
   		background: #539A74;       
  		border: none;
    	width: 65px;
    	height: 40px;
    	border-radius: 10px;
        font-size : 15px;
    	text-align: center;
        color: white;
    }

    
    
    .friends{
        position: relative;
        display: flex;
        width: 200px;
        height: 828px;
        border-radius: 15px;
        background: #FFFFFF;
    }
    ul {
 	    border-radius: 15px;
    	width: 100%;
        list-style-type: none;
        background: white;   
    }
    .li{
        display: flex;
        align-items: center;
        gap: 16px;
    }
    .profile{
        background: white; 
        width: 50px;
        height: 50px;
        border-radius: 100%;     
        vertical-align: middle;
        margin: 0 auto;
    }
    #profile_name {
    	font-size : 25px;
    	color : #539A74;
    	background: none;
    	border: none;
    }
    .friend_list {    
        background: none;
        display: flex;
        width: 150px;
        height: 50px;
        margin: 0 auto;
        padding: 25px 15px 0px 0px;
    }
</style>
</html>