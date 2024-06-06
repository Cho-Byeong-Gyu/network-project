<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판 글 추가하기</title>
</head>
<body>
<%
    String yearParam = request.getParameter("year");
    String monthParam = request.getParameter("month");
    int year, month;

    Calendar today = Calendar.getInstance();
    if (yearParam != null && monthParam != null) {
        year = Integer.parseInt(yearParam);
        month = Integer.parseInt(monthParam) - 1; 
    } else {
        year = today.get(Calendar.YEAR);
        month = today.get(Calendar.MONTH);
    }

    Calendar calendar = Calendar.getInstance();
    calendar.set(year, month, 1);

    int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    int startDay = calendar.get(Calendar.DAY_OF_WEEK);
    int currentDay = today.get(Calendar.DAY_OF_MONTH);

    int nextMonth = month + 1;
    int nextYear = year;
    if (nextMonth > 11) {
        nextMonth = 0;
        nextYear++;
    }

    int prevMonth = month - 1;
    int prevYear = year;
    if (prevMonth < 0) {
        prevMonth = 11;
        prevYear--;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy MMMM");
%>

	<div class="container">
		<div class="header">
		 	<div class="header__icons">
		     <form method="post" action="bbs.jsp">
                  <button><img src="./logo.svg" /></button>
	   		 </form>
        	 <selection class = "header_menu">
			   <form method="post" action="menuAction.jsp">
	                 <button class="header_button">팀원 모집 공고</button>
	                 <span><img src="./line.svg"> </span>
	                 <button class="header_button">캘린더</button>
	                 <span><img src="./line.svg"></span>
	                 <button class="header_button">내 정보</button>
		   	   </form>
       	      </selection>
	        </div>
	   </div>
	<div class="article">
		<selection class="monthBtn">
	    <a class="prevBtn" href="?year=<%= prevYear %>&month=<%= prevMonth + 1 %>">이전달</a>
		<h2 class="monthBtn" ><%= sdf.format(calendar.getTime()) %></h2>
	    <a class="nextBtn" href="?year=<%= nextYear %>&month=<%= nextMonth + 1 %>">다음달</a>
	    </selection>
	<table>
	    <tr>
	        <th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th>
	    </tr>
		<%
		    int count = 0;
		    for (int i = 1; i < startDay; i++) {
		        if (count == 0) out.print("<tr>");
		        out.print("<td></td>");
		        count++;
		    }
		    for (int day = 1; day <= daysInMonth; day++) {
		        if (count % 7 == 0) out.print("<tr>");
		        if (day == currentDay && month == today.get(Calendar.MONTH) && year == today.get(Calendar.YEAR)) {
		            out.print("<td class='today'>" + day + "</td>");
		        } else {
		            out.print("<td>" + day + "</td>");
		        }
		        count++;
		        if (count % 7 == 0) out.print("</tr>");
		    }
		    while (count % 7 != 0) {
		        out.print("<td></td>");
		        count++;
		    }
		    if (count % 7 == 0) out.print("</tr>");
		%>
		</table>
	 </div>
</div>
	
</body>
</html>



<style>			
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css");					
	
	a{
	 text-decoration-line: none;
	 color: inherit;
	}

	*{
		margin: 0;
		padding: 0 0 0 0;
		background-color: #F3F3F3;
	}
	
	.container {
		background-color: #F3F3F3;
		z-index: -1;
		width: 1440px;
		height: 1024px;
		margin: auto;
	}

	form {
	display:flex;
  	background: none;
	width: 480px;
	gap: 16px;
  	}
	
	body {
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
    
    .board_header {
  	    display: flex;
        position: relative;
    	width: 1080px;
    	height: 120px;
 	  	text-align: center; 
	    align-items: center;   	    
    	margin: 0 auto;
 	  	border: none;
 	  	background: white;
 	  	border-radius: 15px;
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
 	  	margin-top: 15px;
 	}
 	
 	.board_header_form{
      	margin: 0 auto;
        position: relative;
    	width: 1080px;
    	height: 120px;
 	    align-items: center;
 	}  

	.prevBtn {
		display: flex;
		font-size: 30px;
		background: white;
	    margin: 50px 0px 0px 200px;
	    color: #539A74; 
	    border-radius: 15px;
	}
    
	.monthBtn {
		display: flex;
		font-size: 40px;
		background: white;
	    margin: 30px auto;
	    color: #539A74; 
	   	border-radius: 15px;
	}
	
	
	.nextBtn {
		display: flex;
		font-size: 30px;
		background: white;
	    margin: 50px 200px 0px 0px;
	    color: #539A74; 
	}

     table { 
	     width: 85%;
	     height: 80%;
	     margin: 0 auto;
	     background: white;
	     table-layout: fixed;
	     border-spacing: 10px 5px;
     }
     
     th, td {
	     outline: 1px solid #539A74; 
	     padding: 8px;
	     text-align: center;
	     border-radius: 8px;
	     padding: 1px;
	     background: white;
     }
     
     
     th { 
	     background: #9BC8B5;
	     color: white; 
     }
    
</style>