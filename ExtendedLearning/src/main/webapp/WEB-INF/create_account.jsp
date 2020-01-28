<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<article class="containergrid">
		<jsp:include page="shared_jsp/nav.jsp" />
		<!-- TODO: SEND USERNAME/PASSWORD TO USER TABLE
SEND FIRSTNAME LASTNAME EMAIL, IMAGE, JOB TITLE, ABOUT TO PROFILE TABLE
 -->
		<div class="main-container">
			<c:if test="${not empty fail }">
				<h4>${fail }</h4>
			</c:if>
		
			<c:if test="${profile.id == 0 or profile == null}">
				<form action="createAccount.do" method="POST">
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
						<div class="form-group">
							<label for="image">Image URL: </label> <input type="url"
								name="image" id="image" class="form-control" />
						</div>
						<input type="submit" value="Create Account"
							class="btn btn-primary" />
					</fieldset>
				</form>
			</c:if>

			<!-- if updating account -->
			<c:if test="${profile.user != null}">
				<form action="updateAccount.do" method="POST">
					<fieldset>
						<legend>Update Account Details</legend>
						<div class="form-group">
							<label for="username">Desired Username: </label> <input
								type="text" value="${profile.user.username}" name="username"
								id="username" class="form-control" required />
						</div>
						<div class="form-group">
							<label for="password">Desired Password: </label> <input
								type="password" value="${profile.user.password}" name="password"
								id="password" class="form-control" required />
						</div>
						<div class="form-group">
							<label for="firstName">First Name: </label> <input type="text"
								name="firstName" value="${profile.firstName}" id="firstName"
								class="form-control" required />
						</div>
						<div class="form-group">
							<label for="lastName">Last Name: </label> <input type="text"
								name="lastName" value="${profile.lastName}" id="lastName"
								class="form-control" required />
						</div>
						<div class="form-group">
							<label for="email">Email Address: </label> <input type="text"
								name="email" value="${profile.email}" id="email"
								class="form-control" required />
						</div>
						<div class="form-group">
							<label for="jobTitle">Job Title: </label> <input type="text"
								name="jobTitle" value="${profile.jobTitle}" id="jobTitle"
								class="form-control" />
						</div>
						<div class="form-group">
							<!--find a way to save bio  -->
							<label for="about">Biography: </label>
							<textarea name="about" id="about" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label for="image">Image URL: </label> <input type="url"
								name="image" value="${profile.image.imageUrl}" id="image"
								class="form-control" />
						</div>

						<input type="submit" value="Update Account"
							class="btn btn-primary" />
					</fieldset>
				</form>
			</c:if>




		</div>


	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>