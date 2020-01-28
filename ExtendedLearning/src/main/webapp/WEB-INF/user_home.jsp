<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>

<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
<link rel="stylesheet" href="/css/profile-page.css">
</head>
<body>

	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

	<article class="containergrid">


		<jsp:include page="shared_jsp/nav.jsp" />


		<div class="main-container">

			<div class="container emp-profile">
				<form method="post" action = "showUpdateAccount.do">
					<div class="row">
						<div class="col-md-4">
							<div class="profile-img">
								<c:choose>
									<c:when test="${profile.image.imageUrl != null}">
										<img alt="image" src="${profile.image.imageUrl}">
										<div class="file btn btn-lg btn-primary">
											Change Photo <input type="file" name="file" />
										</div>
									</c:when>
									<c:when test="${profile.image.imageUrl == null }">
										<img alt="image" src="https://imgur.com/m7LFcq8">
										<div class="file btn btn-lg btn-primary">
											Change Photo <input type="file" name="file" />
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
						<div class="col-md-6">
							<div class="profile-head">
								<h5>${profile.firstName }</h5>
								<h6>${profile.jobTitle }</h6>
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="home-tab" data-toggle="tab" href="#home" role="tab"
										aria-controls="home" aria-selected="true">Account Information</a></li>
									<li class="nav-item"><a class="nav-link" id="profile-tab"
										data-toggle="tab" href="#profile" role="tab"
										aria-controls="profile" aria-selected="false">View History</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2">
								<input type="submit" class="profile-edit-btn" name="btnAddMore"
									value="Edit Profile" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="profile-work">
								<p>ABOUT</p>
								<a>${profile.about }</a>
							</div>
						</div>
						<div class="col-md-8">
							<div class="tab-content profile-tab" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row">
										<div class="col-md-6">
											<label>Username</label>
										</div>
										<div class="col-md-6">
											<p>${profile.firstName}${profile.lastName }</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Name</label>
										</div>
										<div class="col-md-6">
											<p>${profile.firstName}${profile.lastName }</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Email</label>
										</div>
										<div class="col-md-6">
											<p>${profile.email }</p>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<div class="row">
										<div class="col-md-6">
											<label>Recently Viewed Articles</label>
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



										</div>

									</div>

								</div><!--display under View History  -->
							</div>
						</div>
					</div>
				</form>
			</div>
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