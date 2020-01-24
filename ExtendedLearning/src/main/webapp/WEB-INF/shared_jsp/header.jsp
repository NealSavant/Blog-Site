<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!DOCTYPE html>

<!--Static title at top of every page  -->
<div class="container" >
	<div class="row">
		<h2>SD Extended Learning Platform</h2>
	</div>
	<div class="row">
		<a>Take your Full Stack development skill to new levels.</a>
	</div>

</div>

<!--Top style nav bar for account information  -->
<div class="container">
	<div class="row">
		<nav class="header-nav">
			<ul class="main-header-list">
				<li><a href="home.do"><i class="fas fa-home"></i> Home</a></li>
				
				<c:if test="${user.profile  }">
				<li><a href="createAccount.do"><i class="fas fa-plus-square"></i> Create
						Account</a></li>
				<li><a href="showLogin.do"><i class="fas fa-user"></i> Log In</a></li>
			</ul>
			</c:if>
		</nav>
	</div>
</div>