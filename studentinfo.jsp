<%-- 
    Document   : om
    Created on : Oct 6, 2015, 7:56:59 PM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mess Details</title>
        <link href="css/StudentMessDetails_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/studentinfo.js" type="text/javascript"></script>
        <script>

            $(document).ready(function () {
                $("#MonthlyDues").hide();
                $("#MessDetails").hide();

                $("#MonthlyDuesL").click(function () {
                    $("#MonthlyDues").show();
                    $("#MessDetails").hide();
                });

                $("#MessDetailsL").click(function () {
                    $("#MonthlyDues").hide();
                    $("#MessDetails").show();
                });

            });
        </script>

    </head>
    <body>
        <%            try {
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
                <H1>Student</h1>
            </div>

        </div>

        <nav class="main-nav">

            <ul class="nav-list">
                <li><a href="#" id="MessDetailsL">Monthly Mess Details</a></li>
                <li><a href="#" id="MonthlyDuesL">Total Dues</a></li>


            </ul>

        </nav>


        <br /> 
        <br />
        <div id="content">
            <form name="mmd" method="post" onSubmit="return studentinfo();" action="monthlyMessDetails.jsp">
                <div id="MessDetails">
                    <table id ="table1" class="table">

                        <tr>
                            <td id="style1"> Roll No:</td>
                            <td class="style1"><input type="text" name="Rno" /></td>
                        </tr>
                        <tr>
                            <td id="style1">Month:</td>
                            <td><select id="mselection" name="mselection">
                                    <option selected disabled value="">--Select Month--</option>
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
                            <td id="style1">Year:</td>
                            <td><select id="yselection" name="yselection">
                                    <option selected disabled value="">--Select Year--</option>
                                    <option value="2012" >2012</option>
                                    <option value="2013" >2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                </select></td>
                        </tr> 
                        <tr>
                            <td> </td>
                            <td>  
                                <input type="submit" name="mess" id ="mess" class="styled-button-1" value="Submit"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>

            <form name="td" method="post" onSubmit="return studentinfo1();" action="totalDues.jsp">
                <div id="MonthlyDues">
                    <table id ="table1" class="table">

                        <tr>
                            <td id="style1">
                                Roll No :
                            </td>
                            <td class="style1"><input type="text" name="Rno1"/></td>
                        </tr>
                        <tr>
                            <td> </td>
                            <td>  
                                <input type="submit" name="dues" id ="dues" class="styled-button-1" value="Submit"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>


        </div>

    </body>
</html>
