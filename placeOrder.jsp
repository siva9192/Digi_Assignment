<%@ page import ="java.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
<%
    try{
    String name=request.getParameter("name");
    String email = request.getParameter("email");    
    String address= request.getParameter("address");
    String quantity= request.getParameter("quantity"); 
           Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","digi","digi");
            Statement statement = connection.createStatement();
    int i = statement.executeUpdate("insert into orderstable values('" + name + "','" + email + "','" +address+ "','" +quantity+ "','NA','Order Recieved')");
    
    if (i > 0) {
       out.print("Ordered Successfull!"+"<a href='orders.jsp'>Click here back</a>");
    }
    else if(i<0){
    out.print("Failed!"+"<a href='orders.jsp'>Go to back</a>");
} else {
        response.sendRedirect("index.html");
    }

 
    }
    catch(Exception e)
    {
    System.out.print(e);
    e.printStackTrace();
    }

%>
