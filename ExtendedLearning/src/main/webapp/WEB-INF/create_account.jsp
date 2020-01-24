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

	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

	<article>
		<div class="nav-wrapper">
			<jsp:include page="shared_jsp/nav.jsp" />
		</div>
<!-- TODO: SEND USERNAME/PASSWORD TO USER TABLE
SEND FIRSTNAME LASTNAME EMAIL, IMAGE, JOB TITLE, ABOUT TO PROFILE TABLE
 -->
		<div class="form-container">
			<form action="TODO" method="POST">
				<fieldset>
					<legend>Create Account</legend>
					<div class="form-group">
						<label for="username">Desired Username: </label> <input type="text"
							name="username" id="username" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Desired Password: </label> <input type="password"
							name="password" id="password" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">First Name: </label> <input type="password"
							name="password" id="password" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Last Name: </label> <input type="password"
							name="password" id="text" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Email Address: </label> <input type="password"
							name="password" id="text" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Job Title: </label> <input type="password"
							name="password" id="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Biography: </label> <input type="password"
							name="password" id="text" class="form-control" />
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