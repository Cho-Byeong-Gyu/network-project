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
<div style="text-align:center;">
    <a class="Prev" href="?year=<%= prevYear %>&month=<%= prevMonth + 1 %>">Prev</a>
	<h2><%= sdf.format(calendar.getTime()) %></h2>
    <a class="Next" href="?year=<%= nextYear %>&month=<%= nextMonth + 1 %>">Next</a>
</div>
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