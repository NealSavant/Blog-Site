<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
		


	<jsp:include page="shared_jsp/header.jsp" />

<!-- Page Content -->
  <article class="gridcontainer">
		<jsp:include page="shared_jsp/nav.jsp" />
	<div class="main-container">
    <div class="row">

      <!-- Post Content Column -->
      <div class="col">

        <!-- Title -->
        <h1 class="title">${topic.title}</h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="#">${user.username}</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p>${topic.createdAt}</p>

        <hr>

        <%-- <!-- Preview Image -->
        <img class="img-fluid rounded" src="${topic.image.imageUrl}" alt="image"> --%>

        <hr>

        <!-- Post Content -->
        <c:forEach var="content" items="${topic.contents}">
					<p>${content.content}</p>
		</c:forEach>			
				<c:forEach var="content" items="${topic.contents}">
					<p style="white-space: pre-line">${content.content}</p>

				</c:forEach>

        <c:forEach var="resource" items="${topic.resources}">
          <p>${resource.title}</p>
          <a href="${resource.resourceUrl}">${resource.resourceUrl}</a>
        </c:forEach>

        <hr>

        <!-- Comments Form -->
        <div class="card">
        <c:if test="${profile.id == null}">
          <p>Log in to leave a comment!</p>
        </c:if>
          <c:if test="${profile.id != null}">
          <h5 class="card-header">Leave a Comment:</h5>
          <form action="addComment.do" method="POST">
          <div class="card-body">
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <input type="hidden" value="${topic.id }" name="topicId" />
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
            </c:if>
            </div>
          

        <!-- display comments below content -->
        <div class="media">
          <c:if test="${not empty topic.topicComments}">
            <c:forEach var="comment" items="${topic.topicComments}">
            <c:if test="${comment.active }">
          <div class="media-body">
            <h5 class="mt-0">${comment.user.username}</h5>
            <p>${comment.title}<p>
            <p>${comment.content }</p>
            <p>${topic.createdAt}</p>
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
	</div>

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

<!-- Side Widget -->
<c:if test="${profile.id != null }">
    <div class="card">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body">
            <!-- any logged in user can update a page right now -->
            <form action="showUpdateTopic.do">
              <c:forEach var="content" items="${topic.contents}">

                <input type="hidden" value="${content.id}" name="cid">
                <!--pass content id into content update page  -->
                <button type="submit" class="btn btn-primary">Edit Post</button>
              </c:forEach>
            </form>
          </div>
        </div>
      </c:if>








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