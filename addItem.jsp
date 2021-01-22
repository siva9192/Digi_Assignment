<%@ page import ="java.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
<%
    try{
    String name=request.getParameter("name");
    String desc = request.getParameter("description");    
    String category= request.getParameter("category");
    String price= request.getParameter("price");
    String avlqty = request.getParameter("avlqty");
    String placeorder = request.getParameter("placeorder");   
           Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","digi","digi");
            Statement statement = connection.createStatement();
    int i = statement.executeUpdate("insert into itemtable values('" + name + "','" + desc + "','" +category+ "','" +price+ "','" +avlqty+ "','" +placeorder+ "')");
    
    if (i > 0) {
       //out.print("Item Added Successfull!"+"<a href='card.jsp'>Click here back</a>");
       response.sendRedirect("card.jsp");
    }
    else if(i<0){
    out.print("Failed!"+"<a href='card.jsp'>Go to back</a>");
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
