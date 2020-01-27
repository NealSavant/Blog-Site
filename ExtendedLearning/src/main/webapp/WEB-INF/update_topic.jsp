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
		<textarea rows="10" cols="50" id="createContent" name="content" value></textarea>
		<br> <label>Resources</label><br>
		<input type="text" name="resourceTitle" placeholder="title"><input
			type="url" name="resourceUrl" placeholder="resource url"><br>
		<label>Resources</label><br>
		<input type="text" name="resourceTitle" placeholder="title"><input
			type="url" name="resourceUrl" placeholder="resource url"><br>
		<label>Resources</label><br>
		<input type="text" name="resourceTitle" placeholder="title"><input
			type="url" name="resourceUrl" placeholder="resource url"><br>
		<!-- 	<label for="image">Link an Image</label><br><input type="url" name="image" placeholder="optional"> -->
		<!-- <input type="file" id="snippet" name="image" accept="image/png, image/jpeg"><br> -->
		<input type="submit" value="Update">
	</form>
</body>
</html>