<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Resource</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>
	<jsp:include page="shared_jsp/header.jsp" />


	<article class="containergrid">
		<jsp:include page="shared_jsp/nav.jsp" />
		<div class="main-container">
			<h4>Adding Resource to ${topic.title}</h4>
			<hr>
			<form action="" method="POST">

				<br>
				<h6>Resource</h6><br>
				<h6><label for="title">Describe URL</label></h6> <input type="text"
					id="title" name="resourceTitle"> <input type="url"
					name="resourceUrl"> <br>
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