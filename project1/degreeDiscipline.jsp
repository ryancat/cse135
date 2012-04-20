<%@page import="support.*, java.util.*, degree.*" %>
<html>
	<head><title>Degree discipline</title></head>

	<%//obtain user information
	Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
	String universityOfDegree = request.getParameter("universityOfDegree");
	session.setAttribute("universityOfDegree", universityOfDegree);
	//out.println(degree.size());
	degree.get(degree.size() - 1).setUniversity(universityOfDegree);
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
	 
	String locationOfDegree = degree.get(degree.size() - 1).getLocation();
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
		<tr>
			<th>University of degree</th>
			<td><%=universityOfDegree%></td>
	<tr>
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
		<br><br>
	
			<th>Country of residence</th>
			<td><%=residence%><td>
		</tr>
		<tr>
			<th>Location of degree</th>
			<td><%=locationOfDegree%><td>
		</tr>
		<tr>
			<th>University of degree</th>
			<td><%=universityOfDegree%></td>
		</tr>
		</table>

		<%//get discipline information from the txt file
		support s = new support();
		String pathMajor = config.getServletContext().getRealPath("majors.txt");
		Vector majors = s.getMajors(pathMajor);
		%>
		Discipline information<br>
		<table>
				<form action="moreDegree.jsp" method="POST">
						<tr>Major of degree<br>
							<% for (int i = 0; i < majors.size(); i++){ %>
				<input c="20" type="RADIO" name="disciplineOfDegree" value="<%=majors.get(i)%>"><%=majors.get(i)%><br>
				<% } %></tr>

				<tr><form action="moreDegree.jsp" method="GET">
				<td>Please specify your discipline if it is not shown above: </td>
				<td><input name="disciplineOfDegree" value=""/></td>
		</table>
		<table width="100%">	
				<tr>Month and year the degree was awarded or expected to be awarded: 
					Month <input name="month" value=""/>
					Year  <input name="year" value=""/></tr>

				<tr>GPA: <input name="gpa" value=""/></tr>
				
				<tr>Title of degree:
					<select name="title">
							<option value="BS">BS</option>
							<option value="MS">MS</option>
							<option value="PhD">PhD</option>
					</select>
				</tr>
				<tr><br><br><input type="SUBMIT" value="Submit discipline information"/></tr>
		</table>	


			</form>
	</body>
</html>





