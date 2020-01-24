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
						<label for="username">Desired Username: </label> <input
							type="text" name="username" id="username" class="form-control"
							required />
					</div>
					<div class="form-group">
						<label for="password">Desired Password: </label> <input
							type="password" name="password" id="password"
							class="form-control" required />
					</div>
					<div class="form-group">
						<label for="firstName">First Name: </label> <input type="text"
							name="firstName" id="firstName" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="lastName">Last Name: </label> <input type="text"
							name="lastName" id="lastName" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="email">Email Address: </label> <input type="text"
							name="email" id="email" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="jobTitle">Job Title: </label> <input type="text"
							name="jobTitle" id="jobTitle" class="form-control" />
					</div>
					<div class="form-group">
						<label for="about">Biography: </label>
						<textarea name="about" id="about" class="form-control"></textarea>
					</div>
					<input type="submit" value="Create Account" class="btn btn-primary" />
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