<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<br>
	<br>

	<div class="container">
		<form:form modelAttribute="product"
			action="ProductManagementSystem/adds/" method="get"
			class="form-group">

			<div class="row" align="center">
				<div class="col-sm-12">
					<h1>Add Product</h1>
				</div>
			</div>
			<br>
			<div class="form-group row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<label for="product_name">Name</label>
				</div>
				<div class="col-sm-3">
					<form:input type="text" path="product_name" id="product_name"
						required="required" name="product_name" class="form-control" />
				</div>
				<div class="col-sm-4"></div>
			</div>


			<div class="form-group row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<label for="product_desc">Description</label>
				</div>
				<div class="col-sm-3">
					<form:input type="text" path="product_desc" id="product_desc"
						required="required" name="product_desc" class="form-control" />
				</div>
				<div class="col-sm-4"></div>
			</div>


			<div class="form-group row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<label for="product_price">Price</label>
				</div>
				<div class="col-sm-3">
					<form:input type="text" path="product_price" id="product_price"
						required="required" name="product_price" class="form-control" />
				</div>
				<div class="col-sm-4"></div>
			</div>


			<div class="form-group row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<label for="product_quantity">Quantity</label>
				</div>
				<div class="col-sm-3">
					<form:input type="number" path="product_quantity"
						id="product_quantity" required="required" name="product_quantity"
						class="form-control" />
				</div>
				<div class="col-sm-4"></div>
			</div>


			<div class="form-group row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<label for="product_rating">Rating</label>
				</div>
				<div class="col-sm-3">
					<select id="product_rating" required="required"
						name="product_rating" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				<div class="col-sm-4"></div>
			</div>
			<br>



			<div class="form-group row">
				<div class="col-sm-5"></div>
				<div class="col-sm-2">
					<button type="submit" class="button btn-success form-control">Add</button>
				</div>
			</div>
			<div class="col-sm-5"></div>

		</form:form>
	</div>

</body>
</html>