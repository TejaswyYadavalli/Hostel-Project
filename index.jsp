<%-- 
    Document   : index
    Created on : 12-Aug-2015, 16:13:58
    Author     : CHAHNA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/site.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/rules_style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/administrator.js" type="text/javascript"></script>
        <link href="css/contactus_style.css" rel="stylesheet" type="text/css"/>
     
        <script>
            $(document).ready(function () {
                $("li").click(function (event) {
                    event.stopPropagation();
                    $('li > ul').not($(this).children("ul").toggle()).hide();
                });

                $(document).click(function () {
                    $('.dropdown').hide();
                });
                $("#rules").hide();
                $("#contactUs").hide();
                $("#admin").hide();
                $("#homeL").click(function () {
                    $("#rules").hide();
                    $("#contactUs").hide();
                    $("#admin").hide();
                    $("#home").show();
                });

                $("#rulesL").click(function () {
                    $("#contactUs").hide();
                    $("#home").hide();
                    $("#admin").hide();
                    $("#rules").show();
                });
                $("#contactUsL").click(function () {
                    $("#rules").hide();
                    $("#home").hide();
                    $("#admin").hide();
                    $("#contactUs").show();
                });
                $("#adminL").click(function () {
                    $("#rules").hide();
                    $("#contactUs").hide();
                    $("#home").hide();
                    $("#admin").show();
                });


            });
        </script>


        <title>Homepage</title>
    </head>
    <body>

        <div id="header">
            <img class="logo" src="images/jntu_building.jpg">
            <div id="title">
                <H1>Hostel Management System</h1>
            </div>
            <div id="sub-title">
                for Jawaharlal Nehru Technological University,Hyderabad
            </div>
        </div>

        <nav class="main-nav">
            <ul class="nav-list">
                <li><a href="#" id="homeL">Home</a>
                    
                </li>


                <li><a href="#">Services</a>
                    <ul class="dropdown">
                        <li><a href="PaymentLogin.jsp">Payment Tracking</a></li>
                        <li><a href="bedAllotmentLogin.jsp">Bed Allotment</a></li>
                    </ul>
                </li>
                <li><a href="#" id="rulesL">Rules</a></li>
                <li><a href="#" id="contactUsL">Contact Us</a></li>
                <li><a href="#" id="adminL">Administrator</a></li>

            </ul>

        </nav>
        <div id="content" style="background-color: #A4FF9F">

            <div id="home">
                <div id="img"><img src="images/jntu_building.jpg" style="width: 130%;height: 20%">      </div>

<p id="b">The College presently has 4 boys Hostel and 3 girls Hostel.The College provides Hostel facilities for about 800 boys and 530 girls.University has given top priority for the establishment of Hostel for SIT Students.

"A home away from home" That's what our students experience living in the campus. There are separate hostels for boys and girls with good infrastructure. We ensure security in hostels as 24 hour security guards are available. </p>
            </div>


            <div id="rules">
                <span style="text-align: center;">
                    <h3>DISCIPLINARY RULES FOR THE INMATES OF THE HOSTELS</h3>
                </span>

                <p> </p>
                <span id="bold" style="text-align:center;">The following rules shall apply to both MALE and FEMALE students residing in the hostels.
                    Violation of any rule will make the inmate liable to 
                    disciplinary action including expulsion from the hostels and also from institution.</span>
                <br>
                <span id="information">
                    1. Rooms are alloted to the students by the Hostel Authorities.However the management reserves the right to change any room/rooms with short notice.<br>
                    2. Whoever admits in hostel should opt both for boarding and accommodation.If a student is staying away from the hostel for one or more nights.he/she should get the permission of the concerned deputy warden. <br>
                    3. Hostel mess bill should be paid semester vice in advance.hostel admission will be given semester wise based on payment of mess bill semester wise in advance and clearance of previous dues.<br>
                    4. Four and two wheeled Motor Vehicles are strictly not allowed in the hostel premises as it leads to sound and Air pollution,creates problem and disturbance to fellow boards.Only Bicycles are permitted and these are to be kept in the respective Hostels Cycle Stand only.<br>
                    5. Consumption of Alcohol and smoking in the Hostel premises is Prohibited,violation of this may lead to expulsion from the hostel.<br>
                    6. The boarders shall refrain from music and singing or making noise in the Hostel during the hours when students devote the time to study,strict silence is to be observed during study hours.<br>
                    7. Students are responsible for the safety of furniture,electrical fittings and other fixtures in the rooms and these should be properly handed over at the time of their leaving to the concerned Deputy Warden.<br>
                    8. Ragging is an offence and it is prohibited by the state as well as central Government.Students who indulge in ragging or other acts of the misconduct are liable for severe punishment including expulsion from the hostel immediately and also from the college.<br>
                    9. Uses of electrical heaters for cooking food and heating water in the rooms are strictly prohibited.<br>
                    10.Indoor games are likely to disturb the adjacent inmates and are prohibited in the rooms,and playing cricket inside the hostel Premises is also strictly prohibited.<br>
                    11.The boarders shall not issue any orders to the hostel servants and shall not interfere in their work.in case of misconduct or unsatisfactory service on the part of the servants.boarders shall not take law into their own hands,but shall immediately report to Hostel Office/concerned Deputy Warden.<br>
                    12.Boarders shall not put up notices or convene meeting of any sort with in hostel premises without the prior permission from Deputy Warden or Hostel Manager.<br>        
                    13.Any boarder,who has been suspended/expelled from the college shall deemed to be expelled from the hostel automatically.<br>
                    14.Guests are not allowed to stay in the hostel without guest permit under any circumstances,Boarders who allow guests in their rooms are liable to be suspended from the hostel and a fine of Rs.500/- per day will be levied.<br>               
                    15.Hostel rules and regulations framed by the hostel committee from time to time will apply to all boarders.<br>
                    <!--                    16.Boarders are advised not to keep rooms Unlocked while going out and do not keep money or valuable in their rooms(cell phones,computers,gold etc)hostel authorities are not responsible for goods or money lost by boarders.<br>
                                        17.Boarders are also advised not to take the food into their rooms or TV room etc.If they indulge in such activity disciplinary action will be taken and may lead to suspension from Hostel.<br>
                                        18.Boarders have to pay mess charges every month within 15 days or as stipulated from the date of display of mess bill,if any boarder is failed to pay in the specified time,he/she has to pay penalty of Rs.10 per day, a maximum of 30 days from the date of display of mess bill.Afterwards,he will forgo the hostel Admission.For re-admission Rs.500/- wll be charged as re-admission charges.  <br>
                                        19.Due to shortage of hostel accommodation,priority will be given to the students who clear the subjects at a time in subsequent semesters.<br>
                                        20.Scholarship student shall pay the difference amount of monthly mess bill after deducting from monthly scholarship amount.<br>
                                        21.Caution deposit should be paid at the time of admission  and this will be refunded after vacating the Hostels.<br>-->
                </span>
            </div>

            <div id="contactUs">
                <br/>

                <div id="info">
                    Jawaharlal Nehru Technological University Hyderabad
                </div>
                <div id="contact">
                    Kukatpally, Hyderabad, Telangana, INDIA- 500 085. <br />
                    Cell: +91- 08008103808, <br />Fax: +91-40 - 23158269  Landline: 040-23058268 <br />
                    E-mail :srmeda@jntuh.ac.in  /  srmeda@gmail.com<br /
                        >Website :www.jntuhsit.org/www.jntuh.ac.in<br />
                </div>
                <div id="details">
                    <h3>Warden of Boys Hostel</h3>
                </div>

                <table id="mytable" >
                    <tbody>
                        <tr>
                            <td  >
                                Designation</td>
                            <td  >
                                Name</td>
                            <td >
                                Dept. Designation &amp; Ph. Number</td>
                        </tr>
                        <tr>
                            <td >
                                Sr. Warden</td>
                            <td  >
                                Dr. K.  Karthikeyan. P</td>
                            <td > 
                                JNTU, HOD,&nbsp;MECH<br />
                                044 - 27417833</td>
                        </tr>
                    </tbody>
                </table>

                <div id="details">
                    <h3>Warden of Girls Hostel</h3>
                </div>

                <table id="mytable" >
                    <tbody>
                        <tr>
                            <td  >
                                Designation</td>
                            <td  >
                                Name</td>
                            <td >
                                Dept. Designation &amp; Ph. Number</td>
                        </tr>
                        <tr>
                            <td >
                                Sr. Warden</td>
                            <td  >
                                Dr.     Jayalakshmi. R</td>
                            <td > 
                                JNTU, Professor,&nbsp;Chemistry<br />
                                8056016628</td>
                        </tr>
                    </tbody>^
                </table>
            </div>


            <form action="admin_login.jsp" method="post" name="admin1" onSubmit="return admin();">
                <div id="admin">
                    <br/>
                    <table id="table1" >
                        <tr>
                            <td id="style1">Username :</td>
                            <td class="style1"><input type="text" name="username" /></td>
                        </tr>
                        <tr>
                            <td id="style1">Password :</td>
                            <td class="style1"><input type="password" name="password"  /></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td><input type="submit" class="styled-button-1" value="Submit" /> 
                            </td>
                        </tr>
                    </table>
                  
                    
                </div>
            </form>


        </div>


    </body>
</html>
