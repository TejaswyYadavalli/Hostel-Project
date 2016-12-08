<%-- 
    Document   : clerkBillUpdateDB
    Created on : 15 Sep, 2floor15, 9:43:11 PM
    Author     : tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Godavari</title>
    </head>

    <%
        try {
            String hname = "Godavari";
            String selected = request.getParameter("select");
            String bedno = request.getParameter("bno");
            String rno = request.getParameter("rno");
            int floor = Integer.parseInt(request.getParameter("floor"));
            int roomno = 0;
            String sbno = "";
            String sfno = "";
            String srno = "";
            String shm = "";
            Connection con = DB.getConnection();

            PreparedStatement ps2 = con.prepareStatement("Select roomno from godavari where bedno=? and floorno=?");
            ps2.setString(1, bedno);
            ps2.setInt(2, floor);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                roomno = rs.getInt(1);
            }

            PreparedStatement ps1 = con.prepareStatement("select * from studentdetails where rno=? and gender=?");
            ps1.setString(1, rno);
            ps1.setString(2, "Male");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {

                if (selected.equalsIgnoreCase("ALLOT")) {

                    PreparedStatement ps4 = con.prepareStatement("select * from studentstay where rno=?");
                    ps4.setString(1, rno);
                    ResultSet rs2 = ps4.executeQuery();
                    if (rs2.next()) {

    %>
    <script>
        alert("Student has a bed.Select UPDATE button");
        window.location.href = "godavari.jsp";</script>
        <%        } else {

            PreparedStatement ps = con.prepareStatement("update godavari set bedstatus=? where bedno=? and floorno=?");
            ps.setString(1, "inactive");
            ps.setString(2, bedno);
            ps.setInt(3, floor);
            int i = ps.executeUpdate();
            if (i > 0) {

                PreparedStatement ps3 = con.prepareStatement("insert into studentstay(rno,hostelname,floorno,roomno,bedno) values(?,?,?,?,?)");
                ps3.setString(1, rno);
                ps3.setString(2, hname);
                ps3.setInt(3, floor);
                ps3.setInt(4, roomno);
                ps3.setString(5, bedno);
                ps3.executeUpdate();

        %>
    <script>
        alert("Sucessfully Alotted");
        window.location.href = "godavari.jsp";
    </script>
    <%  } else {
    %>
    <script>
        alert("Allotment failed.Try Again");
        window.location.href = "godavari.jsp";
    </script>
    <%
            }

        }
    } else if (selected.equalsIgnoreCase("UPDATE")) {

        PreparedStatement ps4 = con.prepareStatement("select * from studentstay where rno=?");
        ps4.setString(1, rno);
        ResultSet rs2 = ps4.executeQuery();
        if (rs2.next()) {

            PreparedStatement ps7 = con.prepareStatement("select bedno,floorno,roomno,hostelname from studentstay where rno=?");
            ps7.setString(1, rno);
            ResultSet rs3 = ps7.executeQuery();
            if (rs3.next()) {
                sbno = rs3.getString(1);
                sfno = rs3.getString(2);
                srno = rs3.getString(3);
                shm = rs3.getString(4);
            }

            PreparedStatement ps5 = con.prepareStatement("UPDATE studentstay SET hostelname = ?, floorno = ?, roomno = ?, bedno = ? WHERE rno = ?");
            ps5.setString(1, hname);
            ps5.setInt(2, floor);
            ps5.setInt(3, roomno);
            ps5.setString(4, bedno);
            ps5.setString(5, rno);
            int i = ps5.executeUpdate();

            if (i > 0) {
                String Query = "update `" + shm + "` set bedstatus=? where bedno=? and floorno=?";
                PreparedStatement ps6 = con.prepareStatement(Query);
                ps6.setString(1, "active");
                ps6.setString(2, sbno);
                ps6.setString(3, sfno);
                ps6.executeUpdate();

                PreparedStatement ps8 = con.prepareStatement("update godavari set bedstatus=? where bedno=? and floorno=?");
                ps8.setString(1, "inactive");
                ps8.setString(2, bedno);
                ps8.setInt(3, floor);
                ps8.executeUpdate();
    %>
    <script>
        alert("Successfully Updated");
        window.location.href = "godavari.jsp";
    </script>
    <%
    } else {
    %>
    <script>
        alert("Updation failed");
        window.location.href = "godavari.jsp";
    </script>
    <%
        }

    } else {
    %>
    <script>
        alert("Student doesn't have a bed.Select ALLOT button");
        window.location.href = "godavari.jsp";</script>
        <%
                }
            }

        } else {
        %>
    <script>
        alert("Student Details with the Roll No. Doesn't exist or The student is a girl.");
        window.location.href = "godavari.jsp";
    </script>
    <%
            }

            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>
</html>
