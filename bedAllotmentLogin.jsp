<%-- 
    Document   : bedAllotment
    Created on : Jul 31, 2015, 10:17:34 PM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room-bed Allotment System</title>
        <link rel="stylesheet" type="text/css" href="css/loginPages_style.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bedValidation.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#dbType').on('change', function () {

                    var selection = $(this).val();
                    switch (selection) {
                        case "Caretaker":
                            $("#otherType").show();

//                            $("#otherType2").hide();
                            $("#otherType3").show();
                            break;

                        case "Hostelmanager":
                            $("#otherType").show();
//                            $("#otherType2").hide();
                            $("#otherType3").show();
                            break;
//                        case "Student":
//                            $("#otherType2").show();
//                            $("#otherType").hide();
//                            $("#otherType3").show();
//                            break;
                        case "Deputywarden":
                            $("#otherType").show();
//                            $("#otherType2").hide();
                            $("#otherType3").show();
                            break;

                        default:
                            $("#otherType").hide();
//                            $("#otherType2").hide();
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

                        <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>
                    </ul>
                </div>
            </nav>
            <div id="title">
                <H1>Hostel Room-Bed Allotment</h1>
            </div>
        </div>

        <div id="menu">
            <div id="left">Login Page</div>
        </div>

        <div id="content">
            <form id="formEntry" name="bedLogin" method="post" action="bedAllotmentLoginDB.jsp" onsubmit="return bedLoginValidation();">
                Select User Type:
                <select name="dbType" id="dbType">
                    <option selected disabled>--Select User--</option>
                    <option value="Caretaker">Caretaker</option>
                    <option value="Deputywarden">Deputy Warden</option>
                    <option value="Hostelmanager">Hostel Manager</option>
                </select>
                <br>
                <br>

                <div id="otherType" >
                    Username <input type="text" name="username"  style="width: 240px" <%=session.getAttribute("unamep")%>/><br/>
                    Password <input type="password" name="password" style="width: 240px" <%=session.getAttribute("passp")%>/><br/>
                    <br>
                </div>

                <br>
                <br>
                <br>
                <br>
                <br>
                <input type="submit" value="SUBMIT" id="otherType3">
            </form>

        </div>



    </body>
</html>

