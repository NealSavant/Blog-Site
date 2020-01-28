<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extended Learning</title>
<jsp:include page="/WEB-INF/shared_jsp/jsp_scripts/styleTop.jsp" />

</head>
<body>
	<header class="main-header">
		<jsp:include page="/WEB-INF/shared_jsp/header.jsp" />
	</header>
	
	<h4>User Management</h4>
	
	<c:forEach var="user" items="${users }">
		Username: ${user.username }
		Active: ${user.active } <br>
		
		
		<c:if test="${user.active }">
			<form action="disableUser.do" method="GET">
				<input type="hidden" name="uid" value="${user.id }">
  				<input type="submit" value="Disable account: ${user.username }" />
  			</form>
  		</c:if>
  		
  		
		<c:if test="${not user.active }">
			<form action="enableUser.do" method="GET">
				<input type="hidden" name="uid" value="${user.id }">
  				<input type="submit" value="Activate account: ${user.username }" />
  			</form>
  		</c:if>
	
	
	</c:forEach>
	
	
	
	
	


	<footer>
		<jsp:include page="/WEB-INF/shared_jsp/footer.jsp" />
	</footer>

	<jsp:include page="/WEB-INF/shared_jsp/jsp_scripts/styleBot.jsp" />
</body>
</html>