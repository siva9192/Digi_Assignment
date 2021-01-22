
<%@ page import ="java.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <!DOCTYPE html>
    <html>
<head>
    <title>Update status</title>
</head>
<body>
    <form action="updateStatus.jsp">

       <div>
            <input type="text" name="name" placeholder="Item" required>
        </div><br />
        <div>
            <input type="text" name="email" placeholder="Email" required>
        </div><br />
        <div>
			<input type="text" name="totalamt" Placeholder="Total Amount" required>
        </div><br />
        <div>
			<input type="text" name="status" placeholder="Status" required>
        </div><br />
            
        <div>
            <input type="submit" name="" value="Update">
        </div>
            
    </form>

<%
    try{
	String name=request.getParameter("name");
    String email=request.getParameter("email");
    String totalamt=request.getParameter("totalamt");
    String status=request.getParameter("status");
           
           Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","digi","digi");
            Statement statement = connection.createStatement();
    int i = statement.executeUpdate("UPDATE orderstable SET total_amount='"+totalamt+"',status='"+status+"'WHERE email='"+email+"'AND item='"+name+"'");
    
    if (i > 0) {
       out.print("Update Successfull!......"+"<a href='card.jsp'>Click here back</a>");
    }
    else{
    out.print("Update Failed!...Delete Agin"+"<a href='card.jsp'>Go to back</a>");
} 

 
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }

%>
</body>
</html>
