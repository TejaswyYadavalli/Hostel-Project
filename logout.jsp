<%-- 
    Document   : logout
    Created on : 19 Sep, 2015, 12:36:14 AM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>

    </head>
    <script>


        <%
            session.setAttribute("unameb", null);
            session.setAttribute("unamep", null);
            session.setAttribute("passb", null);
            session.setAttribute("passp", null);
            session.setAttribute("htnob", null);
            session.invalidate();
        %>
       
       
        window.location.href = "index.jsp";





    </script>


</html>
