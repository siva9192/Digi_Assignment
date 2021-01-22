<%@ page import ="java.sql.*" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
<%
    try{
    
    String username = request.getParameter("email");    
    String password= request.getParameter("password");
    String phone= request.getParameter("phone");   
           Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","digi","digi");
            Statement statement = connection.createStatement();
    //ResultSet rs;
    int i = statement.executeUpdate("insert into signup(username,password,phone) values ('" + username + "','" + password + "','" + phone + "')");
    
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("welcome.jsp");
       out.print("Registration Successfull!"+"<a href='customerSignin.html'>Click here to User Login</a>");
    }
    else if(i<0){
    out.print("Registration Failed!"+"<a href='customerSignup.html'>Go to back</a>");
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
