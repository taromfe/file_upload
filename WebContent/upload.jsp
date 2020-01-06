<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.nio.file.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Uploaded</title>
</head>
<body>
<%
String savedFileFolder = "C:\\Temp\\uploaded";
Part filePart = request.getPart("file");
String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
%>
<div><%= fileName %> was uploaded.</div>
<%
InputStream fileContent = filePart.getInputStream();
String savedFileName = savedFileFolder + "\\" + fileName;
try {
	byte[] buf = new byte[1024];
	FileOutputStream fos = new FileOutputStream(savedFileName);
	while (true) {
		int n = fileContent.read(buf);
		if (n < 0) {
			break; // EOF
		}
		fos.write(buf, 0, n);
	}
	fos.close();
	fileContent.close();
%>
	<div>The file was saved as <%= savedFileName %></div>
<%
} catch (Exception e) {
%>
<div>ERROR: <%= e.getMessage() %></div>
<%
}
%>
<div><a href="./">back to the top page</a></div>
</body>
</html>