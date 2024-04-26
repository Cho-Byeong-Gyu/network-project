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

            </section>
            <section class="friends">
                <ul>
                    <li class="friend_list"> 
                        <img class="profile" src="http://placehold.co/40" />
                        <span>이름</span>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</body>

<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");
    .container {
		background-color: #F3F3F3;
		height: 1024px;
        width: 1440px;
        display: relative;
	}
    button {
        background: none;
        color: inherit;
        border: none;
        padding: 0;
        font: inherit;
        cursor: pointer;
        outline: inherit;
    }	
    .header	{
        position: absolute;
        display: flex;
        padding: 0px 180px;
        box-sizing: border-box;
        background: #FFFFFF;
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
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }
    .header_menu{
        display:flex;
        align-items: center;
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
        list-style-type: none;
    }
    .li{
        display: flex;
        align-items: center;
        gap: 16px;
    }
    .friend_list .profile{
        width: 50px;
        height: 50px;
        border-radius: 100%;
    }
</style>
</html>