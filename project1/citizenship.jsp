<%@page import="support.*, java.util.*" %>
<html>   
    <head><title>Country of citizenship</title></head>
    
    <%//get user information
    String lastName = request.getParameter("lastName");
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");

    session.setAttribute("lastName", lastName);
    session.setAttribute("firstName", firstName);
    session.setAttribute("middleName", middleName);
    %>
    <%//set the names empty
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
        <% // obtain countries information from the txt file
            support s = new support();
            String pathCountry = config.getServletContext().getRealPath("countries.txt");
            Vector countries = s.getCountries(pathCountry);
         %>
            <table border="1">
            <tr>
                <th>Last Name</th>
                <td><%= lastName %></td>
                <th>Middle Name</th>
                <td><%= middleName %></td>
                <th>First Name</th>
                <td><%= firstName %></td>
            </tr>
        </table>
        <p>
        <table border="1">
            <% for (int i = 0; i < countries.size(); i += 3){ %>
            <tr>
                <td><a href="residence.jsp?citizenship=<%=countries.get(i) %>"><%=countries.get(i) %></a>
                <% if (i + 1 < countries.size()){ %>
                <td><a href="residence.jsp?citizenship=<%=countries.get(i + 1) %>"><%=countries.get(i + 1) %></a>
                <% } %>
                <% if (i + 2 < countries.size()){ %>
                <td><a href="residence.jsp?citizenship=<%=countries.get(i + 2) %>"><%=countries.get(i + 2) %></a>
                <% } %>
            </tr>
            <% } %>
        </table>
    </body>
</html>
