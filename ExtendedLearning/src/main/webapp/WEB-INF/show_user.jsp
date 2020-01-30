<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />
<link rel="stylesheet" href="css/profile-page.css">
</head>
<body>

	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

	<article class="containergrid">


		<jsp:include page="shared_jsp/nav.jsp" />


		<div class="main-container">

			<div class="container emp-profile">
				<form method="post" action="showUpdateAccount.do">
					<div class="row">
						<div class="col-md-4">
							<div class="profile-img">
								<img alt="image" src="${otherProfile.image.imageUrl}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="profile-head">
								<h5>${otherProfile.firstName }</h5>
								<h6>${otherProfile.jobTitle }</h6>
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="home-tab" data-toggle="tab" href="#home" role="tab"
										aria-controls="home" aria-selected="true">Contact </a></li>

								</ul>
							</div>
						</div>
						<div class="col-md-2"></div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="profile-work">
								<p>ABOUT</p>
								<a>${otherProfile.about }</a>
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
											<p>${otherProfile.user.username}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>First Name</label>
										</div>
										<div class="col-md-6">
											<p>${otherProfile.firstName }</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Last Name</label>
										</div>
										<div class="col-md-6">
											<p>${otherProfile.lastName }</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Email</label>
										</div>
										<div class="col-md-6">
											<p>${otherProfile.email }</p>
										</div>
									</div>
								</div>

								<!--display under View History  -->
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>



	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>