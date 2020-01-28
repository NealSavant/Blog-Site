<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
</head>
<body>

	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

	<article class="containergrid">


		<jsp:include page="shared_jsp/nav.jsp" />


		<div class="main-container">
			<c:if test="${profile != null}">
				<div class="profile-info">
					<div class="profile-image">
						<img alt="image" src="${profile.image.imageUrl}" width="300px"
							height="300px">
					</div>

					<a>Username: ${profile.user.username }</a> <a>First Name:
						${profile.firstName }</a> <a>Last Name: ${profile.lastName }</a> <a>Email:
						${profile.email }</a> <br> <a>Job Title: ${profile.jobTitle }</a>
					<a>Biography: ${profile.about }</a>

					<form action="showUpdateAccount.do" method="POST">
						<button type="submit" class="btn btn-info">Update Account</button>
					</form>

				</div>


				<div class="profile-logs">
					<c:if test="${logs != null }">
						<table class="table table-striped">
							<thead class="thead-light">
								<tr>
									<th scope="col">Topic Title</th>
									<th scope="col">Date visited</th>
								</tr>
							</thead>
							<c:forEach var="log" items="${logs }">

								<tbody>
									<tr>
										<td scope="row">${log.topic.title }</td>
										<td scope="row">viewed at: ${log.timeStamp }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>


				</div>
			</c:if>
		</div>



	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>