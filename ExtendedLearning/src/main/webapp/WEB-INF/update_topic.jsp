<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Content</title>
</head>
<body>
	<form action="attemptUpdateTopic.do">
		<label for="title">Title</label><br>
		<input type="text" name="title" value="${topic.title}"><br>
		<input type="submit" value="Update">
	</form>
</body>
</html>