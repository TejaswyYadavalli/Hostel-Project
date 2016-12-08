<%-- 
    Document   : index
    Created on : 24 Aug, 2015, 2:34:46 AM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deputy Warden Functions</title>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

        <link href="css/ba_deputy1.css" rel="stylesheet" type="text/css"/>
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


        </div>

        <div id="title">
            <H1>Deputy Warden</h1>
        </div>
        <!--             <div id="sub-title">
                        for Room-Bed Allotment</div>
        
                </div>-->
        <nav class="main-nav">
            <ul class="nav-list">
                <li><a href="hostelSelection.jsp">Room-Bed Allotment</a></li>
                <li><a href="baHostelManager.jsp">Student Stay Details</a></li>
            </ul>

        </nav>


        <div id="content">





        </div>


    </body>
</html>