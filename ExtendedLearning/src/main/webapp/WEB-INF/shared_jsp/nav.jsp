<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>

<div class="nav-wrapper">
	<div class="sidebar">
		<table class="table">
			<thead>

				<tr>
					<th><h4>
							<a href="showAllTopics.do">Article Index</a>
						</h4></th>
				</tr>

			</thead>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th><h4>Recent Articles</h4></th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${logList != null }">
					<tbody>
						<c:forEach var="log" items="${logList}">
							<tr>
								<td scope="row"><a
									href="showSingleTopic.do?topicId=${log.topic.id}">${log.topic.title }</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</c:when>
			</c:choose>

		</table>
	</div>
</div>