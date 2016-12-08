<%-- 
    Document   : index
    Created on : 10-Aug-2015, 18:02:30
    Author     : tejaswy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clerk Functions</title>
        <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/feedetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/billdetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/StudentDetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/payclerk.js" type="text/javascript"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#date").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2050'
                });
                $("#paydate").datepicker({
                    changeMonth: true,
                    changeYear: true
                });
                $("#StudentRegistration").hide();
                $("#BillDetails").hide();
                $("#FeeDetails").hide();
                $("#StudentRegistrationL").click(function () {
                    $("#StudentRegistration").show();
                    $("#BillDetails").hide();
                    $("#FeeDetails").hide();
                });
                $("#BillDetailsL").click(function () {
                    $("#StudentRegistration").hide();
                    $("#BillDetails").show();
                    $("#FeeDetails").hide();
                });
                $("#FeeDetailsL").click(function () {
                    $("#StudentRegistration").hide();
                    $("#BillDetails").hide();
                    $("#FeeDetails").show();
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
                        <li><a href="PaymentLogin.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Payment Login</a></li>
                        <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Clerk</h1>
            </div>

        </div>
        <nav class="main-nav">
            <ul class="nav-list">
                <li><a href="#" id="StudentRegistrationL">Student Details</a></li>
                <li><a href="#" id="BillDetailsL">Bill Details</a></li>
                <li><a href="#" id="FeeDetailsL">Fee Details</a></li>

            </ul>

        </nav>
        <br /> 
        <br />

        <div id="content">
            <form action="StudentDB.jsp" method="post" name="student">
                <div id="StudentRegistration">
                    <table id="table1">                        

                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="Rno" /></td>

                            <td id="style1">Name Of The Student :</td>
                            <td class="style1"><input type="text" name="Name" /></td>
                        </tr>
                        <tr>

                        <tr>
                            <td  id="style1">Address :</td>
                            <td><textarea  name="Address"></textarea>
                            </td>

                            <td id="style1">Student's Phone No :</td>
                            <td><input type="text" name="Phno" /></td>
                        </tr>

                        <tr>

                            <td id="style1">Father's Name :</td>
                            <td><input type="text" name="fName" /></td>


                            <td id="style1">Employment Details :</td>
                            <td><input type="text" name="Emp" /></td>
                        </tr>

                        <tr>
                            <td id="style1">Father's Phone No :</td>
                            <td><input type="text" name="fPhno" /></td>


                            <td id="style1">Annual Income :</td>
                            <td><input type="text" name="Income" /></td>
                        </tr>

                        <tr>
                            <td id="style1">Admission Test :</td>
                            <td>
                                <select name="adm">
                                    <option selected disabled>--Select Year--</option>
                                    <option value="EAMCET">EAMCET</option>
                                    <option value="ECET">ECET</option>
                                    <option value="PGCET">PGCET</option>
                                    <option value="ICEP">ICEP</option>
                                    <option value="GATE">GATE</option>
                                </select>

                            </td>

                            <td id="style1">Rank Obtained :</td>
                            <td><input type="text" name="Rank" /></td>
                        </tr>

                        <tr>
                            <td id="style1">State :</td>
                            <td><input type="text" name="State" /></td>

                            <td id="style1">Country :</td>
                            <td><input type="text" name="Country" />
                            </td>
                        </tr>

                        <tr>
                            <td id="style1">Category :</td>
                            <td>
                                <input type="radio" name="Category" value="OC" >OC
                                <input type="radio" name="Category" value="BC">BC
                                <input type="radio" name="Category" value="SC">SC
                                <input type="radio" name="Category" value="ST">ST

                            </td>
                            <td id="style1">Gender :</td>
                            <td>
                                <input type="radio" name="Gender" value="Male">Male
                                <input type="radio" name="Gender" value="Female">Female

                            </td>
                        </tr>

                        <tr>

                        <tr>
                            <td id="style1">Date of Birth :</td>
                            <td>
                                <input type="text"  name="date" id="date">

                            </td>

                        </tr> 
                        <tr>

                            <td id="style1">Married :</td>
                            <td>
                                <input type="radio" name="Marital Status" value="YES">YES
                                <input type="radio" name="Marital Status" value="NO">NO

                            </td>
                        </tr>

                        <tr>
                            <td id="style1">Student's Aadhar  No :</td>
                            <td><input type="text" name="Aadhar" /></td>
                        </tr>

                        <tr>
                            <td id="style1">Father's Aadhar No :</td>
                            <td><input type="text" name="fAadhar" /></td>
                        </tr>
                        <tr>
                            <td>
                            </td>

                            <td><input type="submit" name="b1clerk" class="styled-button-1" value="Insert" onclick="return payclerk(this)"  /> 
                                <!--<input type="submit" class="styled-button-1" value="Update" />--> 
                                <input type="submit" name="b1clerk" class="styled-button-1" value="Retrieve" /> 
                            </td>


                        </tr>

                    </table> 
                </div>

            </form>
            <form action="clerkDB.jsp" method="post" name="bill">
                <div id="BillDetails">
                    <table id="table1">
                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="rno" /></td>

                            <td id="style1">Account No :</td>
                            <td class="style1"><input type="text" name="accno" /></td>
                        </tr>
                        <tr>

                        <tr>
                            <td id="style1">Date :</td>
                            <td><input type="text" name="date" id="paydate"/></td>

                            <td id="style1">Amount :</td>
                            <td><input type="text" name="amt" /></td>
                        </tr>

                        <tr>

                            <td id="style1">Challon No :</td>
                            <td><input type="text" name="cno" /></td>



                        </tr>
                        <tr>
                            <td>
                            </td>

                            <td><input type="submit" class="styled-button-1" name="bclerk" value="Insert" onclick="return payclerk1(this)"/> 
                                <!--<input type="submit" class="styled-button-1" name="bclerk" value="Update" />--> 
                                <input type="submit" class="styled-button-1" name="bclerk" value="Retrieve" /> 
                            </td>


                        </tr>
                    </table>
                </div>
            </form>


            <form action="FeeDB.jsp" method="post" name="fee">
                <div id="FeeDetails">
                    <table id="table1">
                        <tr>
                            <td id="style1">Roll No :</td>
                            <td class="style1"><input type="text" name="rno1" /></td>

                            <td  id="style1">Account No :</td>
                            <td><input type="text"  name="accno">
                            </td>
                        </tr>
                        <tr>

                            <td id="style1">Month :</td>
                            <td><select id="mselection" name="select">
                                    <option selected disabled>--Select Month--</option>
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


                            <td id="style1">Year :</td>
                            <td><select id="mselection" name="select1">
                                    <option selected disabled>--Select Year--</option>
                                    <option value="2012" >2012</option>
                                    <option value="2013" >2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td id="style1">Monthly Bill :</td>
                            <td class="style1"><input type="text" name="mbill" /></td>


                            <td id="style1">Establishment Rate :</td>
                            <td><input type="text" name="esst" /></td>
                        </tr>

                        <tr>

                            <td id="style1">Room Rent :</td>
                            <td><input type="text" name="Rrent" /></td>


                            <td id="style1">Water/Electricity charges :</td>
                            <td><input type="text" name="wecharges" /></td>
                        </tr>

                        <tr>
                            <td id="style1">Food Type :</td>
                            <td>
                                <input type="radio" name="ftype" value="Veg">Veg
                                <input type="radio" name="ftype" value="Non-Veg">Non-Veg
                            </td>



                        </tr>

                        <tr>
                            <td>
                            </td>

                            <td><input type="submit" class="styled-button-1" name="b2clerk" value="Insert" onclick="return payclerk2(this)"/> 
                                <!--<input type="submit" class="styled-button-1" value="Update" />--> 
                                <input type="submit" class="styled-button-1" name="b2clerk" value="Retrieve" /> 
                            </td>


                        </tr>

                    </table> 
                </div>
            </form>


        </div>

    </body>
</html>
