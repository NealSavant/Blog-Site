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

	<article>
		<div class="nav-wrapper">
			<jsp:include page="shared_jsp/nav.jsp" />
		</div>

		<div class="form-container">
			<form action="login.do" method="POST">
				<fieldset>
					<div class="form-group">
						<label for="username">Username: </label> <input type="text"
							name="username" id="username" class="form-control" required />
					</div>
					<div class="form-group">
						<label for="password">Password: </label> <input type="password"
							name="password" id="password" class="form-control" required />
					</div>
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