<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!DOCTYPE html>

<!--Top style nav bar for account information  -->
		<nav class="navbar fixed-top navbar-expand-md navbar-dark bg-dark">
			<a class="navbar-brand" href="home.do">SD-ELP<i class="fas fa-home"></i></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    				<span class="navbar-toggler-icon"></span>
  				</button>
  				
  			<div class="collapse navbar-collapse" id="navbarSupportedContent">	
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="showAllTopics.do">Article Index</a>
				</li>
				<!-- prompted to login or create an account -->
				<c:choose>
					<c:when test="${profile.id == 0 or profile == null}">
						<li class="nav-item">
							<a class="nav-link" href="showCreateAccount.do"><i class="fas fa-plus-square"></i> Create Account</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="showLogin.do"><i class="fas fa-user"></i>
								Log In</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a class="nav-link" href="userHome.do"><c:out value="Welcome, ${profile.firstName} ${profile.lastName}" /></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="createPost.do"><i class="fas fa-clipboard"></i> Create an Article</a>
						</li>
						<c:if test="${profile.user.role == 'ADMIN' }">
							<li class="nav-item">
								<a class="nav-link" href="showAdminPage.do">Admin</a>
							</li>
						</c:if>
						<li class="nav-item">
							<a class="nav-link" href="logout.do"><i class="fas fa-sign-out-alt"></i>
								Log Out</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			</div>
			
			
		</nav>
