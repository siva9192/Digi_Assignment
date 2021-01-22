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
ResultSet resultSet2=null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Card</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- Fonts  -->
    <link rel="./font/fontawesome-free-5.12.1-web/css/all.min.css">
    <!-- Extrnal Css -->
    <link rel="stylesheet" href="./CSS/index.css">
    <style>
        article{
            margin: 0px 8px 0px 8px;
        }
        th,td{
            border: 1px solid grey;
        }
    </style>
</head>
<body>
  <section id="nav">
    <article>
      <nav class="navbar navbar-light">
        <!-- Navbar content -->
        <!-- left side -->
        <div class="leftnav">Digi Foundary</div>
        <!-- Right side -->

      </nav>
    </article>
  </section>
<section>
    <article>
        <div class="container">Items table</div>
        <div class="container">
            <table class="table table-hover " style="border: 2px solid grey;">
                    <thead>
                      <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Available Quantity</th>
                        <th scope="col">Place Order</th>

                      </tr>
                    </thead>
                    <tbody>
	<% 
      try{ 
      connection = DriverManager.getConnection(connectionUrl,userid, password); 
      statement=connection.createStatement(); 
      String sql="select * from itemtable"; 
      resultSet = statement.executeQuery(sql);
      while(resultSet.next()){ 
      %>
      <tr>
        <td><%=resultSet.getString(1) %></td>
        <td><%=resultSet.getString(2) %></td>
        <td><%=resultSet.getString(3) %></td>
        <td><%=resultSet.getString(4) %></td>
        <td><%=resultSet.getString(5) %></td>
        <td><a href="placeOrder.html" class="btn btn-success">Place Order</a></td>
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
        </div>
    </article>
</section>
</body>
</html>
