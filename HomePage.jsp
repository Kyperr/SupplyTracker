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
<title>Insert title here</title>
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/supplytracker", "root",
				"password");

		Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery("select * from item");
	%>

	<TABLE BORDER="1">
		<TR>
			<TH>ID</TH>
			<TH>Name</TH>
			<TH>Description</TH>
			<TH>Price</TH>
			<TH>Model_ID</TH>
			<TH>Category_ID</TH>
			<TH>Warehouse_ID</TH>
		</TR>
		<%
			while (resultset.next()) {
		%>
		<TR>
			<TD><%=resultset.getString(1)%></td>
			<TD><%=resultset.getString(2)%></TD>
			<TD><%=resultset.getString(3)%></TD>
			<TD><%=resultset.getString(4)%></TD>
			<TD><%=resultset.getString(5)%></TD>
			<TD><%=resultset.getString(6)%></TD>
			<TD><%=resultset.getString(7)%></TD>
		</TR>
		<%
			}
		%>
	</TABLE>

</body>
</html>