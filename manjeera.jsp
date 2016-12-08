<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.hostel.FormBean.*"%>
<%@page import="DBConnection.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">


                <link href="css/Hostel_style.css" rel="stylesheet" type="text/css"/>
                <title>Manjeera</title>
                <script src="js/beds.js" type="text/javascript"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                <script>
                    $(document).ready(function () {

                        $("#ground_floor").hide();
                        $("#first_floor").hide();
                        $("#second_floor").hide();

                        $("#ground").click(function () {
                            $("#second_floor").hide();
                            $("#first_floor").hide();
                            $("#ground_floor").show();
                        });
                        $("#first").click(function () {
                            $("#second_floor").hide();
                            $("#ground_floor").hide();
                            $("#first_floor").show();
                        });
                        $("#second").click(function () {
                            $("#ground_floor").hide();
                            $("#first_floor").hide();
                            $("#second_floor").show();
                        })
                        $("#field").hide();
                        $(".input").click(function (e) {
                            $("#field").show();
                        });
                        $("#field1").hide();
                        $(".input1").click(function (e) {
                            $("#field1").show();
                        });
                        $("#field2").hide();
                        $(".input2").click(function (e) {
                            $("#field2").show();
                        });
                        $(".input").click(function () {
                            $(".input.changecolor").not(this).removeClass("changecolor")
                            $(this).toggleClass("changecolor");
                        });
                        $(".input1").click(function () {
                            $(".input1.changecolor1").not(this).removeClass("changecolor1")
                            $(this).toggleClass("changecolor1");
                        });
                        $(".input2").click(function () {
                            $(".input2.changecolor2").not(this).removeClass("changecolor2")
                            $(this).toggleClass("changecolor2");
                        });


                    });

                </script>
                <script language="JavaScript" type="text/javascript">
                    function show_alert() {
                        alert("THIS BED IS ALREADY RESERVED");
                    }
                    function seatReserve(bno) {
                        document.bedLayout.bno.value = bno;
                    }
                    function seatReserve1(bno) {
                        document.bedLayout1.bno.value = bno;
                    }
                    function seatReserve2(bno) {
                        document.bedLayout2.bno.value = bno;
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

                                    <li><a href="bedAllotmentLogin.jsp" id="bedAllotmentLoginL" target="_self" class="fa w3-left">Bed Allotment</a></li>
                                    <li><a href="hostelSelection.jsp" id="changepasswordL" target="_self" class="fa w3-left">Hostel Selection</a></li>
                                    <li><a href="changepassword.jsp" id="changepasswordL" target="_self" class="fa w3-left">Change Password</a></li>
                                    <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                                </ul>

                            </div>
                        </nav>
                        <div id="title">
                            <H1>Room and Bed Allotment</h1>
                        </div>
                    </div>

                    <div id="menu">
                        <div id="left">
                            Select the floor :
                            <a class="menu-icon" id="ground" href="#">Ground</a>
                            <a class="menu-icon" id="first" href="#">First</a>
                            <a class="menu-icon" id="second" href="#">Second</a>
                            <span style="margin-left: 550px; color: black; font-size: 20px;">
                                MANJEERA Hostel</span>  
                        </div>

                    </div>

                    <br/>
                    <div id="content">
                        <%Connection con = DB.getConnection();%>
                        <div id="ground_floor">


                            <div class="bed">BEDS</div>



                            <div class="seat-allotment">
                                <p>NAME: <span> Manjeera Hostel</span></p>
                                <p>TYPE: <span> Boys</span></p>
                                <p>FLOOR: <span> Ground</span></p>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <p><input type="button" name="seatno" value="" style="background-color: red"/>&nbsp;&nbsp; Reserved
                                    <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellowgreen"/>&nbsp;&nbsp; Available <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellow"/>&nbsp;&nbsp; Selected</p>
                            </div>

                            <br/><br/></p>
                            <div id="legend"></div>

                            <div style="clear:both"></div>

                            <form action="manjeeraDB.jsp" method="post" name="bedLayout" onsubmit="return rollNo()">
                                <div id="allot">

                                    <%

                                        PreparedStatement ps = con.prepareStatement("select *from manjeera where floorno=?");
                                        ps.setInt(1, 0);

                                        ResultSet rs = ps.executeQuery();
                                        Vector<BedFormBean> hostelbed = new Vector<BedFormBean>();

                                        BedFormBean bed = null;
                                        while (rs.next()) {

                                            bed = new BedFormBean();
                                            int bedId = rs.getInt(1);
                                            int floorno = rs.getInt(2);
                                            int bedno = rs.getInt(3);
                                            String bedstatus = rs.getString(4);
                                            int roomno = rs.getInt(5);

                                            bed.setBedId(bedId);
                                            bed.setFloorNo(floorno);
                                            bed.setBedNo(bedno);
                                            bed.setBedStatus(bedstatus);
                                            bed.setRoomNo(roomno);

                                            hostelbed.add(bed);
                                        }
                                        Iterator it = hostelbed.listIterator();

                                        String bedstatus = null;
                                        int bedno = 0;
                                        int roomno = 0;
                                        while (it.hasNext()) {
                                    %>



                                    <%
                                        if (bedno % 2 == 0) {%>

                                    <label style="padding-left: 5px; padding-right: 5px; font-size: 12px; font-family: cursive; width: 90px; box-sizing: border-box">Room_<%=++roomno%></label>

                                    <%
                                        }
                                        bed = (BedFormBean) it.next();
                                        bedstatus = bed.getBedStatus();
                                        bedno = bed.getBedNo();
                                        roomno = bed.getRoomNo();

                                        if (bedstatus.equalsIgnoreCase("active")) {
                                    %>

                                    <input type="button" id="active" class="input" name="availbed" value="<%=bed.getBedNo()%>"   style="height: 30px; width: 40px; border-radius: 5px;"  onclick="seatReserve(this.value);"  />

                                    <%
                                    } else if (bedstatus.equalsIgnoreCase("inactive")) {
                                    %>

                                    <input type="button" id="reserved" name="reserbed" value="<%=bed.getBedNo()%>" style=" background-color: red; height: 30px; width: 40px; border-radius: 5px;" onclick="show_alert();"/>
                                    <%
                                        }
                                        if ((bedno % 6) == 0) {
                                    %>
                                    <br/>
                                    <br/>
                                    <%
                                            }

                                        }
                                    %>

                                    <br/><br/>

                                    <input type="hidden" id="bed" name="bno"/>
                                    <input type="hidden" id="floor" name="floor" value="0"/>

                                </div>
                                <div id="field" class="seat-allotment">

                                    <br/>
                                    <p><label>Enter Roll No.</label></p>
                                    <input type="text" name="rno" id="rno" style="width: 175px;"/><br/>
                                    <br/>
                                    <input type="submit"  name="select" id="text" value="ALLOT" class="styled-button-1" />
                                    <input type="submit"  name="select" id="text" value="UPDATE" class="styled-button-1" />
                                </div>
                            </form>





                        </div>
                        <div id="first_floor" style="margin-left: 100px;">


                            <div class="bed">BEDS</div>



                            <div class="seat-allotment">
                                <p>NAME: <span> Manjeera Hostel</span></p>
                                <p>TYPE: <span> Boys</span></p>
                                <p>FLOOR: <span> First</span></p>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <p><input type="button" name="seatno" value="" style="background-color: red"/>&nbsp;&nbsp; Reserved
                                    <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellowgreen"/>&nbsp;&nbsp; Available <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellow"/>&nbsp;&nbsp; Selected</p>
                            </div>

                            <br/><br/></p>
                            <div id="legend"></div>

                            <div style="clear:both"></div>

                            <form action="manjeeraDB.jsp" method="post" name="bedLayout1" onsubmit="return rollNo1()">
                                <div id="allot">

                                    <%
                                        PreparedStatement ps1 = con.prepareStatement("select *from manjeera where floorno=?");
                                        ps1.setInt(1, 1);

                                        ResultSet rs1 = ps1.executeQuery();
                                        Vector<BedFormBean> hostelbed1 = new Vector<BedFormBean>();

                                        BedFormBean bed1 = null;
                                        while (rs1.next()) {

                                            bed1 = new BedFormBean();
                                            int bedId1 = rs1.getInt(1);
                                            int floorno1 = rs1.getInt(2);
                                            int bedno1 = rs1.getInt(3);
                                            String bedstatus1 = rs1.getString(4);
                                            int roomno1 = rs1.getInt(5);

                                            bed1.setBedId(bedId1);
                                            bed1.setFloorNo(floorno1);
                                            bed1.setBedNo(bedno1);
                                            bed1.setBedStatus(bedstatus1);
                                            bed1.setRoomNo(roomno1);

                                            hostelbed1.add(bed1);
                                        }
                                        Iterator it1 = hostelbed1.listIterator();

                                        String bedstatus1 = null;
                                        int bedno1 = 0;
                                        int roomno1 = 0;
                                        while (it1.hasNext()) {
                                    %>



                                    <%
                                        if (bedno1 % 4 == 0) {%>

                                    <label style="padding-left: 5px; padding-right: 5px; font-size: 12px; font-family: cursive; width: 90px; box-sizing: border-box">Room_<%=++roomno1%></label>

                                    <%
                                        }
                                        bed1 = (BedFormBean) it1.next();
                                        bedstatus1 = bed1.getBedStatus();
                                        bedno1 = bed1.getBedNo();
                                        roomno1 = bed1.getRoomNo();

                                        if (bedstatus1.equalsIgnoreCase("active")) {
                                    %>

                                    <input type="button" id="active" class="input1" name="availbed" value="<%=bed1.getBedNo()%>"   style="height: 30px; width: 40px; border-radius: 5px;"  onclick="seatReserve1(this.value);"  />

                                    <%
                                    } else if (bedstatus1.equalsIgnoreCase("inactive")) {
                                    %>

                                    <input type="button" id="reserved" name="reserbed" value="<%=bed1.getBedNo()%>" style=" background-color: red; height: 30px; width: 40px; border-radius: 5px;" onclick="show_alert();"/>
                                    <%
                                        }
                                        if ((bedno1 % 8) == 0) {
                                    %>
                                    <br/>
                                    <br/>
                                    <%
                                            }

                                        }
                                    %>

                                    <br/><br/>

                                    <input type="hidden" id="bed" name="bno"/>
                                    <input type="hidden" id="floor" name="floor" value="1"/>

                                </div>
                                <div id="field1" class="seat-allotment">

                                    <br/>
                                    <p><label>Enter Roll No.</label></p>
                                    <input type="text" name="rno" id="rno1" style="width: 175px;"/><br/>
                                    <br/>
                                    <input type="submit"  name="select" id="text" value="ALLOT" class="styled-button-1" />
                                    <input type="submit"  name="select" id="text" value="UPDATE" class="styled-button-1" />
                                </div>
                            </form>


                        </div>


                        <div id="second_floor" style="margin-left: 100px;">

                            <div class="bed">BEDS</div>



                            <div class="seat-allotment">
                                <p>NAME: <span> Manjeera Hostel</span></p>
                                <p>TYPE: <span> Boys</span></p>
                                <p>FLOOR: <span> Second</span></p>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                                <p><input type="button" name="seatno" value="" style="background-color: red"/>&nbsp;&nbsp; Reserved
                                    <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellowgreen"/>&nbsp;&nbsp; Available <br/><br/></p>
                                <p><input type="button" name="seatno" value="" style="background-color: yellow"/>&nbsp;&nbsp; Selected</p>
                            </div>

                            <br/><br/></p>
                            <div id="legend"></div>

                            <div style="clear:both"></div>

                            <form action="manjeeraDB.jsp" method="post" name="bedLayout2" onsubmit="return rollNo2()">
                                <div id="allot">

                                    <%
                                        PreparedStatement ps3 = con.prepareStatement("select *from manjeera where floorno=?");
                                        ps3.setInt(1, 2);

                                        ResultSet rs3 = ps3.executeQuery();
                                        Vector<BedFormBean> hostelbed3 = new Vector<BedFormBean>();

                                        BedFormBean bed3 = null;
                                        while (rs3.next()) {

                                            bed3 = new BedFormBean();
                                            int bedId3 = rs3.getInt(1);
                                            int floorno3 = rs3.getInt(2);
                                            int bedno3 = rs3.getInt(3);
                                            String bedstatus3 = rs3.getString(4);
                                            int roomno3 = rs3.getInt(5);

                                            bed3.setBedId(bedId3);
                                            bed3.setFloorNo(floorno3);
                                            bed3.setBedNo(bedno3);
                                            bed3.setBedStatus(bedstatus3);
                                            bed3.setRoomNo(roomno3);

                                            hostelbed3.add(bed3);
                                        }
                                        Iterator it3 = hostelbed3.listIterator();

                                        String bedstatus3 = null;
                                        int bedno3 = 0;
                                        int roomno3 = 0;
                                        while (it3.hasNext()) {
                                    %>



                                    <%
                                        if (bedno3 % 4 == 0) {%>

                                    <label style="padding-left: 5px; padding-right: 5px; font-size: 12px; font-family: cursive; width: 90px; box-sizing: border-box">Room_<%=++roomno3%></label>

                                    <%
                                        }
                                        bed3 = (BedFormBean) it3.next();
                                        bedstatus3 = bed3.getBedStatus();
                                        bedno3 = bed3.getBedNo();
                                        roomno3 = bed3.getRoomNo();

                                        if (bedstatus3.equalsIgnoreCase("active")) {
                                    %>

                                    <input type="button" id="active" class="input2" name="availbed" value="<%=bed3.getBedNo()%>"   style="height: 30px; width: 40px; border-radius: 5px;"  onclick="seatReserve2(this.value);"  />

                                    <%
                                    } else if (bedstatus3.equalsIgnoreCase("inactive")) {
                                    %>

                                    <input type="button" id="reserved" name="reserbed" value="<%=bed3.getBedNo()%>" style=" background-color: red; height: 30px; width: 40px; border-radius: 5px;" onclick="show_alert();"/>
                                    <%
                                        }
                                        if ((bedno3 % 8) == 0) {
                                    %>
                                    <br/>
                                    <br/>
                                    <%
                                            }

                                        }
                                    %>

                                    <br/><br/>

                                    <input type="hidden" id="bed" name="bno"/>
                                    <input type="hidden" id="floor" name="floor" value="2"/>

                                </div>
                                <div id="field2" class="seat-allotment">

                                    <br/>
                                    <p><label>Enter Roll No.</label></p>
                                    <input type="text" name="rno" id="rno2" style="width: 175px;"/><br/>
                                    <br/>
                                    <input type="submit"  name="select" id="text" value="ALLOT" class="styled-button-1" />
                                    <input type="submit"  name="select" id="text" value="UPDATE" class="styled-button-1" />
                                </div>
                            </form>

                        </div>

                    </div>



                </body></html>