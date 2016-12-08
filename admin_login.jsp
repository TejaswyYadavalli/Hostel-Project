<%-- 
    Document   : om
    Created on : Oct 14, 2015, 12:18:11 PM
    Author     : tejaswy
--%>

<%@page import="DBConnection.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin_login</title>
    </head>
      <%
        
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
       

        try {
            Connection con = DB.getConnection();

            if (uname.equals("admin")) {

                PreparedStatement ps = con.prepareStatement("select * from users where uname=? and password=?");
                ps.setString(1, uname);
                ps.setString(2, pass);
                
                ResultSet rs = ps.executeQuery();
                int x = 0;
                while (rs.next()) {
                    if (rs.getString(3).equals(uname) && rs.getString(4).equals(pass)) {
                        x = 1;
                    } else {
                        x = 2;
                    }
                }
                if (x == 1) {%>
                    <script>
               window.location.href = "adminOP.jsp";
    </script>
    <%

                } else {
    %>
    <script>
        alert("Inavalid Username or Password.Try Again");
        window.location.href = "index.jsp";
    </script>
    <%
                }
            }
                      

        } catch (Exception ex) {
            out.println(ex);
        }
    %>
   
</html>
