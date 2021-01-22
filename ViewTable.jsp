<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%> 
<%
String driver = "oracle.jdbc.driver.OracleDriver"; 
String connectionUrl ="jdbc:oracle:thin:@localhost:1521:xe"; 
String userid = "digi"; 
String password = "digi"; 
try { 
Class.forName(driver);
 } 
 catch(ClassNotFoundException e) { 
  e.printStackTrace();
 } 
Connection connection =null; 
Statement statement = null; 
ResultSet resultSet = null; 
%>
<!DOCTYPE html>
<html>
  <head>
   <link
      rel="stylesheet"
      href="./css/bootstrap-4.4.1-dist/css/bootstrap.css"
    />
    <style>
      body {
        margin: 0;
        padding: 0;
        background-color: #eee;
      }
      table {
        width: 1200px;
        margin: 0 auto;
        padding: 20px;
      }
    </style>
  </head>
  <body>
    <table class="table table-hover table-dark container" border="1">
      <h1 class="m-5">Citizen Details Database</h1>
      <tr>
        <td>S. No</td>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Gender</td>
        <td>E-Mail</td>
        <td>Password</td>
        <td>Confirm Password</td>  
      </tr>
      <% 
      int i=1; 
      try{ 
      connection = DriverManager.getConnection(connectionUrl,userid, password); 
      statement=connection.createStatement(); 
      String sql="select * from itemtable"; 
      resultSet = statement.executeQuery(sql);
      while(resultSet.next()){ 
      %>
      <tr>
        <td><%=i++ %></td>
        <td><%=resultSet.getString("name") %></td>
        <td><%=resultSet.getString("discription") %></td>
        <td><%=resultSet.getString("category") %></td>
        <td><%=resultSet.getString("price") %></td>
        <td><%=resultSet.getString("available_quantity") %></td>
        <td><%=resultSet.getString("place_order") %></td>
      </tr>
      <% 
    } 
    connection.close(); 
  } 
  catch (Exception e) 
  { 
    e.printStackTrace(); 
  } 
  %>
    </table>
  </body>
</html>
