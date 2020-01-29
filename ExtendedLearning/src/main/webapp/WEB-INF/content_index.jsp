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



			<div class="cards">
				<div class="row">
					<form class="form-inline" action="showTopicsBySearch.do"
						method="POST">
						<input class="form-control mr-sm-2" type="text" name="keyword"
							placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search
							Topics</button>
					</form>
				</div>
				
				<c:if test="${not empty topics}">
				<div class="row">
					<c:forEach var="topic" items="${topics}">
						<div class="card" style="width:200px">
							<div class="card-body">
								<form action="showSingleTopic.do" method="GET">
									<h5 class="card-title">${topic.title }</h5>
									<p class="card-text">Created: ${topic.createdAt}</p>
									<input type="hidden" value="${topic.id}" name="topicId" />
									<button type="submit" class="btn btn-primary">View</button>
								</form>
							</div>
						</div>


					</c:forEach>
				</div>
				</c:if>
			</div>




	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>