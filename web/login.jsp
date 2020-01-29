<%-- 
    Document   : login
    Created on : Jan 29, 2020, 4:28:22 PM
    Author     : Manula Uluwatta
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "");
                PreparedStatement pst = con.prepareStatement("Select * from user where email = ? and password = ? ");
                pst.setString(1, email);
                pst.setString(2, password);
                boolean b=false;
                String userType=null;
                ResultSet rst = pst.executeQuery();
//                while(rst.next()){
//                    userType=rst.getString("userType");
//                    b=true;
//                }
//                
//                if(b){
//                    if(userType.equals("admin")){
//                        RequestDispatcher req = request.getRequestDispatcher("index.html");
//                        req.forward(request, response);
//                    }else if(userType.equals("participant")){
//                        
//                        RequestDispatcher req = request.getRequestDispatcher("register.html");
//                        req.forward(request, response);
//                    }
//                }else {
//                    response.sendRedirect("register.html");
//                    out.println("Invalid password <a href='login.jsp'>try again</a>");
//                }
                if(rst != null){
                    response.sendRedirect("index.html");
                }
        
        %>
    </body>
</html>
