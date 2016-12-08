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
        <title>Change Password</title>
        <link href="css/changepassword_style.css" rel="stylesheet" type="text/css"/>
        <script src="js/password.js" type="text/javascript"></script>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    </head>
    <body>
        <div id="header">
            <nav class="nav">
                <div id="menu-list">
                    <ul class="list">

                        <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>

                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Change Password</h1>
            </div>

        </div>
        <nav class="main-nav">


        </nav>
        <br /> 
        <br />

        <div id="content">
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <form name="ChangePassword" method="post" action="passDB.jsp" onSubmit="return validatepassword(this);">
                <table id="table1">
                    <tr>
                        <td id="style1">Username :</td>
                        <td class="style1"><input type="text" name="username"  value="<%=session.getAttribute("unamep")%>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td id="style1">Password :</td>
                        <td class="style1"><input name="password" type="password">
                        </td>
                    </tr>

                    <tr>
                        <td id="style1">New Password : </td>
                        <td class="style1"><input name="newpassword" type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td id="style1">Confirm Password :</td>
                        <td class="style1"><input name="conpassword" type="password" >
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="style1"><input type="submit" name="Submit" value="submit"  class="styled-button-1"></td>
                    </tr>

                </table>


            </form>
        </div>




    </body>
</html>
