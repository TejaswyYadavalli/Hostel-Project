<%-- 
    Document   : Hostel Selection
    Created on : Jul 27, 2015, 11:04:04 PM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hostel Selection</title>
        <link rel="stylesheet" type="text/css" href="css/hostelSelection_style.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#girls").hide();
                $("#boys").hide();
                $("#girlslink").click(function () {
                    $("#boys").hide();
                    $("#girls").show();
                });
                $("#boyslink").click(function () {
                    $("#girls").hide();
                    $("#boys").show();
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
                <H1>Hostel Selection</h1>
            </div>
        </div>

        <div id="menu">
            <div id="left">
                Select the type of Hostel :
                <a class="menu-icon" id="girlslink" href="#">Girls</a>
                <a class="menu-icon" id="boyslink" href="#">Boys</a>
                <span style="margin-left: 550px; color: black;">
                    There are 7 hostels in total..</span>  
            </div>

        </div>

        <div id="content">
            <div id="girls">
                GIRLS HOSTELS
                <br><br>
                <a class="imagelink" href="gayathri.jsp">
                    <figure class="hostelpic">
                        <img src="images/kamalanehrugirls_hostel.jpg" alt="Gayathri Hostel">
                        <figcaption>Gayathri Hostel</figcaption>
                    </figure>
                </a>



                <a class="imagelink" href="saraswathi.jsp">
                    <figure class="hostelpic">
                        <img src="images/kamalanehrugirls_hostel.jpg" alt="Saraswathi Hostel">
                        <figcaption>Saraswathi Hostel</figcaption>
                    </figure>
                </a>

                <br><br>
                <a class="imagelink" href="kamalanehru.jsp">
                    <figure class="hostelpic">
                        <img  src="images/kamalanehrugirls_hostel.jpg" alt="Kamala Nehru Hostel">
                        <figcaption>Kamala Nehru Hostel</figcaption>
                    </figure>
                </a>

            </div>


            <div id="boys">
                BOYS HOSTELS
                <br><br>

                <a class="imagelink"  href=manjeera.jsp>
                    <figure class="hostelpic">
                        <img  src="images/manjeera_hostel.jpg" alt="Manjeera Hostel">
                        <figcaption>Manjeera Hostel</figcaption>
                    </figure>
                </a>

                <a class="imagelink" href="krishna.jsp">
                    <figure class="hostelpic">
                        <img src="images/krishna_hostel.jpg" alt="Krishna Hostel">
                        <figcaption>Krishna Hostel</figcaption>
                    </figure>
                </a>
                <br><br>
                <a class="imagelink"  href="godavari.jsp">
                    <figure class="hostelpic">
                        <img  src="images/godavari_hostel.jpg" alt="Godavari Hostel">
                        <figcaption>Godavari Hostel</figcaption>
                    </figure>
                </a>
                <a class="imagelink" href="kinnera.jsp">
                    <figure class="hostelpic">
                        <img src="images/krishna_hostel.jpg" alt="Kinnera Hostel">
                        <figcaption>Kinnera Hostel</figcaption>
                    </figure>
                </a>

            </div>


        </div>


    </body>
</html>
