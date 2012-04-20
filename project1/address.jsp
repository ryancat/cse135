<%@page import="java.util.*, support.*" %>
<html>

<% //obtain user information
  String firstName = session.getAttribute("firstName").toString();
  String middleName = session.getAttribute("middleName").toString();
  String lastName = session.getAttribute("lastName").toString();
  String citizenship = session.getAttribute("citizenship").toString();
  String residence = request.getParameter("residence");

  session.setAttribute("residence", residence);
 
  
  %>

   First Name: <%= firstName%><br>
   Middle Name: <%= middleName%><br>
   Last Name: <%= lastName%><br>
   Citizenship: <%= citizenship%><br>
   Residence: <%= residence%><p>
	<%// if user comes from USA then ask for the US address%>
  
<%if(residence.equals("United States")){%>
      
   <form method ="GET" action="degreeLocation.jsp">
    Street Address: <input type="text" name="street address" maxlength="30"/><br>
    City: <input type="text" name="city" maxlength="20"/><br>
    Zip Code: <input type="text" name="zip code" maxlength="5"/><br>
    Area Code: <input type="text" name="area code" maxlength="5"/><br>
    <input type = "hidden" value = "empty" name = "country telephone code"/>
    <input type="submit" value="Submit"/><br>

<% // if user comes from other countries then only ask for the telephone number.
}else{
%>  
<form method ="GET" action="degreeLocation.jsp">
	<%=residence%> telephone code <input type="text" name="country telephone code" maxlength="10"/><br>
	<input type = "hidden" value = "empty" name = "street address"/>
	<input type = "hidden" value = "empty" name = "city"/>
	<input type = "hidden" value = "empty" name = "zip code"/>
	<input type = "hidden" value = "empty" name = "area code"/>
<input type="submit" value="Submit"/><br>
<%
}
%>
</html>
