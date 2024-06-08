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
	      	  </selection>
        </div>
    </div>
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
		height: 1024px;
        width: 1440px;
   		margin: 0 auto;
        display: relative;
	}

    .article {
        display: flex;
        flex-direction: column;
        position: relative; 
        width: 1080px;
        height: 828px;
        border-radius: 15px;
        background: #FFFFFF;
        padding: 0px;
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
    width: 1000px;
    height: 50px;
    border-radius: 15px;
    background: white;
    border: 3px solid #539A74;
    padding: 0;
    margin: 10px 0 10px 0;
    display: flex;
    justify-content: space-between;
}   

    #text_box{
           display: flex;
           position: relative;
           background: white;  
           width: 915px; 
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
        margin: 5px;
        background: #539A74;       
        border: none;
        width: 85px;
        height: 40px;
        border-radius: 10px;
        font-size : 15px;
        text-align: center;
        color: white;
        cursor: pointer;
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
