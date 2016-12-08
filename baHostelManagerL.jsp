<%-- 
    Document   : hm
    Created on : Sep 24, 2015, 4:19:47 PM
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


        <%
            String rollno = request.getParameter("Rno1");

            try {
                Connection con = DB.getConnection();
                PreparedStatement ps1 = con.prepareStatement("SELECT * from studentdetails where rno=?");
                ps1.setString(1, rollno);
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {

                    PreparedStatement ps2 = con.prepareStatement("SELECT * from studentstay where rno=?");
                    ps2.setString(1, rollno);
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {

                        PreparedStatement ps = con.prepareStatement("select rno,hostelname,floorno,bedno from studentstay where rno=?");
                        ps.setString(1, rollno);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
        %>
        <form id="formEntry1">
            <table id="table1" class="table2">
                <tr class="studentStay" id="roll">
                    <td id="style1">Roll No:</td>
                    <td class="style1"><input type="text" name="rno" value="<%=rs.getString(1)%>" disabled></td>
                </tr>
                <tr class="studentStay" id="roll"> 
                    <td id ="style1">Hostel Name:</td>
                    <td class="style1"><input type="text"name ="hname" value="<%=rs.getString(2)%>" disabled/></td> 
                </tr>
                <tr class="studentStay" id="roll">
                    <td id="style1"> Floor No: </td>
                    <td class="style1"><input  type="text" name="fno" value="<%=rs.getString(3)%>" disabled/></td>
                </tr>
                <tr class="studentStay" id="roll">
                    <td id ="style1"> Bed No: </td>
                    <td class="style1"><input type="text" name="bno" value="<%=rs.getString(4)%>" disabled/> </td>
                </tr>
            </table>
        </form>

        <%          }

        else {

        %>
        <script>
            alert("Student doesn't have a bed. ALLOT.");
            window.location.href = "baHostelManager.jsp";
        </script>
        <%            }

        } else {
        %>
        <script>
            alert("Student Details with the Roll No. don't exist.Insert Student deatils.");
            window.location.href = "baHostelManager.jsp";
        </script>
        <%
                }
                }

                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>                



    </div>  
</body>
</html>
