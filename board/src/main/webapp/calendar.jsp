<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*, calendar.calendarDAO" %>
<%@ page import="calendar.calendarDAO" %>    
<%@ page import="calendar.calendar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

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
		     <form class="logo_form" method="post" action="bbs.jsp">
	                 <button><img src="./logo.svg" /></button>
	   		 </form>
	       	 <selection class = "header_menu">
			    <form class="menu_form" method="post" action="menuAction.jsp">
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
				calendarDAO calendar2 = new calendarDAO();
				
			
			    for (int i = 1; i < startDay; i++) {
			        if (count == 0) out.print("<tr>");
			        out.print("<td></td>");
			        count++;
			    }
			    for (int day = 1; day <= daysInMonth; day++) {
					String Fdate = calendar2.getFormatDate(year, month+1, day);
				
			        if (count % 7 == 0) out.print("<tr>");
			        if (day == currentDay && month == today.get(Calendar.MONTH) && year == today.get(Calendar.YEAR)) {
			            int result = calendar2.schedule_Write(year, month+1, day);
		          
		     			if(result >=1 ){
		     			%>	<td class='today' style="color: #285E47;"><a href="javascript:Fdetail('<%= Fdate%>')"> <%= day %> </a></td>
		     			<% } else {
	     				%>	<td> <%= day %> </td>
	   				<% }
			        } else {
			            int result = calendar2.schedule_Write(year, month+1, day);
		         
		     			if(result >=1 ){
		     			%>	<td style="color: #285E47"><a href="javascript:Fdetail('<%= Fdate%>')"> <%= day %> </a></td>
		     			<% } else {
	     				%>	<td> <%= day %> </td>
	   				<% }
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
	 <div class="aside">
		 <form class="schedule_Input" method="post" action="calendarWriteSave.jsp">
				<input type="text" id="schedule_Label" placeholder="일정 관리" disabled>
				<input type="text" id="schedule_Date" name="schedule_Date" placeholder="날짜를 입력해주세요. " maxlength="10">
				<input type="text" id="schedule_Content" name="schedule_Content" placeholder="추가할 일정을 입력해주세요." maxlength="40">
				<input id="scheduleAdd_Btn"type="submit" value="일정 추가">
		 </form>
	 </div>
</div>

<script type="text/javascript">
	function Fdetail(Fdate) {
	    var w = (window.screen.width / 2) - 200;
	    var h = (window.screen.height / 2) - 200;
	    var url = "calendarContentView.jsp?schedule_Date=" + Fdate;
	    window.open(url, "calendarContentView", "width=300,height=300,left=" + w + ",top=" + h);
	}
	
</script>
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
	
	.container {
		background-color: #F3F3F3;
		z-index: -1;
		width: 1440px;
		height: 1024px;
		margin: auto;
	}
	
	
	.aside {
	    position: relative;
        width: 300px;
        height: 435px;
        border-radius: 15px;
        background: white;
   		margin: 15% 3% 0% 0%;
   		vertical-align: middle;
	    text-align: center;
   		top: 18px;
   		float: right;
	}

    .article {
   		float: left;
	    text-align: center;
        position: relative;
        width: 1000px;
        height: 828px;
        border-radius: 15px;
        background: white;
	    margin: 2% 0% 0 3%;
   		vertical-align: middle;
   		top: 18px;
    }
    

	.logo_form {
	display:flex;
  	background: none;
	width: 480px;
	gap: 16px;
  	}

	.menu_form {
		display:flex;
	  	background: none;
		width: 400px;
		gap: 16px;
	}
	
	.schedule_form {
    	margin: 0 auto;
   		vertical-align: middle;
	    text-align: center;
		width: 300px;
	  	background: none;
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
    
    .schedule_Input {
   		vertical-align: middle;
		width: 200px;
		margin: 0 auto;
	  	background: none;
    }
    
    #schedule_Label {
  	    background:none;
  	    border: none;
	    width: 200px;
	    height: 40px;
	    text-align: center;
 		margin-top: 80px;
  	    color: #539A74;
    }

    #schedule_Label::placeholder {
  	    color: #539A74;
  	    font-size: 28px;
  	    font-weight: bold;
    }

    #schedule_Date {
   		vertical-align: middle;
		margin: 0 auto;
	  	background: none;
  	    color: #539A74;
		width: 200px;
		height: 35px;
		border-radius: 8px;
	    font-size: 15px;
        padding: 0 0 0 15px;
		font-family: "Pretendard Variable";
		border : 0.2px solid  #539A74;
 		margin-top: 45px;
    }
    
    #schedule_Content {
	   	vertical-align: middle;
		margin: 0 auto;
	  	background: none;
  	    color: #539A74;
		width: 200px;
		height: 35px;
		border-radius: 8px;
	    font-size: 15px;
        padding: 0 0 0 15px;
		font-family: "Pretendard Variable";
		border : 0.2px solid  #539A74;
 		margin-top: 45px;
    }
    
    
    #scheduleAdd_Btn{
	    font-size: 15px;
 		margin: 0 auto;
		background: #9BC8B5;
		width: 165px;
		height: 35px;
		color: white;
		border-radius: 8px;
		border: none;
		margin-top: 50px;
    }
    

    
    .today {
    	border: 3px solid #9BC8B5;
    }
	
    .header	{
    
        display: flex;
        padding: 0px 150px 0px 180px;
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
        float: right;
        align-items: center;
        background: white;
        gap: 16px;
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
	    margin: 30px 0px 0px 200px;
	    color: #539A74; 
	    border-radius: 15px;
	}
    
	.monthBtn {
		display: flex;
		font-size: 40px;
		background: white;
	    margin: 22px auto;
	    color: #539A74; 
	   	border-radius: 15px;
	}
	
	
	.nextBtn {
		display: flex;
		font-size: 30px;
		background: white;
	    margin: 30px 200px 0px 0px;
	    color: #539A74; 
	}

     table { 
	     width: 90%;
	     height: 80%;
	     margin: 0 auto;
	     background: white;
	     table-layout: fixed;
	     border-spacing: 10px 5px;
     }
     
     th, td {
	     outline: 1px solid #6EBE9C;
	     color: #6EBE9C;
	     padding: 8px;
	     text-align: center;
	     border-radius: 8px;
	     padding: 1px;
	     background: white;
	      font-weight: bold;
     }
     
     
     th { 
	     background: #9BC8B5;
	     color: white; 
	      font-weight: bold;
     }
    
</style>
</html>