<%-- 
    Document   : StudenUpdate
    Created on : 15-Sep-2015, 23:28:52
    Author     :  tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clerk Functions</title>
        <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/billdetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/payclerk.js" type="text/javascript"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#paydate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2050'
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
                        <li><a href="clerk.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Clerk</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Clerk</h1>
            </div>

        </div>
        <nav class="main-nav" style="text-align: center; padding-top: 5px; color: #B0EBAD; font-size: 20px;">

            Update Student Details 
        </nav>
        <br /> 
        <br />
        <%
            try {
                String rno = request.getParameter("studentupdate");
                String rno1 = "";
                String name = "";
                String address = "";
                String sphno = "";
                String fname = "";
                String empdetails = "";
                String fphno = "";
                String aincome = "";
                String admtest = "";
                String rank = "";
                String state = "";
                String country = "";
                String category = "";
                String dob = "";
                String mstatus = "";
                String saadhar = "";
                String faadhar = "";
                String gender = "";
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from studentdetails where rno=?");
                ps.setString(1, rno);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    rno1 = String.valueOf(rs.getString(1));
                    name = String.valueOf(rs.getString(2));
                    address = String.valueOf(rs.getString(3));
                    sphno = String.valueOf(rs.getString(4));
                    fname = String.valueOf(rs.getString(5));
                    empdetails = String.valueOf(rs.getString(6));
                    fphno = String.valueOf(rs.getString(7));
                    aincome = String.valueOf(rs.getString(8));
                    admtest = String.valueOf(rs.getString(9));
                    rank = String.valueOf(rs.getString(10));
                    state = String.valueOf(rs.getString(11));
                    country = String.valueOf(rs.getString(12));
                    category = String.valueOf(rs.getString(13));
                    dob = String.valueOf(rs.getString(14));
                    mstatus = String.valueOf(rs.getString(15));
                    saadhar = String.valueOf(rs.getString(16));
                    faadhar = String.valueOf(rs.getString(17));
                    gender = String.valueOf(rs.getString(18));

                }


        %>

        <div id="content">
            <form action="StudentUpdateDB.jsp" name="student1" onclick="return payclerk(this)" method="post">
                <div id="StudentRegistration">
                    <table id="table1">                        

                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="Rno" value="<%=rno1%>" readonly/></td>

                            <td id="style1">Name Of The Student :</td>
                            <td class="style1"><input type="text" name="Name" value="<%=name%> " /></td>
                        </tr>
                        <tr>

                        <tr>
                            <td  id="style1">Address :</td>
                            <td><textarea  name="Address" ><%=address%></textarea>
                            </td>

                            <td id="style1">Student's Phone No :</td>
                            <td><input type="text" name="Phno" value="<%=sphno%> " /></td>
                        </tr>

                        <tr>

                            <td id="style1">Father's Name :</td>
                            <td><input type="text" name="fName" value="<%=fname%> " /></td>


                            <td id="style1">Employement Details :</td>
                            <td><input type="text" name="Emp" value="<%=empdetails%> " /></td>
                        </tr>

                        <tr>
                            <td id="style1">Father's Phone No :</td>
                            <td><input type="text" name="fPhno" value="<%=fphno%>"/></td>


                            <td id="style1">Annual Income :</td>
                            <td><input type="text" name="Income" value="<%=aincome%> " /></td>
                        </tr>

                        <tr>
                            <td id="style1">Admission Test :</td>
                            <td>
                                <select name="adm" selected="<%=admtest%>">
                                    <option value="<%=admtest%>" <%= (admtest.equals("EAMCET") ? "selected='selected'" : "")%>>EAMCET</option>
                                    <option value="<%=admtest%>" <%= (admtest.equals("ECET") ? "selected='selected'" : "")%>>ECET</option>
                                    <option value="<%=admtest%>" <%= (admtest.equals("PGCET") ? "selected='selected'" : "")%>>PGCET</option>
                                    <option value="<%=admtest%>" <%= (admtest.equals("ICEP") ? "selected='selected'" : "")%>>ICEP</option>
                                    <option value="<%=admtest%>" <%= (admtest.equals("GATE") ? "selected='selected'" : "")%>>GATE</option>
                                </select>

                            </td>

                            <td id="style1">Rank Obtained :</td>
                            <td><input type="text" name="Rank" value="<%=rank%> "  /></td>
                        </tr>

                        <tr>
                            <td id="style1">State :</td>
                            <td><input type="text" name="State" value="<%=state%> "  /></td>

                            <td id="style1">Country :</td>
                            <td><input type="text" name="Country" value="<%=country%> " />
                            </td>
                        </tr>

                        <tr>
                            <td id="style1">Category :</td>
                            <td>
                                <input type="radio" name="Category" value="<%=category%>" <%= (category.equals("OC") ? "checked='checked'" : "")%>>OC
                                <input type="radio" name="Category" value="<%=category%>" <%= (category.equals("BC") ? "checked='checked'" : "")%>>BC
                                <input type="radio" name="Category" value="<%=category%>" <%= (category.equals("SC") ? "checked='checked'" : "")%>>SC
                                <input type="radio" name="Category" value="<%=category%>" <%= (category.equals("ST") ? "checked='checked'" : "")%>>ST

                            </td>

                            <td id="style1">Gender :</td>
                            <td>
                                <input type="radio" name="Gender" value="<%=gender%>" <%= (gender.equals("Male") ? "checked='checked'" : "")%>Male
                                       <input type="radio" name="Gender" value="<%=gender%>" <%= (gender.equals("Female") ? "checked='checked'" : "")%>>Female

                            </td>
                        </tr>

                        <tr>

                        <tr>
                            <td id="style1">Date of Birth :</td>
                            <td>
                                <input type="text"  name="date" id="date" value="<%=dob%> " >

                            </td>

                        </tr> 
                        <tr>

                            <td id="style1">Married :</td>
                            <td>
                                <input type="radio" name="Marital Status" value="<%=mstatus%>" <%= (mstatus.equals("YES") ? "checked='checked'" : "")%>>YES
                                <input type="radio" name="Marital Status" value="<%=mstatus%>" <%= (mstatus.equals("NO") ? "checked='checked'" : "")%>>NO

                            </td>
                        </tr>

                        <tr>
                            <td id="style1">Student's Aadhar  No :</td>
                            <td><input type="text" name="Aadhar" value="<%=saadhar%> "  /></td>
                        </tr>

                        <tr>
                            <td id="style1">Father's Aadhar No :</td>
                            <td><input type="text" name="fAadhar" value="<%=faadhar%> "  /></td>
                        </tr>
                        <tr>
                            <td>
                            </td>

                            <td>
                                <input type="submit" class="styled-button-1" name="b1clerk" value="Update" /> 
                            </td>


                        </tr>

                    </table> 
                </div>

            </form>
            <%                con.close();
                } catch (Exception e) {
                    out.println(e);
                }
            %>

    </body>
</html>
