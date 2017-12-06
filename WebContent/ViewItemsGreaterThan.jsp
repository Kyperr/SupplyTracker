<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supply Tracker</title>
<style><%@include file="/WEB-INF/styles.css"%></style>
</head>
<body>

	<h4>
		This page shows the items whose price is greater than the value entered. 
	</h4>

	
	<form action="ViewItemsGreaterThan" method="post">
		<input type="text" name="minValue" value="${minValue}" /><input
			type="SUBMIT" />
	</form>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/supplytracker", "root",
				"password");

		if (request.getAttribute("minValue") == null) {
			request.setAttribute("minValue", "0.0");
		}
		Statement statement = connection.createStatement();
		String queryString = "SELECT item.id, item.name, item.description, item.price FROM item WHERE item.price > "
				+ request.getAttribute("minValue");

		System.out.println(queryString);
		ResultSet resultset = statement.executeQuery(queryString);
	%>

	<TABLE BORDER="1">
		<TR>
			<TH>ID</TH>
			<TH>Name</TH>
			<TH>Description</TH>
			<TH>Price</TH>
		</TR>
		<%
			while (resultset.next()) {
		%>
		<TR>
			<TD><%=resultset.getString(1)%></td>
			<TD><%=resultset.getString(2)%></TD>
			<TD><%=resultset.getString(3)%></TD>
			<TD><%=resultset.getString(4)%></TD>
		</TR>
		<%
			}
		%>
	</TABLE>
	<a href="Home.jsp">Back To Home</a>
</body>
</html>