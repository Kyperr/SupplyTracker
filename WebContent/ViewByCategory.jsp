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
		String queryString = "SELECT item.name, item.description, item.price, "
				+ "itemcategory.name "
				+ "FROM item JOIN itemcategory ON item.category_id = itemcategory.id";
		String filter = request.getParameter("filter"); 
		if (filter != "All") {
			queryString += "  WHERE itemcategory.name = " + filter;
		}

		ResultSet resultset = statement.executeQuery(queryString);
	%>

	<TABLE BORDER="1">
		<TR>
			<TH>ID</TH>
			<TH>Name</TH>
			<TH>Description</TH>
			<TH>Price</TH>
			<TH>Model_ID</TH>
			<TH>Category</TH>
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
		</TR>
		<%
			}
		%>
	</TABLE>

	<!-- A drop down menu to select the items from. -->
	<!-- Setting up connection: -->
	<%
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/supplytracker", "root", "password");

		statement = connection.createStatement();
		resultset = statement.executeQuery("SELECT name FROM itemcategory");
	%>

	<form action="HomePage.jsp">
		<select name="filter">
			<option value="All">All</option>
			<%
				while (resultset.next()) {
					String value = resultset.getString(1);
			%>
			<option value="<%=value%>"><%=value%></option>
			<%
				}
			%>

		</select>
	</form>

</body>
</html>