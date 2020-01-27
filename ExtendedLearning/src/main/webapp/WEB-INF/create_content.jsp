<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Content</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>
	<jsp:include page="shared_jsp/header.jsp" />

	<div class="container">
		<jsp:include page="shared_jsp/nav.jsp" />

		<div class="main-container">
			<div class="cards">
				<form action="attemptCreateTopic.do" method="POST">
					<label for="title">Title</label><br><input type="text" name="title"><br>
					<textarea rows="10" cols="50" id="createContent" name="content">Write something here</textarea><br>
					<label>Resources</label><br><input type="text" name="resourceTitle" placeholder="title"><input type="url" name="resourceUrl" placeholder="resource url"><br>
					<label>Resources</label><br><input type="text" name="resourceTitle" placeholder="title"><input type="url" name="resourceUrl" placeholder="resource url"><br>
					<label>Resources</label><br><input type="text" name="resourceTitle" placeholder="title"><input type="url" name="resourceUrl" placeholder="resource url"><br>
				<!-- 	<label for="image">Link an Image</label><br><input type="url" name="image" placeholder="optional"> --><!-- <input type="file" id="snippet" name="image" accept="image/png, image/jpeg"><br> -->
					<input type="submit" value="Post">
				</form>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />

</body>
<style>

</style>
</html>