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
    function autoClosingAlert(selector, delay) {
        var alert = $(selector).alert();
        alert.show();
        window.setTimeout(function () { alert.hide(); }, delay);
    }
        function submitFunction() {
            var roomID = '<%= roomID %>';
            var userID = '<%= userID %>';
            var chatContent = $('#chatContent').val();
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
                        autoClosingAlert('#successMessage', 2000);
                    } else if (result == 0) {
                        autoClosingAlert('#dangerMessage', 2000);
                    } else {
                        autoClosingAlert('#warningMessage', 2000);
                    }
                }
            });
            $('#chatContent').val('');
        }
        var lastID =0;
        function chatListFunction(type) {
        	var roomID = '<%= roomID %>';
            var userID = '<%= userID %>';
            $.ajax({
                type: "POST",
                url: "./chatListServlet",
                data: {
                	userID: encodeURIComponent(userID),
                    roomID: encodeURIComponent(roomID), 
                    listType: type,
                },
                success: function (data) {
                    var parsed = JSON.parse(data);
                    var result = parsed.result;
                    for (var i = 0; i < result.length; i++) {
                        addChat(result[i][0].value, result[i][1].value, result[i][2].value);
                    }
                    lastID=Number(parsed.last);
                }
            });
            $('#chatContent').val('');
        }
        
        function addChat(chatName, chatContent, chatTime) {
            $('#chatList').append('<div class>="row">' +
                '<div class="media">' +
                '<a class="pull-left" href="#">' +         
                '</a>' +
                '<div class="media-body">' +
                '<h4 class="media-heading">' +
                chatName +
                '<span class="small pull-right">' +
                chatTime +
                '</span>' +
                '</h4>' +
                '<p>' +
                chatContent +
                '</p>' +
                '</div>' +
                '</div>' +
                '</div><hr />'
            );
            ${'#chatList'}.scrollTop($('#chatList')[0].scrollHeight);
        }
        function getInfiniteChat(){
        	setInterval(function()){
        		chatListFunction(lastID);
        	}, 3000);
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
                    <button class="header_button">내 팀 들어가기</button>
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
                <form class="input_div">
                    <textarea style="height: 80px;" id="chatContent" placeholder="내용을 입력해주세요.."></textarea>
                    <button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
                    <div class="clearfix"></div>
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
    <script type="text"/javascript">
    $(document).ready(function){
    	chatListFunction('no');
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