<%@page import="support.*, java.util.*, degree.*" %>
<html>
	<head><title>Degree university</title></head>

	<% //retrieve information from degree and session
	Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
	String locationOfDegree = request.getParameter("locationOfDegree");
	session.setAttribute("locationOfDegree", locationOfDegree);
	//out.println(degree.size());
	degree.get(degree.size() - 1).setLocation(locationOfDegree);
	//out.println(degree.get(degree.size() - 1).getLocation());

	String citizenship = session.getAttribute("citizenship").toString();
	String residence = session.getAttribute("residence").toString();
	String firstName = session.getAttribute("firstName").toString();
        String middleName = session.getAttribute("middleName").toString();
	String lastName = session.getAttribute("lastName").toString();
	
	String streetAddress = session.getAttribute("street address").toString();
	String zipCode = session.getAttribute("zip code").toString();
	String areaCode = session.getAttribute("area code").toString();
	String city = session.getAttribute("city").toString();
	String telephoneNum = session.getAttribute("country telephone code").toString();
	%>
        
          <%
    if(lastName.equals("")){
    lastName = "empty";
    }
    if(firstName.equals("")){
    firstName = "empty";
    }
    if(middleName.equals("")){
    middleName = "empty";
    }
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
			 <td><%=residence%><td>
		 </tr>
		<tr>
			<th>Location of degree</th>
			<td><%=locationOfDegree%></td>
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
		<%
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

		<br>
		
	
		<%
		support s = new support();
		String pathUniversity = config.getServletContext().getRealPath("universities.txt");
		Vector universities = s.getUniversities(pathUniversity);

		for (int i = 0; i < universities.size(); i++){
		Vector tuple = (Vector)universities.get(i);
		String state = (String)tuple.get(0);
		Vector university = (Vector)tuple.get(1);
		if (state.equals(locationOfDegree)){
		%>
		<table border="1">
		<%
		for (int j = 0; j < university.size(); j+=3){ %>
			<tr>
				<td><a href="degreeDiscipline.jsp?universityOfDegree=<%=university.get(j) %>"><%=university.get(j) %></a>
				<% if (j + 1 < university.size()){ %>
				<td><a href="degreeDiscipline.jsp?universityOfDegree=<%=university.get(j + 1) %>"><%=university.get(j + 1) %></a>
				<% } %>
				<% if (j + 2 < university.size()){ %>
				<td><a href="degreeDiscipline.jsp?universityOfDegree=<%=university.get(j + 2) %>"><%=university.get(j + 2) %></a>
				<% } %>
			</tr>
		<% } %>
		<% } %>
		<% } %>
		</table>
		<table>
			<tr><form action="degreeDiscipline.jsp" method="GET">
				<th>Please specify your university if it is not shown above: </th>
				<td><input name="universityOfDegree" value=""/></td>
				<td><input type="SUBMIT" value="Submit university"/></td>
			</form></tr>
		</table>
	</body>
</html>




