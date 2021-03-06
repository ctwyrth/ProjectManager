<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- <script type="text/javascript" src="/js/script.js"></script> -->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<h1 class="display-2 text-center" style="color: blueviolet;">Project Manager!</h1>
			<p class="text-center mb-5">A place for teams to manage projects.</p>
			<div class="row">
				<div class="col-5 ms-auto me-2">
					<h4>Register:</h4>
					<form:form action="/register" modelAttribute="newUser" method="POST" class="p-3">
						<div class="form-floating mb-3">
							<form:input type="text" path="firstName" class="form-control" placeholder="First Name" />
							<form:label path="firstName" class="form-label">First Name</form:label>							
						</div>
						<div><form:errors path="firstName" /></div>
						<div class="form-floating mb-3">
							<form:input type="text" path="lastName" class="form-control" placeholder="Last Name" />
							<form:label path="lastName" class="form-label">Last Name</form:label>							
						</div>
						<div><form:errors path="lastName" /></div>
						<div class="form-floating mb-3">
							<form:input type="email" path="email" class="form-control" placeholder="Email" />
							<form:label path="email" class="form-label">Email</form:label>							
						</div>
						<div><form:errors path="email" /></div>
						<div class="form-floating mb-3">
							<form:input type="password" path="password" class="form-control" placeholder="Password" />
							<form:label path="password" class="form-label">Password</form:label>							
						</div>
						<div><form:errors path="password" /></div>
						<div class="form-floating mb-3">
							<form:input type="password" path="confirm" class="form-control" placeholder="Confirm Password" />
							<form:label path="confirm" class="form-label">Confirm Password</form:label>							
						</div>
						<div><form:errors path="confirm" /></div>
						<input type="submit" value="Create" class="btn btn-sm btn-success" />
					</form:form>
				</div>
				<div class="col-5 ms-2 me-auto">
					<h4>Log In:</h4>
					<form:form action="/login" modelAttribute="newLogin" method="POST" class="p-3">
						<div class="form-floating mb-3">
							<form:input type="email" path="email" class="form-control" placeholder="Email" />
							<form:label path="email" class="form-label">Email</form:label>							
						</div>
						<div><form:errors path="email" /></div>
						<div class="form-floating mb-3">
							<form:input type="password" path="password" class="form-control" placeholder="Password" />
							<form:label path="password" class="form-label">Password</form:label>							
						</div>
						<div><form:errors path="password" /></div>
						<input type="submit" value="Log In" class="btn btn-sm btn-primary" />
					</form:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>