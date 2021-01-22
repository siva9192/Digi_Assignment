<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        
<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit()
    {
        try
        {   
           
            //loading the driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //establish the connection
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "digi", "digi");
            //create statement object
            ps1 = con.prepareStatement("select count(*) from signup where username = ? and password=?");
            ps2 = con.prepareStatement("select * from signup");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
    String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString("username")+"</td>");
            out.println("<td>"+rs.getString("password")+"</td");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {
        //write jdbc code for authentication
        String user = request.getParameter("email");
        String pass = request.getParameter("password");
        //set form data as param value
        ps1.setString(1,user);
        ps1.setString(2,pass);
        //excute the query
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0)
            out.println("<b><i><font color=red>Invalid credential............<br>Please Enter correct information <br><a href='customerSignin.html'>Click Here to login again</a> </font></i></b>");
        else
        {          
            response.sendRedirect("orders.jsp");
        }
        }
    

%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
