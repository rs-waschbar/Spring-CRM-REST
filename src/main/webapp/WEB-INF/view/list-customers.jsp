<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		  integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		  crossorigin="anonymous">

	<title>List Customers</title>
	
<%--	<link type="text/css"--%>
<%--		  	rel="stylesheet"--%>
<%--		  	href="${pageContext.request.contextPath}/resources/css/style.css" />--%>
</head>

<body>

	<div class="container">
		<p>
			<h2>CRM - Customer Relationship Manager</h2>
		</p>

		<p>
			<input type="button" value="Add Customer" 
				onclick="window.location.href='showFormForAdd'; return false;"
				class="btn btn-primary btn-small mb-3"
			/>

			<form:form action="search" method="GET">
                Search customer: <input type="text" name="theSearchName" />
                <input type="submit" value="Search" class="add-button" />
            </form:form>
		</p>
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="tempCustomer" items="${customers}">
				
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					
					<tr>
						<td> ${tempCustomer.firstName}</td>
						<td> ${tempCustomer.lastName}</td>
						<td> ${tempCustomer.email}</td>
						<td> 
						<a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</td>
					</tr>
					
				</c:forEach>
				</tbody>
			</table>

	</div>

</body>


</html>