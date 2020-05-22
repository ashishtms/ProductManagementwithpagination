<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cg.productmanagementsystem.entities.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Product List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script>
<!-- The settings you provide will be merged with the default settings -->
	FontAwesomeConfig = {
		searchPseudoElements : true
	}
</script>
<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js"></script>
</head>
<body>

	<%
		List<Product> products = (List<Product>) session.getAttribute("productList");
		List<Integer> pageList = (List<Integer>) session.getAttribute("pageList");
		String offSet = request.getParameter("offSet");
		String property = request.getParameter("sortby");
		String order = request.getParameter("order");
		int id;
		String prop = request.getParameter("sortby");
		String ord = request.getParameter("order");
		if (prop == null) {
			prop = "product_id";
			ord = "ascending";
		}

		/* disabledLINK has been used to to make current page number nonhiperlink i.e unclickable
		e.g if user is at page number 15 then page number 15 should not be clickable*/
		int disabledLINK = 0;
		if (offSet != null) {
			disabledLINK = Integer.parseInt(offSet);
		}
		/* size is used for moving user to end page  by clicking on END link*/
		int size = Integer.parseInt(session.getAttribute("size").toString());
	%>

	<div class="container">
		<div class="row" align="center">
			<div class="col-sm-12">
				<h1>Product List</h1>
			</div>
		</div>
		<br>

		<form
			action="/ProductManagementSystem/products?sortby=<%=property%> & order=<%=order%>"
			method="get">
			<table align="center">
				<tr>
					<td>Sort By:</td>
					<td><select id="sortby" name="sortby">
							<option selected value="<%=prop%>"><%=prop%></option>
							<option value="product_id">Product Id</option>
							<option value="product_name">Product Name</option>
							<option value="product_price">Product Price</option>
							<option value="product_quantity">Product Quantity</option>
							<option value="product_rating">Product Rating</option>
					</select></td>

					<td><select id="order" name="order">
							<option selected value="<%=ord%>"><%=ord%></option>
							<option value="ascending">Ascending</option>
							<option value="descending">Descending</option>
					</select></td>

					<td>
						<button type="submit" value="Sort Results" name="x"
							class="button btn-primary">Submit</button>
					</td>
				</tr>

			</table>
		</form>

	</div>

	<div class="container">
		<table border="1px" class="table table-striped table-hover ">
			<thead class="thead-dark">
				<tr>
					<th></th>
					<th></th>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Product Price</th>
					<th>Product Quantity</th>
					<th>Product Rating</th>


				</tr>
			</thead>
			<c:forEach items="${productList}" var="p">
				<tr>
					<td><a
						href="/ProductManagementSystem/editpage?id=${p.product_id}"><i class="fas fa-edit"></i></a></td>
					<td><a href="/ProductManagementSystem/delete/${p.product_id}"><i class="fas fa-trash"></i>
					</a></td>
					<td>${p.product_id}</td>
					<td>${p.product_name}</td>
					<td>${p.product_desc}</td>
					<td>${p.product_price }</td>
					<td>${p.product_quantity }</td>
					<td>${p.product_rating }</td>

				</tr>

			</c:forEach>
		</table>

	</div>
	<div align="center">
		<%
			if (disabledLINK != 0) {
		%>
		<!-- if user is on start page then it should not be visible to user or it should not be hyper-link-->

		<a href="products?offSet=<%=0%>&sortby=<%=property%>&order=<%=order%>">1</a>
		<%
			}
		%>
		<%
			for (Integer i : pageList) {
				if (disabledLINK == i) {
					if (disabledLINK != size) {
		%>
		<!-- Current page should not be hyper-link-->
		<%=i + 1%>
		<%
			}
				} else {
		%>
		<!-- page previous to current page and next to current page has to be hyper link  -->
		<a href="products?offSet=<%=i%>&sortby=<%=property%>&order=<%=order%>"><%=i + 1 + ""%></a>
		<%
			}
			}
		%>
		<%
			if (disabledLINK == size) {
		%>
		<%-- <%="End"%> --%>
		<%
			} else {
		%>
		<!-- if user is on last page then it should not be visible to user or it should not be hyper-link-->
		<a
			href="products?offSet=<%=size%> &sortby=<%=property%>&order=<%=order%>">End</a>
		<%
			}
		%>

		<form action="/ProductManagementSystem/" method="get">
			<th><button type="submit" value="Home" name="button"
					class="button btn-secondary">Home</button></th>
		</form>
		<form action="/ProductManagementSystem/add" method="get">
			<th><button type="submit" value="Add Product" name="button"
					class="button btn-success">Add Product</button></th>
		</form>

	</div>



</body>
</html>