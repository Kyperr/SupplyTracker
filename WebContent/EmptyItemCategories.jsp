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

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/supplytracker", "root",
				"password");

		Statement statement = connection.createStatement();
		String queryString = "SELECT ic.id, ic.name Category FROM ItemCategory ic WHERE ic.name NOT IN "
				+ "(SELECT DISTINCT(ic2.name) FROM ItemCategory ic2 JOIN Item i ON i.category_id = ic2.id);";

		System.out.println(queryString);
		ResultSet resultset = statement.executeQuery(queryString);
	%>

	<TABLE BORDER="1">
		<TR>
			<TH>Category ID</TH>
			<TH>Category Name</TH>
		</TR>
		<%
			while (resultset.next()) {
		%>
		<TR>
			<TD><%=resultset.getString(1)%></td>
			<TD><%=resultset.getString(2)%></TD>
		</TR>
		<%
			}
		%>
	</TABLE>
	<a href="Home.jsp">Back To Home</a>
</body>
</html>