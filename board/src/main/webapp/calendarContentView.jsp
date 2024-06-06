<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="calendar.calendarDAO" %>    
<%@ page import="calendar.calendar" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>

<%
	String Fdate = request.getParameter("schedule_Date");
	calendarDAO calendar = new calendarDAO();
	ArrayList<String> contents = calendar.schedule_List(Fdate);
%>

<h2> <%= Fdate %> 일정 리스트 </h2>
<table>
    <% for (String content : contents) { %>
        <tr>
            <td><%= content %></td>
            <td>
                <form method="post" action="calendarDelete.jsp">
                    <input type="hidden" name="schedule_Date" value="<%= Fdate %>">
                    <input type="hidden" name="schedule_Content" value="<%= content %>">
                    <button type="submit" id="delete_Btn" name="delete">삭제</button>
                </form>
            </td>
        </tr>
    <% } %>
</table>

</body>

<style>
	*{
 		padding: 0px 0px 0px 0px;
	}
	
     table { 
	     width: 80%;
	     margin: 0 auto;
	     background: white;
	     table-layout: fixed;
	     border-spacing: 12px;
     }
     
     tr {
	     outline: 1px solid #539A74; 
	     text-align: center;
	     border-radius: 8px;
	     background: white;
         margin-top: 10px;
         width: 240px;
     }
     
     td {
     	color:	#539A74;
    	height: 28px;
    	padding: 1px;
     }
     
    h2	{
     	 font-size : 20px;
     	 color:	#539A74;
   	     background: none;
   	     text-align: center;
     }
     
     #delete_Btn {
     	 float: right;
     	 margin: 0px, 30px, 0px, 30px;
     	 background: #9BC8B5;
	     border-radius: 8px;
	     border: 1px solid #9BC8B5;
	     vertical-align: middle;
		 color: white;
		 font-size: 12px;
		 height: 25px;
     	 width: 50px;
     }
</style>
</html>
