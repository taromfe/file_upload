<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Uploaded</title>
</head>
<body>
<%
String savedFileFolder = "C:\\Temp\\uploaded";
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File("C:\\Temp\\uploaded"));
ServletFileUpload upload = new ServletFileUpload(factory);
String contentType = request.getContentType();
try {
	List fileItems = upload.parseRequest(request);
	Iterator i = fileItems.iterator();
	while (i.hasNext()) {
		FileItem fi = (FileItem) i.next();
		if (!fi.isFormField()) {
			String fieldName = fi.getFieldName();
			String fileName = fi.getName();
			boolean isInMemory = fi.isInMemory();
			long sizeInBytes = fi.getSize();
			String savedFilePath = "";
			if (fileName.lastIndexOf("\\") >= 0) {
				savedFilePath = savedFileFolder + "\\" + fileName.substring(fileName.lastIndexOf("\\"));
			} else if (fileName.lastIndexOf("/") >= 0) {
				savedFilePath = savedFileFolder + "\\" + fileName.substring(fileName.lastIndexOf("/"));
			} else {
				savedFilePath = savedFileFolder + "\\" + fileName;
			}
			fi.write(new File(savedFilePath));
%>
<div><%= fileName %> was uploaded and saved as <%= savedFilePath %>.</div>
<%
		}
	}
} catch (Exception e) {
%>
<div>ERROR: <%= e.getMessage() %></div>
<%
}
%>
<div><a href="./">back to the top page</a></div>
</body>
</html>