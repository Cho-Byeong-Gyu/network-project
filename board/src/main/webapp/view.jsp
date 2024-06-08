<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %> 
     <%@ page import = "bbs.Bbs" %> 
      <%@ page import = "bbs.BbsDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int bbsID =0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));	
		}
		if(bbsID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
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
	<div class="article">
			<form class="title_form">
	 			<input type="button" class="back_btn" value=" < " onClick="location.href='./bbs.jsp'">
	 			<input type="text" class="bbsTitle" value="<%=bbs.getBbsTitle() %>" disabled>
	 			<input type="button" class="chat_btn" value="채팅방 입장" onClick="location.href='./chat.jsp?bbsID=<%= bbsID %>'">
			</form>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<tbody>
			<tr class="name">
				<td class="name_td">작성자</td>
				<td colspan="2"><%=bbs.getUserID() %></td>
			</tr>
			<tr class="date">
				<td class="date_td">작성일자</td>
				<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %>
				</td>
			</tr>
			<tr class="content">
				<td class="content_td">내용</td>
				<td class="textArea" colspan="2""><%=bbs.getBbsContent() %> <span class="ku"><img src="./ku.svg" /></span> </td>
			</tr>				
		</tbody>					
	    </table>
		<form class="edit_form">
 			<input type="button" class= "edit_btn" value="수정" onClick="location.href='./update.jsp?bbsID=<%= bbsID %>'">
 			<input type="button" class= "delete_btn" value="삭제" onClick="location.href='./deleteAction.jsp?bbsID=<%= bbsID %>'">
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
   		top: 148px;
    }
 	    
    .ku {
    	position:  relative;
    	float: right;
    	top: 120px;
    	background: white;
    }
 	
     table { 
	     width: 90%;
	     height: 80%;
	     margin: 0 auto;
	     background: white;
     }
     
     td {
	     color: #20704E;
	     padding: 8px;
	     text-align: center;
	     border-radius: 8px;
	     padding: 1px;
	     background: white;
	     font-weight: bold;
	     outline: 2px solid #20704E;
     }
     
     
     th { 
	     background: #9BC8B5;
	     font-weight: bold;
	     color: #20704E;
	     padding: 8px;
	     text-align: center;
	     border-radius: 8px;
	     padding: 1px;
	     background: white;
	     font-weight: bold;
         outline: 2px solid #20704E;
     }
    
    .name {
    	height: 45px;
    	text-align: center;
    	font-size: 20px;
    }

	.date {
    	height: 45px;
   	    text-align: center;
    	font-size: 20px;
	}    

	.content {
    	height: 460px;
    	font-size: 20px;
	}    
	
	
	.textArea {
    	padding: 20px;
    	font-size: 20px;
	}
	

	.title_form {
    	display: flex;
	    margin: 0 auto;
        position: relative;
    	width: 1080px;
    	height: 120px;
	    background: white;
	    border-radius: 15px;   
	}
	  	    
    .edit_form {
       	display: flex;
	    margin: 0 auto;
        position: relative;
    	width: 1080px;
    	height: 60px;
	    background: white;
	    border-radius: 15px;   
	    
    }
    .back_btn {
    	background: white;   		
  		color: #20704E;
    	font-size: 35px;
    	border: none;
    	margin: 0 15px 0 30px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }
    
	.bbsTitle {
		display: flex;
	  	background: white;
  	    border: none;
	    width: 770px;
  	    color: #20704E;
  	    font-size: 35px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }
    
    .edit_btn{
        background:   #539A74;		
       	width: 80px;
       	height: 35px;
    	border: none;
    	font-size: 18px;
		color: white;
	    text-align: center;
   	    margin: 10px 10px 0px 830px;
	    border-radius: 10px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }

	.delete_btn {
        background:   #539A74;	
    	width: 80px;
       	height: 35px;
    	border: none;
    	font-size: 18px;
		color: white;
	    text-align: center;
   	    margin: 10px 10px 0px 25px;
	    border-radius: 10px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
	}
	
	
	.chat_btn {
        background: #539A74;	
    	width: 125px;
       	height: 40px;
    	border: none;
    	font-size: 18px;
		color: white;
	    text-align: center;
   	    margin: 40px 60px 0px 25px;
	    border-radius: 10px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }
    
    .name_td{
    	width: 100px;
    }

    .date_td{
    	width: 100px;
    }
    
    .content_td{
    	width: 100px;
    }
    
</style>
</html>
