<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>    
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시글 목록</title>

</head>
<body>
<% 
	int pageNumber =1; 
if(request.getParameter("pageNumber")!= null){
	pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
}
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
	<div class="container">
		<div class="article">
			<section class="board_header">
				<h2> 당신과 함께할 팀원을 찾아보세요 </h2>
				<form class="write_form"><input type="button" class="write_btn" value="글 작성하기" onClick="location.href='./write.jsp'"></form>
		    </section>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th> </th>
				</tr>
			</thead>
			<tbody>
				<% 
				BbsDAO bbsDAO = new BbsDAO();
				ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
				for (int i=0; i<list.size() ; i++){
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><%= list.get(i).getBbsTitle() %></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>					
				   <td><input class="chatBtn" type="button"  value="입장하기" onClick="location.href='./view.jsp?bbsID=<%= list.get(i).getBbsID()%>'"></td>
				</tr>
				<%
					}
				%>
			</tbody>					
		    </table>
			<% 
		    	if(pageNumber != 1){
		    %>
		    <a href="bbs.jsp?pageNumber=<%= pageNumber -1%>" class="prevBtn">이전 페이지</a>
		    <%	
		    	} if(bbsDAO.nextPage(pageNumber)){
		    %>
		    <a href="bbs.jsp?pageNumber=<%= pageNumber +1%>" class="nextBtn">다음 페이지</a>
		    
		    <%
		    	}
		    %>
		</div>
	</div>
</body>
</html>



<style>			
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");					
	
	a{
		 text-decoration-line: none;
		 color: inherit;
		 background-color: none;
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
	
	h2{
		color: #046B40;
		font-size: 30px;
		margin: 0px 0px 0px 5px;
	}
	
	table{
		 width: 100%;
	     height: 90%;
	     margin: 0 auto;
	     background: white;
	     border-radius: 15px;
	     border-spacing: 5px 5px;
     }
     	
     	
	th { 
	    color: #046B40;
	    font-size: 22px;
        background: white;
        text-align: center;
    }
    
	tr {
		background-color: white; 
	    color: #046B40;
	    height: 50px;
        background: white;
     	font-size: 15px;
     	outline: 1.8px solid #539A74; 
  	    border-radius: 8px;
	}
	
	td {
		background-color: white; 
	    color: #046B40;
	    height: 50px;
	    background: white;
	   	font-size: 15px;
	    border-radius: 8px;
	}
	
	caption {
        background: none;
	}
	
	.write_form {
		display:flex;
	  	background: none;
		width: 125px;
		height: 70px;
		margin: 0px 0px 0px 605px;
  	}
  	
  	
	.write_btn {
		background: #4B8D6A;	
    	height: 45px;
    	width: 125px;
    	border: none;
    	font-size: 24px;
    	font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
		color: white;
	    text-align: center;
	    margin: 0 auto;
	    vertical-align: middle;
	    border-radius: 10px;
	}
   
    .board_header {
	    display: flex;
	   	width: 1200px;
	   	height: 70px;
	  	border: none;
   }
   
    
    .article {
        position: relative;
        width: 1200px;
        height: 828px;
        background: none;
   		margin: 0 auto;
   		vertical-align: middle;
   		top: 148px;
 	}
   		
   	.prevBtn {
   		 color: #046B40;
  		 margin: 0 auto;
  		 float: left;
   	}
   		
   	.nextBtn {
	   	 color: #046B40;
	   	 margin: 0 auto;
	   	 float: right;
   	}
		
	.chatBtn {
		background: #4B8D6A;	
    	height: 35px;
    	width: 75px;
    	border: none;
    	font-size: 14px;
		color: white;
	    text-align: center;
	    margin: 0 auto;
	    border-radius: 5px;
	}	   	

}

