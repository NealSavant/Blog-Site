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
			<div class="cards">


				<h3>${topic.title}</h3>
				<c:if test="${profile.id != null }">
					<!-- any logged in user can update a page right now -->
					<form action="showUpdateTopic.do">
						<c:forEach var="content" items="${topic.contents}">

							<input type="hidden" value="${content.id}" name="cid">
							<!--pass content id into content update page  -->
							<button type="submit" class="btn btn-primary">Update
								Page</button>
						</c:forEach>
					</form>
				</c:if>

				<c:forEach var="content" items="${topic.contents}">
					<p>${content.content}</p>
				</c:forEach>
				<p>Last Updated: ${topic.updatedAt}</p>


				<!-- display comments below content -->
				<div class="commentSection">
					<c:if test="${not empty topic.topicComments}">
						<c:forEach var="comment" items="${topic.topicComments}">
							<c:if test="${comment.active }">
								<div class="userComment">
									<div class="commentAuthor">${comment.user.username }
										<span class="commentDateTime"> ${comment.createdAt}</span>
									</div>
									<div class="commentTitle">${comment.title}</div>
									<div class="commentContent">${comment.content }</div>


								</div>
								<c:if test="${profile.user.role == 'ADMIN' }">
									<div>
										<form action="hideComment.do" method="GET">
											<input type="hidden" name="cid" value="${comment.id }">
											<input type="submit" value="Hide this comment" />
										</form>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>


					<!-- foreach topic_comment where topic.id == topic_comment.topic_id -->
					<c:if test="${profile.id == null}">
						<p>Log in to leave a comment!</p>
					</c:if>
					<c:if test="${profile.id != null}">
						<p>Leave a comment!</p>
						<form action="addComment.do" method="POST">

							<label for="title">Add a title:</label>
							<textarea class="form-control" rows="1" cols="25" name="title"
								id="title"></textarea>
							<label for="title">Comment:</label>
							<textarea class="form-control" rows="5" cols="50" name="comment"
								id="comment"></textarea>
							<input type="hidden" value="${topic.id }" name="topicId" /> <label
								for="button">Commenting as <a>${profile.firstName}</a>
							</label>
							<button type="submit" class="btn btn-primary">Post</button>
						</form>
					</c:if>
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