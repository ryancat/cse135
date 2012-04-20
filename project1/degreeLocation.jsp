<%@page import="support.*, java.util.*, degree.*" %>
<html>
	<head><title>Degree location</title></head>

	<%//if this is the first time we have a degree then creat one in session
	if (session.getAttribute("degree") == null){
	session.setAttribute("degree", new Vector<Degree>());
	}

	Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
	String degreeAction = request.getParameter("degreeAction");
	String citizenship = session.getAttribute("citizenship").toString();
	String residence = session.getAttribute("residence").toString();
  	String firstName = session.getAttribute("firstName").toString();
   	String middleName = session.getAttribute("middleName").toString();
	String lastName = session.getAttribute("lastName").toString();

	//if it is the first time input a degree.
        if(degree.size()<1){
	String streetAddress = request.getParameter("street address");
	session.setAttribute("street address", streetAddress);
	String city = request.getParameter("city");
	session.setAttribute("city", city);
	String zipCode = request.getParameter("zip code");
	session.setAttribute("zip code", zipCode);
	String areaCode = request.getParameter("area code");
	session.setAttribute("area code", areaCode);
	String telephoneNum = request.getParameter("country telephone code");
	session.setAttribute("country telephone code", telephoneNum);
	}


	if (degree.size() == 0 || (degreeAction != null && degreeAction.equals("moreDegree"))){
	Degree newDegree = new Degree();
	degree.addElement(newDegree);
	}
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
		<td><%=residence%></td>
	<tr>
	</table>
	<% if(residence.equals("United States")){%>
		Street Address: <%=session.getAttribute("street address").toString()%><br>
		City: <%=session.getAttribute("city").toString()%><br>
		Zip Code: <%=session.getAttribute("zip code").toString()%> <br>
		Area Code: <%=session.getAttribute("area code").toString()%> <br>
	        <%	}
		else{%>
		Telephone Number: <%=session.getAttribute("country telephone code").toString()%><br>
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
		<%
		support s = new support();
		String pathUniversity = config.getServletContext().getRealPath("universities.txt");
		Vector universities = s.getUniversities(pathUniversity);
		Vector<String> locationOfDegree = new Vector<String>();

		for (int i = 0; i < universities.size(); i++){
			Vector tuple = (Vector)universities.get(i);
			String state = (String)tuple.get(0);
			locationOfDegree.addElement(new String(state));
		}
		%>
	

				<%-- //previous stuff --%>
		Location of your degree?
		<table border="1">
				<% for (int i = 0; i < locationOfDegree.size(); i += 3){ %>
				<tr>
				<td><a href="degreeUniversity.jsp?locationOfDegree=<%=locationOfDegree.get(i) %>"><%=locationOfDegree.get(i) %></a>
				<% if (i + 1 < locationOfDegree.size()){ %>
				<td><a href="degreeUniversity.jsp?locationOfDegree=<%=locationOfDegree.get(i + 1) %>"><%=locationOfDegree.get(i + 1) %></a>
				<% } %>
				<% if (i + 2 < locationOfDegree.size()){ %>
				<td><a href="degreeUniversity.jsp?locationOfDegree=<%=locationOfDegree.get(i + 2) %>"><%=locationOfDegree.get(i + 2) %></a>
				<% } %>
				</tr>
				<% } %>
		</table>
		
	

	</body>
</html>

