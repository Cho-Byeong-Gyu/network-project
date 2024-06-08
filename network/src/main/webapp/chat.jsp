<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
    <script type="text/javascript">
        function submitFunction() {
            var chatName = $('#chatName').val();
            var chatContent = $('#chatContent').val();
            $.ajax({
                type: "POST",
                url: "./chatSubmitServlet",
                data: {
                    chatName: chatName,
                    chatContent: chatContent
                },
                success: function(result){
                    if(result==1){
                        alert('전송에 성공했습니다');
                    }else if(result==0){
                        alert('이름과 내용을 정확히 입력하세요.');
                    }else {
                        alert('데이터베이스 오류가 발생했습니다.');
                    }
                }
            });
            $('#chatContent').val('');
        }
        function chatListFunction(type) {
            $.ajax({
                type: "POST",
                url: "./chatListServlet",
                data: {
                    listType: type,
                },
                success: function(data){
                    var parsed = JSON.parse(data);
                    var result = parsed.result;
                    for(var i = 0; i < result.length; i++){
                        addChat(result[i][0].value, result[i][1].value, result[i][2].value);
                    }
                }
            });
        }

        function addChat(chatName, chatContent, chatTime) {
            $('#chatList').append('<div class="row">' +
                '<div class="media">' +
                '<h4 class="media-heading">' +
                chatName +
                '<span class="small-pull-right">' +
                chatTime +
                '</span>' +
                '</h4>' +
                '<p>' +
                chatContent +
                '</p>' +
                '</div>' +
                '</div>' +
                '</hr>'
            );
        }
   	 </script>
</head>
<body>
    <div class="container">
        <section class = "header">       	
            <div class="header__icons">
                <form method="post" action="bbs.jsp"> <button><img src="./logo.svg" /></button></form>
 				<selection class = "header_menu">
			   	<form method="post" action="calendar.jsp">
	                 <button class="header_button">팀원 모집 공고</button>
	                 <span><img src="./line.svg"> </span>
	                 <button class="header_button">캘린더</button>
	                 <span><img src="./line.svg"></span>
	                 <button class="header_button">내 정보</button>
		   		</form>
       	        </selection>
            </div>
        </section>
        <div class="chat">
            <section class="article">
                <div id="chatList" class="chatList">

                </div>
                <div class="input_cont">
				<form class="input_div">
				    <input type="text" id="text_box" placeholder="내용을 입력해주세요..">
					<input type="button" id="submit_button" value="보내기"> 
                </form>
            </div>
            </section>
            <section class="friends">
                <ul>
                    <li class="friend_list"> 
						<p id="profile_name">user1</p>
                    </li>
                    <li class="friend_list">
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
    .chatList{
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
    	margin: 5px auto;
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
        padding: 12px;
    }
</style>
</html>