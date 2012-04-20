<%@page import="support.*, java.util.*" %>
<html>   
    <head><title>Country of residence</title></head>
    
    <%//retrieve information from session
	String citizenship = request.getParameter("citizenship");
    session.setAttribute("citizenship", citizenship);

    String firstName = session.getAttribute("firstName").toString();
    String middleName = session.getAttribute("middleName").toString();
    String lastName = session.getAttribute("lastName").toString();
	%>
	
	<body>
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
        <%
            support s = new support();
            String pathCountry = config.getServletContext().getRealPath("countries.txt");
            Vector countries = s.getCountries(pathCountry);
         %>
		 <table>
			<tr>
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
			</table>
			</tr>

			<tr>
				<br>
				Country of residence?   
				<a href="address.jsp?residence=<%=citizenship%>">Same with country of citizenship</a>
				<br>
			</tr>

			<tr>
				<table border="1">
					<% for (int i = 0; i < countries.size(); i += 3){ %>
					<tr>
						<td><a href="address.jsp?residence=<%=countries.get(i) %>"><%=countries.get(i) %></a>
						<% if (i + 1 < countries.size()){ %>
						<td><a href="address.jsp?residence=<%=countries.get(i + 1) %>"><%=countries.get(i + 1) %></a>
						<% } %>
						<% if (i + 2 < countries.size()){ %>
						<td><a href="address.jsp?residence=<%=countries.get(i + 2) %>"><%=countries.get(i + 2) %></a>
						<% } %>
					</tr>
					<% } %>
				</table>
			</tr>
		</table>
	</body>
</html>

