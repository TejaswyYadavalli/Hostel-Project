<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.hostel.FormBean.*"%>
<%@page import="DBConnection.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

                <script src="js/bed.js" type="text/javascript"></script>
                <link href="css/Hostel_style.css" rel="stylesheet" type="text/css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                <title>Godavari</title>
                <script>
                    $(document).ready(function () {

                        $("#field").hide();
                        $(".input").click(function (e) {
                            $("#field").show();
                        });
                        $(".input").click(function () {
                            $(".input.changecolor").not(this).removeClass("changecolor")
                            $(this).toggleClass("changecolor");
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



                        <span style="margin-left: 50px; color: black; font-size: 21px;font-family: cursive;">
                            GODAVARI Hostel</span>  


                    </div>

                    <br/>
                    <div id="content">
                        <div id="ground_floor">


                            <div class="bed">BEDS</div>



                            <div class="seat-allotment">
                                <p>NAME: <span> Godavari Hostel</span></p>
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

                            <form action="godavariDB.jsp" method="post" name="bedLayout" onsubmit="return rollNo()">
                                <div id="allot">

                                    <%
                                        Connection con = DB.getConnection();
                                        PreparedStatement ps = con.prepareStatement("select *from godavari");

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
                                        if (bedno % 4 == 0) {%>

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
                                        if ((bedno % 8) == 0) {
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
                                    <input type="text" name="rno" style="width: 175px;"/><br/>
                                    <br/>
                                    <input type="submit"  name="select" id="text" value="ALLOT" class="styled-button-1" />
                                    <input type="submit"  name="select" id="text" value="UPDATE" class="styled-button-1" />
                                </div>
                            </form>





                        </div>
                    </div>



                </body></html>