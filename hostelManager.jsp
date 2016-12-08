<%-- 
    Document   : hostelManager
    Created on : Aug 11, 2015, 4:33:38 PM
    Author     : tejaswy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hostel Manager</title>
        <link rel="stylesheet" type="text/css" href="css/hostelManager_style.css">
        <link href="css/hostelManagerTabs.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/payHMananger.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                $("#hostelFee").hide();
                $("#HostelFeeL").click(function () {
                    $("#hostelFee").show();
                });
            });
            function openPage() {
                window.location.href = "hostelDetails.jsp";
            }




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
                <H1 id="toptitle">Hostel Manager</h1>
            </div>
        </div>
        <nav class="main-nav">
            <ul class="nav-list">
                <li><a href="#" id="HostelFeeL">Hostel Fee Details</a></li>

                <li><a href="studentinfo.jsp" id="studentPayL">Student Payment Details </a></li>
            </ul>
        </nav>

        <br /> 
        <br />


        <div id="content">
            <form action="hostelDetails.jsp" method="post" id="form1" name="form1" onSubmit="return payHManager(this);">
                <div id="hostelFee">

                    <br />
                    <br />
                    <table id="table1">
                        <tr>
                            <td id="style1">Month:</td>
                            <td><select id="mselection" style="width: 150px;" name="mselection">
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
                            <td id="style1">Year:</td>
                            <td><select id="yselection" style="width: 150px;" name="yselection">
                                    <option value="2012" >2012</option>
                                    <option value="2013" >2013</option>
                                    <option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td id="style1">Select Hostel:</td>
                            <td>
                                <select name="hostelSelect" id="selection" style="width: 150px;">
                                    <option value="All" >All</option>
                                    <option value="All Boys">All Boys</option>
                                    <option value="All Girls">All Girls</option>
                                    <option value="KamalaNehru">Kamala Nehru Hostel</option>
                                    <option value="Saraswathi">Saraswathi Hostel</option>
                                    <option value="Gayathri">Gayathri Hostel</option>
                                    <option value="Godavari">Godavari Hostel</option>
                                    <option value="Krishna">Krishna Hostel</option>
                                    <option value="Manjeera">Manjeera Hostel</option>
                                    <option value="Kinnera">Kinnera Hostel</option>
                                </select>
                            </td>
                        <tr>
                            <td>
                                <input type="submit" class="styled-button-1" value="Submit" >
                            </td>
                        </tr>
                    </table>

                </div>
            </form>


        </div>
    </body>
</html>