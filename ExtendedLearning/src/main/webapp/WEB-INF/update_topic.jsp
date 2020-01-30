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
<body>
		<jsp:include page="shared_jsp/header.jsp" />
	

	<article class="containergrid">
		<jsp:include page="shared_jsp/nav.jsp" />
		<div class="main-container">
			<form action="attemptUpdateTopic.do" method="POST">
				<input type="hidden" value="${topic.id}" name="tid">
				<h6>Title</h6>
				<input type="text" name="title" value="${topic.title}"><br>
				<input type="hidden" value="${content.id}" name="cid">
				<h6>Content</h6>
				<textarea rows="10" cols="50" id="createContent" name="content">
			<c:forEach var="content" items="${topic.contents}">${content.content}</c:forEach>
			</textarea>


				<br>
				<h6>Resources</h6>
				<c:forEach var="resource" items="${topic.resources}">
					<input type="text" name="resourceTitle" value="${resource.title}">
					<input type="url" name="resourceUrl"
						value="${resource.resourceUrl}">
					<br>
				</c:forEach>
				<h6>Link an Image</h6>
				<input type="url" name="image" placeholder="optional">
				<!-- <input type="file" id="snippet" name="image" accept="image/png, image/jpeg"><br> -->
				<input type="submit" value="Update">
			</form>
		</div>
	</article>
</body>
<style>
input, textarea {
    width: 80%;
    padding: 15px 22px;
    margin: 10px 5px;
    box-sizing: border-box;  
}
</style>
</html>