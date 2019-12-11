<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gift Results</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-oOs/gFavzADqv3i5nCM+9CzXe3e5vXLXZ5LZ7PplpsWpTCufB7kqkTlC9FtZ5nJo"
	crossorigin="anonymous">
</head>

<body>

	<%-- 	<p><img src="${ i.results[0].url_570xN }" width="270" height="200"/></p> --%>
	<%-- 	<p>${g.title}</p> --%>
	<%-- 	<p>${g.price} ${g.currency_code}</p> --%>
	<%-- 	<p>${g.description}</p> --%>
	<h1>Refinement Search Logic</h1>
	<h1>Search By Etsy</h1>
	<form action="/etsy-results">
		Keywords: <input type="text" name="keywords" /> Max Price: <input
			type="number" name="max_price" /> <input type="submit"
			value="Submit" />
	</form>
	<div class="table table-hover">

		<c:forEach var="g" items="${ currentGiftList }">
			<table class="table-dark" border=1 >
				<tr>
					<th><img
						src="${gs.getGiftImage(g.listingId).results[0].url_570xN }"
						width="270" height="200" /></th>
					<th>${g.title}</th>
					<th>${g.price}${g.currencyCode}</th>

					<th>${g.description}</th>
				</tr>
			</table>

		</c:forEach>
	</div>



</body>
</html>