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

		<div class="main-container">
			<div class="cards">
				<form class="form-inline" action="showTopicsBySearch.do"
					method="POST">
					<input class="form-control mr-sm-2" type="text" name="keyword"
						placeholder="Search" aria-label="Search" />
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search
						Topics</button>
				</form>

				<c:if test="${not empty topics}">
					<div class="container">
						<div class="row">
							<c:forEach var="topic" items="${topics}">
								<div class="col-sm">
									<div class="card">
										<div class="card-header">${topic.title }</div>
										<div class="card-body">
											<form action="showSingleTopic.do" method="GET">
												<input type="hidden" value="${topic.id}" name="topicId" />
												<button type="submit" class="btn btn-info">View</button>
											</form>
											<div class="card-footer text-muted">Created: ${topic.createdAt}</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>

	</article>



	<footer>
		<jsp:include page="shared_jsp/footer.jsp" />
	</footer>


	<jsp:include page="shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>