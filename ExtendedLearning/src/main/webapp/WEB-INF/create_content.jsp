<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Content</title>
</head>
<body>
	<form action="attemptCreateTopic.do" method="POST">

Topic Title: <input type="text" name="title"><br>
<textarea rows="10" cols="50" id="createContent" name="content">Write something here</textarea><br>

Resource Title: <input type="text" name="resourceTitle"><br>
Resource Link: <input type="url" name="resourceURL"><br>
<input type="submit" value="Post">
</form>
		Topic Title: <input type="text" name="title"><br>
		<textarea rows="10" cols="50" id="createPost" name="content">Write something here</textarea>
		<br> Resource Title: <input type="text" name="title"><br>
		<input type="url" name="resourceURL"><br> <input
			type="url" name="resourceURL"><br> <input type="url"
			name="resourceURL"><br> <input type="url"
			name="resourceURL"><br> <input type="submit"
			value="Post">
	</form>
</body>
</html>