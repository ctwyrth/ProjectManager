<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project Manager - Dashboard</title>

	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<script type="text/javascript" src="/js/script.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<header class="row justify-content-between mb-4">
				<div class="col-5 text-start">
					<h1 class="display-4">Welcome, <c:out value="${user.firstName}" />!</h1>			
				</div>
				<div class="col-5 text-end">
					<a href="/logout" class="text-decoration-none">Log Out</a><br>
					<a href="/projects/new" class="text-decoration-none">Add A Project</a>
				</div>
			</header>
			<main class="container mx-auto">
				<table class="table table-striped caption-top">
					<caption>All Projects</caption>
					<thead class="table-success">
						<tr>
							<th>Project</th>
							<th>Team Lead</th>
							<th>Due Date</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="project" items="${projects}">
							<tr>
								<td><a href="/projects/${project.id}" class="text-decoration-none"><c:out value="${project.name}" /></a></td>
								<td>${project.lead}</td>
								<td>${project.due}</td>
								<td><a href="/projects/{id}/join" class="text-decoration-none">Join Team</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table table-striped caption-top mt-5">
					<caption>Your Projects</caption>
					<thead class="table-warning">
						<tr>
							<th>Project</th>
							<th>Team Lead</th>
							<th>Due Date</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="project" items="${projects}">
							<tr>
								<td>${project.name}</td>
								<td>${project.lead}</td>
								<td>${project.due}</td>
								<td>
									<c:choose>
										<c:when test="${project.lead == user}">
											<a href="/projects/${project.id}/edit" class="text-decoration-none">Edit</a>
										</c:when>
										<c:otherwise>
											<a href="/projects/{id}/leave" class="text-decoration-none">Leave Team</a>										
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</main>		
		</div>
	</div>

</body>
</html>