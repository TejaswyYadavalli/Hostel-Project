 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>


    <%
        try {

            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String newpass = request.getParameter("newpassword");
            String confpass = request.getParameter("conpassword");
            PreparedStatement ps = con.prepareStatement("select * from users where password=? and uname =?");
            ps.setString(1, password);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                if (newpass.equals(confpass)) {

                    PreparedStatement ps1 = con.prepareStatement("UPDATE users SET password = ? WHERE uname = ?");
                    ps1.setString(1, newpass);
                    ps1.setString(2, username);

                    ps1.executeUpdate();
    %>
    <script>
        alert("Successfully Updated.");
    </script>
    <% if (username.equalsIgnoreCase("clerk")) {%>
    <script>
        window.location.href = "clerk.jsp";
    </script>

    <%} else if (username.equalsIgnoreCase("hostelmanager")) {%>
    <script>
        window.location.href = "hostelManager.jsp";
    </script>

    <%} else if (username.equalsIgnoreCase("Caretaker")) {%>
    <script>
        window.location.href = "caretakerbed.jsp";
    </script>       
    <%} else if (username.equalsIgnoreCase("deputywarden")) {%>
    <script>
        window.location.href = "ba_deputyWarden.jsp";
    </script>       
    <%} else if (username.equalsIgnoreCase("Hostel Manager")) {%>
    <script>
        window.location.href = "baHostelManager.jsp";
    </script>    
    <%}%>
    <%} else {
    %>
    <script>
        alert("Passwords are not matched");
        window.location.href = "changepassword.jsp";
    </script>
    <%
        }
    %>
    <%} else { %>
    <script>
        alert("Password doesn't exist");
        window.location.href = "changepassword.jsp";
    </script>    

    <%     } %>



    <%

        } catch (Exception e) {
            out.println(e);
        }
    %>  
</html>
