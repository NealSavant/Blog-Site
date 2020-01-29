<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>

	<jsp:include page="shared_jsp/header.jsp" />

	<article class="containergrid">

		<div class="main-container">
			<form action="login.do" method="POST">
				<fieldset>
					<legend>Login</legend>
					<div class="form-group">
						<label for="username">Username: </label> <input type="text"
							name="username" id="username" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Password: </label> <input type="password"
							name="password" id="password" class="form-control" required />
					</div>
					<input type="submit" value="Login" class="btn btn-primary" />
				</fieldset>
			</form>



		</div>


	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>