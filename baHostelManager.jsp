<%-- 
    Document   : caretaker
    Created on : Aug 12, 2015, 2:04:58 PM
    Author     : tejaswy
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBConnection.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hostel Manager</title>
        <link href="css/baHostelManager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bedHManagerValidate.js" type="text/javascript"></script>
     
    </head>
  
    <body>
        <%
            try {
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                if (session.getAttribute("unamep") == null) {
                    response.sendRedirect("index.jsp");
                } else {
                }
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
          <div id="header">
                <nav class="nav">
                    <div id="menu-list">
                        <ul class="list">

                            <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>
                            <li><a href="bedAllotmentLogin.jsp" id="bedAllotmentLoginL" target="_self" class="fa w3-left">Bed Allotment</a></li>
                            <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                            <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                        </ul>
                    </div>
                </nav>

                <div id="title">
                    <H1>Student Stay Details</h1>
                </div>
            </div>
            <div id="menu">
                <div id="left">

                </div>
            </div>
            <div id="content">
                <form id="formEntry" name="hManager" method="post" onSubmit="return bedHManager(this);" action="baHostelManagerL.jsp">
                    <table id ="table1" class="table">

                        <tr id="gorollno">
                            <td id="style1">
                                Roll No :
                            </td>
                            <td class="style1"><input type="text" name="Rno1" ></td>

                            <td>  
                                <input type="submit" name="go" id ="go" class="styled-button-1" value="GO">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
    </body>
</html>
