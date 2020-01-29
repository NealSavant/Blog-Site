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

	<header class="main-header">
		<jsp:include page="shared_jsp/header.jsp" />
	</header>

<body style="padding-top: 65px">


			<div class="cards">
				
				<div class="container">
					<div class="d-flex justify-content-end">
						<form class="form-inline" action="showTopicsBySearch.do"
							method="POST">
							<div class="row">
								<div class="col">
									<input class="form-control" type="text" name="keyword"
										placeholder="Search Keyword" aria-label="Search" />
								</div>
								<div class="col">
									<button class="btn btn-outline-success" type="submit">Search
										Topics</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				
				
				
				<c:if test="${not empty topics}">
					<div class="row">
						<c:forEach var="topic" items="${topics}">
							<div class="col">
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