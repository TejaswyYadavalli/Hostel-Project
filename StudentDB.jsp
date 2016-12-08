<%-- 
    Document   : StudentDB
    Created on : 15-Sep-2015, 23:28:26
    Author     :  tejaswy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clerk Functions</title>
    </head>


    <%
        try {
            String selected = request.getParameter("b1clerk");
            Connection con = DB.getConnection();
            Statement stmt = con.createStatement();
            String rno = request.getParameter("Rno");
            String name = request.getParameter("Name");
            String address = request.getParameter("Address");
            String sphno = request.getParameter("Phno");
            String fname = request.getParameter("fName");
            String empdetails = request.getParameter("Emp");
            String fphno = request.getParameter("fPhno");
            String aincome = request.getParameter("Income");
            String admtest = request.getParameter("adm");
            String rank = request.getParameter("Rank");
            String state = request.getParameter("State");
            String country = request.getParameter("Country");
            String category = request.getParameter("Category");            
            String dob = request.getParameter("date");
            String mstatus = request.getParameter("Marital Status");
            String saadhar = request.getParameter("Aadhar");
            String faadhar = request.getParameter("fAadhar");
            String gender = request.getParameter("Gender");
            if (selected.equals("Insert")) {

                PreparedStatement ps = con.prepareStatement("select * from studentdetails where Rno=?");
                ps.setString(1, rno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
    %>
    <script>
        alert("Roll No. already exists.");
        window.location.href = "clerk.jsp";
    </script>
    <%--<jsp:include page="clerk.jsp"/>--%>
    <%
    } else {
        String qry = "insert into studentdetails(rno,name,address,sphno,fname,empdetails,fphno,aincome,admtest,rank,state,country,category,dob,mstatus,saadhar,faadhar,gender) values('" + rno + "','" + name + "','" + address + "','" + sphno + "','" + fname + "','" + empdetails + "','" + fphno + "','" + aincome + "','" + admtest + "','" + rank + "','" + state + "','" + country + "','" + category + "','" + dob + "','" + mstatus + "','" + saadhar + "','" + faadhar + "','" + gender + "')";
        int i = stmt.executeUpdate(qry);
        if (i > 0) {

    %>
    <script>
        alert("Successfully Inserted.");
        window.location.href = "clerk.jsp";
    </script>
    <%--<jsp:include page="clerk.jsp"/>--%>
    <%  } else {
    %>
    <script>
        alert("Insertion failed.");
        window.location.href = "clerk.jsp";
    </script>
    <%
            }
        }

    } else if (selected.equals("Retrieve")) {
        PreparedStatement ps = con.prepareStatement("select * from studentdetails where rno=? or name=? or address=? or sphno=? or fname=? or empdetails=? or fphno=? or aincome=? or admtest=? or rank=? or state=? or country=?  or category=? or dob=? or mstatus=? or saadhar=? or faadhar=? or gender=?");
        ps.setString(1, rno);
        ps.setString(2, name);
        ps.setString(3, address);
        ps.setString(4, sphno);
        ps.setString(5, fname);
        ps.setString(6, empdetails);
        ps.setString(7, fphno);
        ps.setString(8, aincome);
        ps.setString(9, admtest);
        ps.setString(10, rank);
        ps.setString(11, state);
        ps.setString(12, country);
        ps.setString(13, category);
        ps.setString(14, dob);
        ps.setString(15, mstatus);
        ps.setString(16, saadhar);
        ps.setString(17, faadhar);
        ps.setString(18, gender);

        ResultSet rs = ps.executeQuery();
    %>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="css/clerkfunctions_style.css" rel="stylesheet" type="text/css"/>
    <link href="css/StudentDetails_style.css" rel="stylesheet" type="text/css"/>
    <body>
        <div id="header">
            <nav class="nav">
                <div id="menu-list">
                    <ul class="list">

                        <li><a href="index.jsp" class="fa fa-home  w3-left" id="homeL" target="_self">Home</a></li>
                        <li><a href="clerk.jsp" id="PaymentLoginL" target="_self" class="fa w3-left">Clerk</a></li>
                        <li><a href="logout.jsp" class="fa w3-left">Logout</a></li>
                    </ul>
                </div>
            </nav>

            <div id="title">
                <H1>Clerk</h1>
            </div>

        </div>
        <nav class="main-nav" style="text-align: center; padding-top: 5px; color: #B0EBAD; font-size: 20px;">

            Student Details 
        </nav>
        <br /> 
        <br />


        <div id="content">

            <div id="StudentRegistration">
                <table id="table1" style="border:1px">

                    <tr>
                        <th id="style1">Roll No.</th>
                        <th id="style1">Name.</th>
                        <th id="style1">Address</th>
                        <th id="style1">S_Phone No</th>
                        <th id="style1">Father's Name</th>
                        <th id="style1">EmpDetails</th>
                        <th id="style1">F_Phone No</th>
                        <th id="style1">AnnualIncome</th>
                        <th id="style1">Adm Test</th>
                        <th id="style1">Rank</th>
                        <th id="style1">State</th>
                        <th id="style1">Country</th>
                        <th id="style1">Category</th>
                        <th id="style1">Gender</th>
                        <th id="style1">D.O.B</th>
                        <th id="style1">Married </th>
                        <th id="style1">S_Aadhar No</th>
                        <th id="style1">F_Aadhar No</th>


                    </tr>
                    <%
                        while (rs.next()) {
                    %>

                    <tr>
                        <td id="style1"><%=rs.getString(1)%></td>
                        <td id="style1"><%=rs.getString(2)%></td>
                        <td id="style1"><%=rs.getString(3)%></td>
                        <td id="style1"><%=rs.getString(4)%></td>
                        <td id="style1"><%=rs.getString(5)%></td>
                        <td id="style1"><%=rs.getString(6)%></td>
                        <td id="style1"><%=rs.getString(7)%></td>
                        <td id="style1"><%=rs.getString(8)%></td>
                        <td id="style1"><%=rs.getString(9)%></td>
                        <td id="style1"><%=rs.getString(10)%></td>
                        <td id="style1"><%=rs.getString(11)%></td>
                        <td id="style1"><%=rs.getString(12)%></td>
                        <td id="style1"><%=rs.getString(18)%></td>
                        <td id="style1"><%=rs.getString(13)%></td>
                        <td id="style1"><%=rs.getString(14)%></td>
                        <td id="style1"><%=rs.getString(15)%></td>
                        <td id="style1"><%=rs.getString(16)%></td>
                        <td id="style1"><%=rs.getString(17)%></td>
                        <td>
                            <div>
                                <form method ="Post" action="StudentUpdate.jsp" name="student1">
                                    <input type="hidden" name="studentupdate" value="<%=String.valueOf(rs.getString(1))%>">
                                    <input type="submit" class="styled-button-1" value="MODIFY">       
                                </form>
                            </div>
                        </td>
                    </tr>

                    <% } %>
                </table>
            </div>
        </div>
        <%
                    stmt.close();
                    con.close();

                }

            } catch (Exception e) {
                out.println(e);
            }
        %>  
</html>

