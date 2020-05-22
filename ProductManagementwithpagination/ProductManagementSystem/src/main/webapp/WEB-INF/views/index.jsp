<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center">
<div id="1"><center><h1>Product Management System</h1></center></div>
<div id="2">
<br>
<center>
<form action="/ProductManagementSystem/products" method="get">
		<th><button type="submit" value="Home" name="button" class="button btn-secondary" >Product List</button></th>
	</form>
	<br>
	<form action="/ProductManagementSystem/add" method="get">
		<th><button type="submit" value="Add Product" name="button" class="button btn-success" >Add Product</button></th>
	</form>
	</center>
	</div>
	</div>
</body>
</html>