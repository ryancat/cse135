<%@page import="support.*, java.util.*, degree.*" %>
<html>
<%//retrieve information from degree and session
	Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
	String disciplineOfDegree = degree.get(degree.size() - 1).getDiscipline();
	String month = degree.get(degree.size() - 1).getMonth();
	String year = degree.get(degree.size() - 1).getYear();
	String gpa = degree.get(degree.size() - 1).getGpa();
	String title = degree.get(degree.size() - 1).getTitle();
	
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
    if(lastName.equals("")){
    lastName = "";
    }
    if(firstName.equals("")){
    firstName = "";
    }
    if(middleName.equals("")){
    middleName = "";
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
			<td><%=residence%></td>
		</tr>
			<th>Location of degree</th>
			<td><%=locationOfDegree%><td>
			<th>University of degree</th>
			<td><%=universityOfDegree%></td>
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
	<br>
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

		<br><br>
	
<p>
Please choose your specialization <br>
 <%
   support s = new support();
   String pathSpecialization = config.getServletContext().getRealPath("specializations.txt");
   Vector specializations = s.getSpecializations(pathSpecialization);
   %>
<form action="verification.jsp" method="POST">


<select name="specialization">
<% //dropdown menu loop
  for(int i=0;i<specializations.size();i++){
%>
<option value = "<%=specializations.get(i) %>"> <%=specializations.get(i) %></option>
<%
}
%>
</select>
<p>
<input type="submit" value="Submit"/><br>
</form>
</body>
</html>
