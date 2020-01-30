<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!DOCTYPE html>

<!--Static title at top of every page  -->
<header class="main-header">
	<div class="container">
		<div class="row">
			<h2>SD Extended Learning Platform</h2>
		</div>
		<div class="row">
			<a>Take your Full Stack development to new levels.</a>
		</div>

	</div>
</header>

<!--Top style nav bar for account information  -->
<div class="fixed-container">
	<div class="row">
		<nav class="header-nav">
			<ul class="main-header-list">
				<li><a href="home.do"><i class="fas fa-home"></i> Home</a></li>
				<!-- prompted to login or create an account -->
				<c:choose>
					<c:when test="${profile.id == 0 or profile == null}">
						<li><a href="showAllTopics.do"><i class="fas fa-book"></i>
								Article Index</a></li>
						<li><a href="showCreateAccount.do"><i
								class="fas fa-plus-square"></i> Create Account</a></li>
						<li><a href="showLogin.do"><i class="fas fa-user"></i>
								Log In</a></li>

					</c:when>
					<c:otherwise>

						<li><a href="showAllTopics.do"><i class="fas fa-book"></i>
								Article Index</a></li>

						<li><a href="createPost.do"><i class="fas fa-clipboard"></i>
								Create an Article</a></li>
						<c:if test="${profile.user.role == 'ADMIN' }">
							<li><a href="showAdminPage.do"><i
									class="fas fa-users-cog"></i> Admin Panel</a></li>
						</c:if>
						<li><a href="userHome.do"><i class="fas fa-user"></i>
								Profile</a></li>
						<li><a href="logout.do"><i class="fas fa-sign-out-alt"></i>
								Log Out</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</div>