<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <%
        String userID = null; // 사용자 ID를 가져왔다. 
        if (session.getAttribute("ID") != null) {
            userID = (String) session.getAttribute("ID");
        }
        String roomID = null; // 사용자 ID를 가져왔다. 
        if (request.getParameter("roomID") != null) {
            roomID = (String) request.getParameter("roomID");
        }
        %>
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>chat</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">    
        
            function submitFunction() {
                var roomID = '<%= roomID %>';
                var userID = '<%= userID %>';
    
                var chatContent = $('#text_box').val();      
                
                console.log("submitFunction called with roomID:", roomID, "userID:", userID);
                $.ajax({
                    type: "POST",
                    url: "./chatSubmitServlet",
                    data: {  
                        userID: encodeURIComponent(userID),
                        roomID: encodeURIComponent(roomID),  
                        chatContent: encodeURIComponent(chatContent)
                    },
                    success: function (result) {
                        if (result == 1) {
                            // autoClosingAlert('#successMessage', 2000);
                            addFriend(userID);
                        } else if (result == 0) {
                            // autoClosingAlert('#dangerMessage', 2000);
                        } else {
                            // autoClosingAlert('#warningMessage', 2000);
                        }
                    }
                });
                $('#text_box').val('');
            }
            function addFriend(userID) {
                if ($("#friends ul").find("#friend-" + userID).length == 0) {
                    $("#friends ul").append('<li class="friend_list" id="friend-' + userID + '"><p id="profile_name">' + userID + '</p></li>');
                }
            }
            var lastID = 0;
            function chatListFunction(type) {
                var roomID = '<%= roomID %>';
                var userID = '<%= userID %>';
                
                $.ajax({
                    type: "POST",
                    url: "./chatListServlet",
                    data: {
                        userID: encodeURIComponent(userID),
                        roomID: encodeURIComponent(roomID), 
                        listType: type
                    },
                    success: function (data) {
                        
                        if(data=="") return;
                        var parsed = JSON.parse(data);
                        var result = parsed.result;
                       
                        for (var i = 0; i < result.length; i++) {
                            addChat(result[i][0].value, result[i][2].value, result[i][3].value);
                        }
                        lastID=Number(parsed.last);
                    }
                    
                });
            }
            function addChat(chatName, chatContent, chatTime) {
                $('#chatList').append('<div class="chat-item">' +
                    '<div class="chat-header">' +
                    '<span class="chat-name">' + chatName + '</span>' +
                    '<span class="chat-time">' + chatTime + '</span>' +
                    '</div>' +
                    '<div class="chat-content">' + chatContent + '</div>' +
                    '</div>');
                $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
            }
            function getInfiniteChat(){
                setInterval(function(){
                    chatListFunction(lastID);
                }, 500);
            }  
        
    
        </script>
    </head>
    <body>
        <div class="container">
            <section class="header">
                <div class="header__icons">
                    <button><img src="./logo.svg" /></button>
                    <div class="header_menu">
                        <button class="header_button">팀원 모집 공고</button>
                        <span><img src="./line.svg"> </span>
                        <button class="header_button">캘린더</button>
                        <span><img src="./line.svg"></span>
                        <button class="header_button">내 정보</button>
                    </div>
                </div>
            </section>
            
            <div class="alert alert-success" id="successMessage" style="display: none;">
                    <strong>메세지 전송에 성공했습니다.</strong>
                </div>
                <div class="alert alert-danger" id="dangerMessage" style="display: none;">
                    <strong>이름과 내용 모두 입력해주세요.</strong>
                </div>
                <div class="alert alert-warning" id="warningMessage" style="display: none;">
                    <strong>데이터베이스 오류가 발생했습니다.</strong>
                </div>
                
                <div class="chat">
                    <section class="article">
                        <div id="chatList" class="chatList">
                            <!--addChat이 실행되면 여기에 채팅이 쌓일거예여-->
                        </div>
                        <div class="input_cont">
                             <form class="input_div" onsubmit="submitFunction(); return false;">
                                <input type="text" id="text_box" placeholder="내용을 입력해주세요..">
                                <input type="button" id="submit_button" value="보내기" onclick="submitFunction()"> 
                            </form>
                        </div>
                    </section>
                    <section class="friends" id= "friends">
                        <ul>
                             <li class="friend_list" id="friend-정연우"> 
                            <p id="profile_name">정연우</p>
                        </li>
                        <li class="friend_list" id="friend-조병규">
                            <p id="profile_name">조병규</p>
                        </li>
                        <li class="friend_list" id="friend-신종윤">
                            <p id="profile_name">신종윤</p>
                        </li>
                        </ul>
                    </section>
                </div>
        </div>
        <script type="text/javascript"> 
                 $(document).ready(function(){
                    chatListFunction('0');
                    getInfiniteChat();
                });
        </script>
    </body>
    </html>
    
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
   		margin: 0 auto;
        display: relative;
	}

    .article {
        display: flex;
        flex-direction: column;
        position: relative; 
        width: 826px;
        height: 828px;
        border-radius: 15px;
        background: #FFFFFF;
        padding: 0px;
    }
	    
    .friends{
        position: relative;
        display: flex;
        width: 200px;
        height: 828px;
        border-radius: 15px;
        background: #FFFFFF;
    }
	
	form {
		display:flex;
	  	background: none;
		width: 480px;
		gap: 16px;
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
        gap: 16px;
    }
    .chat{
        display: flex;
        align-items: center;
        gap: 48px;
        width: 100%;
        padding: 148px 0px 0px 180px;
    }
    img{
        background-color: #FFFFFF;
    }
    #chatList{
        overflow-y: auto;
    margin: 15px; 
    padding: 15px; 
    background-color: #FFFFFF; 
    height: 710px; 
    }
    .input_cont{
        display: flex;
        justify-content: center;
    }
    .input_div {
    position: absolute; 
    bottom: 0; 
    width: 806px;
    height: 50px;
    border-radius: 15px;
    background: white;
    border: 3px solid #539A74;
    padding: 0;
    margin: 10px 0 10px 0;
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
            margin: 5px ;
            background: #539A74;       
            border: none;
            width: 65px;
            height: 40px;
            border-radius: 10px;
            font-size : 15px;
            text-align: center;
            color: white;
            cursor: pointer;
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
            font-family: Pretendard;
            font-size : 25px;
            color : #539A74;
            background: none;
            border: none;
        }
        .friend_list {    
        background: none;
        display: flex;
        margin: 0 auto;
        justify-content: center;
        padding-top: 20px;
    }
        .chat-item {
        background-color: #fff;
        padding: 10px;
        margin-bottom: 10px;
        border-bottom: 1px solid #000000;
    }
    .chat-item:last-child {
    border-bottom: none;
}
    .chat-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 5px;
        background-color: #fff;
    }
    
    .chat-name {
        font-weight: bold;
        background-color: #fff;
        font-family: Pretendard;
    }
    
    .chat-time {
        font-size: 12px;
        color: #888;
        background-color: #fff;
        font-family: Pretendard;
    }
    .chatList{
        overflow-y: auto;
    margin: 15px; 
    padding: 15px; 
    background-color: white; 
    height: 710px; 
    }
    .chat-content {
        word-break: break-all;
        background-color: #fff;
        font-family: Pretendard;
    }
    </style>
    </html>