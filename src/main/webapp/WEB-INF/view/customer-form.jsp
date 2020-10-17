<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>Save Customer</title>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		  integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		  crossorigin="anonymous">
</head>
<body>
<div class="container">
	<p>
	<h2>CRM - Customer Relationship Manager</h2>
	</p>

		<p class="h4 mb-4">Save Customer</p>
		
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">
		
			<form:hidden path="id" />
		
			<table>
				<tbody>
					<tr>
						<td><label>First Name:</label></td>
						<td><form:input path="firstName" class="form-control mb-4" /> </td>
					</tr>
					
					<tr>
						<td><label>Last Name:</label></td>
						<td><form:input path="lastName" class="form-control mb-4" /> </td>
					</tr>
					
					<tr>
						<td><label>Email:</label></td>
						<td><form:input path="email" class="form-control mb-4" /> </td>
					</tr>
				
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save"  class="btn btn-info col-6" /> </td>
					</tr>
				</tbody>
			</table>
		
		</form:form>
		
		<p>
			<a href="${pageContext.request.contextPath }/customer/list">Back to List</a>
		</p>
	
	</div>


</body>

</html>