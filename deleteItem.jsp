<%@ page import ="java.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>

        <!DOCTYPE html>
    <html>
<head>
    <title>Delete status</title>
</head>
<body>
    <form action="deleteItem.jsp">

        <div>
            <label>Enter Item Name</label>
        </div><br>
        <div>
            <input type="text" name="name"required>
        </div>
            
        <div>
            <input type="submit" name="" value="Delete">
        </div>
            
    </form>

<%
    try{
    String name=request.getParameter("name");       
           Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","digi","digi");
            Statement statement = connection.createStatement();
    //ResultSet rs;
    int i = statement.executeUpdate("DELETE FROM itemtable where name='"+name+"'");
    
    if (i > 0) {
       out.print("Delete Successfull!......"+"<a href='card.jsp'>Click here back</a>");
    }
    else{
    out.print("Delete Failed!...Delete Agin"+"<a href='card.jsp'>Go to back</a>");
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
