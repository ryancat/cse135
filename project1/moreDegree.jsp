<%@page import="support.*, java.util.*, degree.*" %>
<html>
	<head><title>More degree</title></head>

	<%//retrieve information from degree and session
	Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
	String disciplineOfDegree = request.getParameter("disciplineOfDegree");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String gpa = request.getParameter("gpa");
	String title = request.getParameter("title");

	degree.get(degree.size() - 1).setDiscipline(disciplineOfDegree);
	degree.get(degree.size() - 1).setMonth(month);
	degree.get(degree.size() - 1).setYear(year);
	degree.get(degree.size() - 1).setGpa(gpa);
	degree.get(degree.size() - 1).setTitle(title);

	String citizenship = session.getAttribute("citizenship").toString();
	String firstName = session.getAttribute("firstName").toString();
        String middleName = session.getAttribute("middleName").toString();
	String lastName = session.getAttribute("lastName").toString();
        String residence = session.getAttribute("residence").toString();
	String locationOfDegree = degree.get(degree.size() - 1).getLocation();
	String universityOfDegree = degree.get(degree.size() - 1).getUniversity();
	String streetAddress = session.getAttribute("street address").toString();
	String zipCode = session.getAttribute("zip code").toString();
	String areaCode = session.getAttribute("area code").toString();
	String city = session.getAttribute("city").toString();
	String telephoneNum = session.getAttribute("country telephone code").toString();
	%>
	      
          <%
    //if(lastName.equals("")){
    //lastName = "empty";
    //}
    //if(firstName.equals("")){
    //firstName = "empty";
    //}
    //if(middleName.equals("")){
    //middleName = "empty";
    //}-->
    %>

    <body>	
	    	<table border="1">
            <tr>
                <th>Last Name</th>
                <td><%= lastName %></td>
                <th>Middle Name</th>
                <td><%= middleName %></td>
                <th>First Name</th>
                <td><%= firstName %></td>
            </tr> 

		<tr>
			<th>Country of citizenship</th>
			<td><%=citizenship%></td>
		</tr>
	         <tr>
			<th>Country of residence</th>
			<td><%=residence%></td>
		</tr>
		<tr>
			<th>Location of degree</th>
			<td><%=locationOfDegree%><td>
		</tr>
		<tr>
			<th>University of degree</th>
			<td><%=universityOfDegree%></td>
		</tr>
		<tr>
                        <th>Discipline of degree</th>
			<td><%=disciplineOfDegree%></td>
		</tr>	
		<tr>
			<th>Year</th>
			<td><%=year%></td>
			<th>Month</th>
			<td><%=month%></td>
			<th>GPA</th>
			<td><%=gpa%></td>
			<th>Title</th>
			<td><%=title%><td>
		</tr>
	</table>
		<% if(residence.equals("United States")){%>
	Street address: <%=streetAddress%>
	City: <%=city%>
	Zip Code: <%=zipCode%>
	Area Code: <%=areaCode%>
	<%
	}else{
	%>
	Telephone Number: <%=telephoneNum%>
	<%
	}
	%>
		<%//loop for all degrees
		if (degree.size() > 0){ %>
		<table border="1">
		<tr>
			<th>Degree ID</th>
			<th>Location of degree</th>
			<th>University of degree</th>
			<th>Discipline of degree</th>
			<th>Year of degree</th>
			<th>Month of degree</th>
			<th>GPA</th>
			<th>Title of degree</th>
		</tr>
		<% for (int i = 0; i < degree.size() - 1; i++){
		%>
	        
		<tr>
			<td><%=i%></td>
			<td><%=degree.get(i).getLocation()%></td>
			<td><%=degree.get(i).getUniversity()%></td>
			<td><%=degree.get(i).getDiscipline()%></td>
			<td><%=degree.get(i).getYear()%></td>
			<td><%=degree.get(i).getMonth()%></td>
			<td><%=degree.get(i).getGpa()%></td>
			<td><%=degree.get(i).getTitle()%></td>
		</tr>
		
		<% } %>
		</table>
		<% } %>

		<br><br>
	
		<form action="degreeLocation.jsp" method="POST">
		<input type="hidden" name="degreeAction" value="moreDegree"/>
		<INPUT type="SUBMIT" value="More Degree"/> 
		</FORM>

		<form action="specialization.jsp" method="POST">
		<input type="hidden" name="degreeAction" value="specialization"/>
		<INPUT type="SUBMIT" value="Specialization"/> 
		</FORM>

		
	</body>
</html>






