<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Content</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>
	<jsp:include page="shared_jsp/header.jsp" />

	<div class="container">
		<jsp:include page="shared_jsp/nav.jsp" />

		<div class="main-container">
			<div class="cards">
				<form action="attemptCreateTopic.do" method="POST">

					Topic Title: <input type="text" name="title"><br>
					<textarea rows="10" cols="50" id="createContent" name="content">Write something here</textarea>
					<br> Resource Title: <input type="text" name="resourceTitle"><br>
					Resource Link: <input type="url" name="resourceURL"><br>
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
</html>