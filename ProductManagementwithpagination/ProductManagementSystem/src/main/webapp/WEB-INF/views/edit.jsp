<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>
<body>
<br>
<br>

	<div class="container">
	<form:form modelAttribute="product"
		action="ProductManagementSystem/edit" method="get" class="form-group">
	
		
			<div >
				<form:input type="hidden" path="product_id" id="product_id"
					name="product_id"
					values="${product.product_id}" />
				<br>
			</div>
		
		
			<div class="row" align="center">
				<div class="col-sm-12">
					<h1>Edit Product</h1>
				</div>
			</div>
			<br>
			<div class="form-group row">
			<div class="col-sm-4">
			</div>
			<div class="col-sm-1">
				<label for="product_name">Name</label>
				</div>
				<div class="col-sm-3">
				<form:input type="text" path="product_name" id="product_name"
					required="required" name="product_name"
					values="${product.product_name}" class="form-control" />
					</div>
			<div class="col-sm-4">
			</div>
			</div>
		
		

			<div class="form-group row">
			<div class="col-sm-4">
			</div>
			<div class="col-sm-1">
				<label for="product_desc">Description</label>
				</div>
				<div class="col-sm-3">
				<form:input type="text" path="product_desc" id="product_desc"
					required="required" name="product_desc"
					values="${product.product_desc}" class="form-control"/>
					</div>
				<div class="col-sm-4">
			</div>
			</div>
		
		
			<div class="form-group row">
			<div class="col-sm-4">
			</div>
			<div class="col-sm-1">
				<label for="product_price">Price</label>
				</div>
				<div class="col-sm-3">
				<form:input type="text" path="product_price" id="product_price"
					required="required" name="product_price"
					values="${product.product_price}" class="form-control"/>
					</div>
					<div class="col-sm-4">
			</div>
			</div>
		
		
			<div class="form-group row">
			<div class="col-sm-4">
			</div>
			<div class="col-sm-1">
				<label for="product_quantity">Quantity</label>
				</div>
				<div class="col-sm-3">
				<form:input type="number" path="product_quantity"
					id="product_quantity" required="required" name="product_quantity"
					values="${product.product_quantity}" class="form-control"/>
					</div>
					<div class="col-sm-4">
			</div>
			</div>
		
		
			<div class="form-group row">
			<div class="col-sm-4">
			</div>
			<div class="col-sm-1">
				<label for="product_rating">Rating</label>
				</div>
				<div class="col-sm-3">
				 <select path="product_rating" id="product_rating"
					required="required" name="product_rating" class="form-control">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select> 
				</div>
				<div class="col-sm-4">
			</div>
			</div>
			<br>

		
		
			<div class="form-group row">
			<div class="col-sm-5">
			</div>
			<div class="col-sm-2">
				<button type="submit" class="button btn-success form-control">Update</button>
				</div>
			</div>
			<div class="col-sm-5">
			</div>
			
		
		</form:form>
	</div>

</body>
</html>