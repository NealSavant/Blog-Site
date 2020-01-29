<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Content</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />

</head>

	<jsp:include page="shared_jsp/header.jsp" />

<body>

		<form action="attemptUpdateTopic.do" method="POST">
			<input type="hidden" value="${topic.id}" name="tid"> 
			<label for="title">Title</label>
				<br> 
			<input type="text" name="title" value="${topic.title}">
				<br> 
			<input type="hidden" value="${content.id}" name="cid">
			<textarea rows="10" cols="50" id="createContent" name="content">
				<c:forEach var="content" items="${topic.contents}">
					${content.content}
				</c:forEach>
			</textarea>

			<br> 
			<label>Resources</label>
			<br>
			<c:forEach var="resource" items="${topic.resources}">
				<input type="text" name="resourceTitle" value="${resource.title}">
				<input type="url" name="resourceUrl" value="${resource.resourceUrl}">
				<br>
			</c:forEach>
			<!-- 	<label for="image">Link an Image</label><br><input type="url" name="image" placeholder="optional"> -->
			<!-- <input type="file" id="snippet" name="image" accept="image/png, image/jpeg"><br> -->
			<input type="submit" value="Update">
		</form>
</body>
</html>