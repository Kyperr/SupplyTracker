<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		DocumentBuilder db = dbf.newDocumentBuilder();

		String xmlPath = getServletContext().getRealPath("/WEB-INF/AvailablePages.xml");
		System.out.println(xmlPath);
		Document doc = db.parse(xmlPath);

		NodeList link = doc.getElementsByTagName("link_name");
		NodeList display = doc.getElementsByTagName("display_name");

		for (int i = 0; i < link.getLength(); i++) {
	%>
	<a href="<%=link.item(i).getFirstChild().getNodeValue()%>"><%=display.item(i).getFirstChild().getNodeValue()%></a>
	<br/>
	<%
		}
	%>

</body>
</html>