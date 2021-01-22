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
try{ 
      connection = DriverManager.getConnection(connectionUrl,userid, password); 
      statement=connection.createStatement(); 
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
    <link rel="stylesheet" href="#">
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
    <section class="container">
    <article>
    <div class="row">
        <div class="col-sm-3">
          <div class="card bg-info">
            <div class="card-body">
              <h5 class="card-title">Total categories of items</h5>
              <p class="card-text">
              <%
				String strQuery = "SELECT COUNT(DISTINCT category) FROM itemtable";
				ResultSet rs = statement.executeQuery(strQuery);
				String Countrow="";
				while(rs.next()){
				Countrow = rs.getString(1);
				out.println("Total Categories : " +Countrow);
				}
				%></p>

            </div>
          </div>
        </div>
        <div class="col-sm-3">
            <div class="card bg-info">
              <div class="card-body">
                <h5 class="card-title">Total items in stock</h5>
                <p class="card-text">
                <%
				String str = "SELECT COUNT(*) FROM itemtable";
				ResultSet rs2 = statement.executeQuery(str);
				String Countrow2="";
				while(rs2.next()){
				Countrow2 = rs2.getString(1);
				out.println("Total Items : " +Countrow2);
				}
				%>
				</p>
              </div>
            </div>
          </div>
        <div class="col-sm-3">
          <div class="card bg-info">
            <div class="card-body">
              <h5 class="card-title">Top selling category </h5>
              <p class="card-text">
              <%
				String topCategoryQuery = "SELECT category from itemtable group by category having count(category)=(select max(c) from(select count(category)c,category from itemtable group by category))";
				ResultSet rs4 = statement.executeQuery(topCategoryQuery);
				String topCat="";
				rs4.next();
				topCat= rs4.getString(1);
				out.println("Top Category : " +topCat);
				%>
				</p>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="card bg-info">
            <div class="card-body">
              <h5 class="card-title">Top selling item </h5>
              <p class="card-text">
              <%
				String topItemQuery = "SELECT item from orderstable group by item having count(item)=(select max(cc) from(select count(item) cc,item from orderstable group by item))";
				ResultSet rs3 = statement.executeQuery(topItemQuery);
				String topItem="";
				rs3.next();
				topItem = rs3.getString(1);
				out.println("Top Item : " +topItem); 
				%>
				</p>
            </div>
          </div>
        </div>
      </div>
    </article>
</section>
<section class="container" style="margin-top: 20px;">
    <article>
        <div class="btn-group container" role="group" aria-label="Basic outlined example">
            <a href="addItem.html" type="button" class="btn btn-outline-primary m-5">Add item</a>
            <a href="updateItem.html" type="button" class="btn btn-outline-primary m-5">Update item</a>
            <a href="deleteItem.jsp" type="button" class="btn btn-outline-primary m-5">Delete item</a>
          </div>
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
      String sql="select * from itemtable order by name"; 
      resultSet = statement.executeQuery(sql);
      while(resultSet.next()){ 
      %>
      <tr>
        <td><%=resultSet.getString(1) %></td>
        <td><%=resultSet.getString(2) %></td>
        <td><%=resultSet.getString(3) %></td>
        <td><%=resultSet.getString(4) %></td>
        <td><%=resultSet.getString(5) %></td>
        <td><%=resultSet.getString(6) %></td>
      </tr>
<% 
}
%>   
                     
                    </tbody>
              </table>
        </div>
    </article>
</section>
<section>
    <article>
        <div class="container">Orders table</div>
        <div class="container">
            <table class="table table-hover " style="border: 2px solid grey;">
                    <thead>
                      <tr>
                        <th scope="col">Item</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Status</th>
                        <th scope="col">Update Status</th>
                      </tr>
                    </thead>
                    <tbody>
	 <% 
	String sql2="select * from orderstable order by quantity desc"; 
      	resultSet2 = statement.executeQuery(sql2);
      while(resultSet2.next()){ 
      %>
      <tr>
        <td><%=resultSet2.getString(1) %></td>
        <td><%=resultSet2.getString(2) %></td>
        <td><%=resultSet2.getString(3) %></td>
        <td><%=resultSet2.getString(4) %></td>
        <td><%=resultSet2.getString(5) %></td>
        <td><%=resultSet2.getString(6) %></td>
        <td><a class="btn btn-info" href="updateStatus.jsp">Update</a></td>
      </tr>
						
                      
                    </tbody>
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
