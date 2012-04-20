<%@page import="support.*, java.util.*, degree.*" %>
<html>
<%//retrieve information from the degree class and session
Vector<Degree> degree = (Vector<Degree>)session.getAttribute("degree");
String firstName = session.getAttribute("firstName").toString();
String middleName = session.getAttribute("middleName").toString();
String lastName = session.getAttribute("lastName").toString();
String citizenship = session.getAttribute("citizenship").toString();
String residence = session.getAttribute("residence").toString();
if (residence.equals("United States")){
String streetAddress = session.getAttribute("street address").toString();
String city = session.getAttribute("city").toString();
String zipCode = session.getAttribute("zip code").toString();
String areaCode = session.getAttribute("area code").toString();

}
else{
String telephoneNum = session.getAttribute("country telephone code").toString();
}
%>
<body>
   First Name: <%= firstName%><br>
   Middle Name: <%= middleName%><br>
   Last Name: <%= lastName%><br>
   Citizenship: <%= citizenship%><br>
   Residence: <%= residence%><br>

   <%if(residence.equals("United States")){%>
   Street Address: <%=session.getAttribute("street address").toString()%><br>
   City: <%=session.getAttribute("city").toString()%><br>
   Zip Code: <%=session.getAttribute("zip code").toString()%><br>
   Area Code: <%=session.getAttribute("area code").toString()%><p>
   
   <% } else { %>
   Telephone Code: <%=session.getAttribute("country telephone code").toString()%><p>
   <% }%>
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
<% 
for (int i = 0; i < degree.size(); i++){
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
<%
}
%>
</table>
<%
}
%>
</body>
<html>
