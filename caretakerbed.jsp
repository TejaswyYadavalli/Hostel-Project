<%-- 
    Document   : caretaker
    Created on : Aug 12, 2015, 2:04:58 PM
    Author     : tejaswy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/caretakerbed_style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <title>CareTaker</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bedCareTakerValidate.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                $("#occupancy").hide();
                $("#attendance").hide();
                $("#HostelOccupancyL").click(function () {
                    $("#occupancy").show();
                    $("#attendance").hide();
                });
                $("#AttendanceL").click(function () {
                    $("#occupancy").hide();
                    $("#attendance").show();
                });


            });
        </script>
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
                <H1>Caretaker</h1>
            </div>
        </div>
        <div id="menu">
            <nav class="main-nav">
                <ul class="nav-list">
                    <li><a href="#" id="HostelOccupancyL">Occupancy Details</a></li>
                    <li><a href="#" id="AttendanceL">Attendance</a></li>


                </ul>

            </nav>

            <div id="left">

            </div>
        </div>
        <div id="content">
            <form id="formEntry" name="occupancy" action="caretakerbedL.jsp" method="post" onsubmit="return valOccupancy()">

                <div id="occupancy">

                    <table id="table1">
                        <br/>
                        <tr>

                            <td id="style1">Select Hostel:</td>
                            <td>
                                <select id="selection" name="hname">
                                    <option selected disabled value="">--Select Hostel--</option>
                                    <option value="KamalaNehru">Kamala Nehru Hostel</option>
                                    <option value="Saraswathi">Saraswathi Hostel</option>
                                    <option value="Gayathri">Gayathri Hostel</option>
                                    <option value="Godavari">Godavari Hostel</option>
                                    <option value="Krishna">Krishna Hostel</option>
                                    <option value="Manjeera">Manjeera Hostel</option>
                                    <option value="Kinnera">Kinnera Hostel</option>
                                </select>

                            </td>
                            <td><input type="submit" name="go" id="go" class="styled-button-1" value="Go"></td>
                        </tr>
                        <br/>
                    </table>
                </div>
            </form>


            <form id="formEntry" name="attendance" method="POST"  action="attendanceDB.jsp" onsubmit="return attendance(this)">


                <div id="attendance">
                    <table id="table1">
                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1">
                                <input type="text" name="rno" /></td>
                        </tr>

                        <tr>

                            <td id="style1">Month :</td>
                            <td><select id="mselection" name="month">
                                    <option value="jan" >January</option>
                                    <option value="feb" >February</option>
                                    <option value="mar" >March</option>
                                    <option value="apr">April</option>
                                    <option value="may">May</option>
                                    <option value="jun">June</option>
                                    <option value="jul">July</option>
                                    <option value="aug">August</option>
                                    <option value="sep">September</option>
                                    <option value="oct">October</option>
                                    <option value="nov">November</option>
                                    <option value="dec">December</option>
                                </select></td>

                        </tr>
                        <tr>
                            <td id="style1">Year :</td>
                            <td><select id="mselection" name="year">
                                    <option value="2012" >2012</option>
                                    <option value="2013" >2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td id="style1">Days present :</td>
                            <td class="style1">
                                <input type="text" name="pdays" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="caretaker" class="styled-button-1" value="Submit" />
                        </tr>


                    </table>
                </div>
            </form>




        </div>
    </body>
</html>