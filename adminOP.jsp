<%-- 
    Document   : om
    Created on : Oct 14, 2015, 1:19:30 PM
    Author     : Tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Operations Functions</title>
        <link href="css/admin_style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/adminOP.js" type="text/javascript"></script>
    </head>
    <script>
        $(document).ready(function () {
            $("#AddStaff").hide();
            $("#RemoveStaff").hide();
            $("#AddL").click(function () {
                $("#AddStaff").show();
                $("#RemoveStaff").hide();
            });

            $("#RemoveL").click(function () {
                $("#AddStaff").hide();
                $("#RemoveStaff").show();
            });

        });

    </script>
    <body> 
        <%
//        try {
//            response.setHeader("Cache-Control", "no-cache");
//            response.setHeader("Cache-Control", "no-store");
//            response.setHeader("Pragma", "no-cache");
//            response.setDateHeader("Expires", 0);
//            if (session.getAttribute("") == null) {
//                response.sendRedirect("");
//            } else {
//            }
//        } catch (Exception ex) {
//            out.println(ex);
//        }
%>
        <div id="header">
            <nav class="nav">
                <div id="menu-list">
                    <ul class="list"> 
                        <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Administrator</h1>
            </div>

        </div>
        <nav class="main-nav">
            <ul class="nav-list">
                <li><a href="#" id="AddL">Add Staff</a></li>
                <li><a href="#" id="RemoveL">Remove Staff</a></li>
            </ul>
        </nav>
        <br /> 
        <br />
        <div id="content">
            <form method="post" name="add" onsubmit="return addstaff();" action="adminOPDB.jsp">
                <div id="AddStaff">
                    <table id="table1"> 
                        <tr> <td id="style1">Staff :</td>
                            <td><select id="user" name="user">
                                    <option selected disabled>--Select Staff--</option>
                                    <option value="Clerk" >Clerk</option>
                                    <option value="HostelManager" >Hostel Manager</option>
                                    <option value="CareTaker">Caretaker</option>
                                    <option value="DeputyWarden">Deputy Warden</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td id="style1">Username :</td>
                            <td><input type="text" name="uname" /></td>
                        </tr>
                        <tr>
                            <td id="style1">Email :</td>
                            <td><input type="text" name="email" /></td>
                        </tr>
                        <tr>
                            <td id="style1">Password :</td>
                            <td><input type="password" name="pwd" /></td>
                        </tr>
                        <tr>
                            <td id="style1">Re-Enter Password :</td>
                            <td><input type="password" name="rpwd" /></td>
                        </tr>

                        <tr>
                            <td>
                            </td>
                            <td><input type="submit" name="adminop" class="styled-button-1" value="Insert"   /> 
                            </td>
                        </tr>
                    </table> 
                </div>
            </form>
            <form method="post" name="remove" onsubmit="return removestaff();" action="adminOPDB1.jsp">
                <div id="RemoveStaff">
                    <table id="table1">                                           
                        <tr>
                            <td id="style1">Staff:</td>
                            <td><select id="user1" name="user1">
                                    <option selected disabled>--Select Staff--</option>
                                    <option value="Clerk">Clerk</option>
                                    <option value="HostelManager">Hostel Manager</option>
                                    <option value="CareTaker">Caretaker</option>
                                    <option value="DeputyWarden">Deputy Warden</option>
                                </select> </td>
                        </tr>
                        <tr>
                            <td id="style1">Username:</td>
                            <td><input type="text" name="uname1" /></td>
                        </tr>
                        <tr>
                            <td></td>
                        <td><input type="submit" name="adminop" class="styled-button-1" value="Delete" /> 
                        </td>
                        </tr>
                    </table> 
                </div>
            </form>
        </div>
    </body>
</html>
