<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form action="./upload.jsp" method="post" enctype="multipart/form-data"><div>
<lable for="file">Choose a file to be uploaded.</lable>
<input type="file" id="file" name="file"/>
</div>
<div><input type="submit" name="upload" value="upload"/></div>
</form>
</div>
</body>
</html>