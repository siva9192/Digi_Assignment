<%	
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");

	try{

	if(user.equals("admin")&&pass.equals("admin")){
	response.sendRedirect("card.jsp");
	}
	else{
	out.println("Invalid Password <br>");
	out.println("<a href='index.html'>Click here</a> to Go Home ");
	}
	}
	
	catch (Exception e){
  out.print(e);
	}
	
%>
