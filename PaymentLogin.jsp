<%-- 
    Document   : index
    Created on : 30-Jul-2015, 11:13:20
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Tracking System Login</title>
        <link rel="stylesheet" type="text/css" href="css/loginPages_style.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="js/paymentValidation.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#dbType').on('change', function () {
//                    var selection = $(this).val();
                    var selection = $('#dbType option:selected').text();
                    switch (selection) {
                        case "Clerk":
                            $("#otherType").show();
                            $("#otherType2").hide();
                            $("#otherType3").show();
                            break;

                        case "Hostel Manager":
                            $("#otherType").show();
                            $("#otherType2").hide();
                            $("#otherType3").show();
                            break;
                        case "Student":
                            $("#otherType2").show();
                            $("#otherType").hide();
                            $("#otherType3").show();
                            break;
                        default:
                            $("#otherType").hide();
                            $("#otherType2").hide();
                            $("#otherType3").hide();
                    }
                });
            });

        </script>
    </head>
    <body>
        <div id="header">
            <nav class="nav">
                <div id="menu-list">
                    <ul class="list">
                        <li><a href="index.jsp" class="fa fa-home " id="homeL" target="_self">Home</a></li>
                    </ul>
                </div>
            </nav>




            <div id="title">
                <H1>Student Payment Tracking</h1>
            </div>
        </div>

        <div id="menu">
            <div id="left">Login Page

            </div>
        </div>
        <div id="content">

            <form action="PaymentloginDb.jsp" method="post" id="formEntry" name="payLogin" onSubmit="return payLoginValidation();">
                Select User Type:
                <select name="dbType" id="dbType">
                    <option selected disabled>--Select User--</option>
                    <option name="Student" value="Student">Student</option>
                    <option name="Clerk" value="Clerk">Clerk</option>
                    <option name="Hostel Manager" value="HostelManager">Hostel Manager</option>
                </select>
                <br>
                <br>

                <div id="otherType" >
                    Username <input type="text" name="username" style="width: 240px" <%=session.getAttribute("unamep")%>/><br/>
                    Password <input type="password" name="password"  style="width: 240px" <%=session.getAttribute("passp")%>/><br/>
                    <br>
                </div>

                <br>
                <div id="otherType2">
                    Roll Number <input type="text" name="htno"  style="width: 240px" <%=session.getAttribute("htnop")%>/>
                </div>
                <br>
                <br>
                <br>
                <br>
                <input type="submit" value="SUBMIT" id="otherType3">
            </form>



        </div>

    </body>
</html>
