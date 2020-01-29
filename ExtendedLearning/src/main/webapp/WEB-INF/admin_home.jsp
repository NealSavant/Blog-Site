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

	<jsp:include page="shared_jsp/header.jsp" />


	<article class="containergrid">

		<jsp:include page="shared_jsp/nav.jsp" />

		<div class="main-container">

			<div class="row">
				<div class="col-md-6">
					<h4>User Management</h4>
					<div class="profile-logs">
						<c:if test="${logs != null }">
							<table class="table table-striped">

								<thead class="thead-light">
									<tr>
										<th scope="col">User Profile</th>
										<th scope="col">User Enabled</th>
										<th scope="col">Toggle Status</th>
									</tr>
								</thead>
								<c:forEach var="user" items="${users }">

									<tbody>
										<tr>
											<td scope="row"><a href="showUser.do?uid=${user.id}">${user.username }</a></td>
											<td scope="row">${user.active }</td>
											<td scope="row"><c:if test="${user.active }">
													<form action="disableUser.do" method="GET">
														<input type="hidden" name="uid" value="${user.id }">
														<button class="btn btn-outline-danger" type="submit">Disable
														</button>
													</form>
												</c:if> <c:if test="${not user.active }">
													<form action="enableUser.do" method="GET">
														<input type="hidden" name="uid" value="${user.id }">
														<button type="submit" class="btn btn-outline-success">Enable</button>
													</form>
												</c:if></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</c:if>


					</div>



				</div>

			</div>
		</div>



	</article>


	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>

	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>