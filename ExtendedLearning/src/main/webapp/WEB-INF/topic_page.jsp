<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>
<jsp:include page="shared_jsp/jsp_scripts/styleTop.jsp" />

</head>
<body>

	<jsp:include page="shared_jsp/header.jsp" />




	<!-- Page Content -->
	<article class="containergrid">
		<jsp:include page="shared_jsp/nav.jsp" />
		<div class="main-container">
			<div class="content-container">
				<!-- Title -->
				<h1 class="title">${topic.title}</h1>
				<hr>

				<!-- Author 
			<p class="lead">
				by <a href="#">${user.username}</a>
			</p>

			<hr>

		
			<p>${topic.createdAt}</p>

			<hr>-->

				<%-- <!-- Preview Image -->
        <img class="img-fluid rounded" src="${topic.image.imageUrl}" alt="image"> --%>
				<c:forEach var="content" items="${topic.contents}">
					<p style="white-space: pre-line">${content.content}</p>
				</c:forEach>
				<hr>
			</div>




			<!-- Resources -->
			<div class="resources-container">
				<h3>Resources</h3>
				<c:forEach var="resource" items="${topic.resources}">
					<div class="row">
						<div class="col">
							<p>${resource.title}</p>
							<a href="${resource.resourceUrl}">${resource.resourceUrl}</a>
						</div>
						<div class="col">
							<p>image goes here</p>
						</div>
					</div>
				</c:forEach>
				<hr>
				<div class="resource-footer">
					<form action="addComment.do" method="POST">
						<textarea class="form-control" placeholder="write a comment..."
							rows="3" name="comment" id="comment"></textarea>
						<input type="hidden" value="${topic.id }" name="topicId" /> <br>
						<button type="submit" class="btn btn-info pull-right">Post</button>
					</form>

				</div>
			</div>



			<div class="comment-section">


				<!-- Comments Form -->
				<div class="row bootstrap snippets">
					<div class="col-md-6 col-md-offset-2 col-sm-12">
						<div class="comment-wrapper">
							<h3>Comment Section</h3>
							<div class="panel panel-info">
								<c:choose>
									<c:when test="${profile.id != null }">
										<div class="panel-heading">Leave a Comment as
											${profile.firstName}</div>
									</c:when>
									<c:otherwise>
										<div class="panel-heading">
											<h4>Login to add a comment!</h4>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="panel-body">
									<c:if test="${profile.id != null }">
										<form action="addComment.do" method="POST">
											<textarea class="form-control"
												placeholder="write a comment..." rows="3" name="comment"
												id="comment"></textarea>
											<input type="hidden" value="${topic.id }" name="topicId" />
											<br>
											<button type="submit" class="btn btn-info pull-right">Post</button>
										</form>
									</c:if>
									<div class="clearfix"></div>
									<hr>
									<ul class="media-list">
										<c:choose>
											<c:when test="${not empty topic.topicComments}">
												<c:forEach var="comment" items="${topic.topicComments}">
													<c:if test="${comment.active }">
														<li class="media"><a href="" class="pull-left"> <img
																src="" alt="" class="img-circle">
														</a>
															<div class="media-body">
																<span class="text-muted pull-right"> <small
																	class="text-muted">${comment.createdAt}</small>
																</span> <strong class="text-success"><a
																	href="showUser.do?uid=${comment.user.id }">${comment.user.username}</a></strong>
																<p>${comment.content }</p>
															</div> <c:if test="${profile.user.role == 'ADMIN' }">
																<div>

																	<form action="hideComment.do" method="GET">
																		<input type="hidden" name="cid" value="${comment.id }">
																		<input type="submit" class="btn btn-outline-danger"
																			value="Hide this comment" />
																	</form>

																</div>
															</c:if></li>

													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<li class="media">
													<div class="media-body">Start a comment thread!</div>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>

								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
			<!-- end of comment section -->

		</div>
		<!--end of main container (center of grid)  -->



		<!-- side widget -->
		<div class="nav-wrapper">
			<div class="sidewidget">

				<div class="card">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">
						<ul>
							<li><a href="">To Article</a></li>


							<!-- any logged in user can update a page right now -->
							<c:if test="${profile.id != null }">
								<li>
									<form action="showUpdateTopic.do">
										<c:forEach var="content" items="${topic.contents}">

											<input type="hidden" value="${content.id}" name="cid">
											<!--pass content id into content update page  -->
											<button type="submit" class="btn btn-primary">Edit
												Article</button>
										</c:forEach>
									</form>
								</li>
							</c:if>
							<li><a href="">To Resources</a></li>
						</ul>
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
<script type="text/javascript">
	function urlify(text) {
		var urlRegex = /(((https?:\/\/)|(www\.))[^\s]+)/g;
		//var urlRegex = /(https?:\/\/[^\s]+)/g;
		return text.replace(urlRegex, function(url, b, c) {
			var url2 = (c == 'www.') ? 'http://' + url : url;
			return '<a href="' +url2+ '" target="_blank">' + url + '</a>';
		})
	}
</script>
</html>