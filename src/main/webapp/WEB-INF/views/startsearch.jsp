<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<title>Best Gift: Start Search</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>
<body class="w3-row-padding w3-padding-32">
	<div class="w3-third">
		<h3>Search By More KeyWords</h3>
		<p>
		<form action="/etsy-results">
			<table>
				<tr>
					<td>Search Param:*</td>
					<td><input type="text" name="keywords1" placeholder="blue" required /></td>
				</tr>
				<tr>
					<td>Search Param:</td>
					<td><input type="text" name="keywords2" placeholder="top hat"/></td>
				</tr>
				<tr>
					<td>Search Param:</td>
					<td><input type="text" name="keywords3" /></td>
				</tr>
				<tr>
					<td>Search Param:</td>
					<td><input type="text" name="keywords4" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form>

	</div>

	<div class="w3-third">
		<h3>Past Favorite Items</h3>
		<ul class="w3-ul w3-hoverable">
			<li class="w3-padding-16"><img src=""
				class="w3-left w3-margin-right" style="width: 50px"> <span
				class="w3-large">Cute Catz</span><br> <span>meow meow
					meow meow meow</span></li>
			<li class="w3-padding-16"><img src=""
				class="w3-left w3-margin-right" style="width: 50px"> <span
				class="w3-large">tree frog</span><br> <span>In the tree
					looking at you</span></li>
		</ul>
	</div>

	<div class="w3-third w3-serif">
		<h3>Common searched keywords</h3>
		<p>
			<span class="w3-tag w3-black w3-margin-bottom">red</span> <span
				class="w3-tag w3-dark-grey w3-small w3-margin-bottom">fabric</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dinner</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">hat</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">vintage</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Drinks</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">mrs
				robe</span> <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">cartoon</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Cuisine</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">steak</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">pin</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fried</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">gold</span>
			<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">bright</span>
		</p>
	</div>
</body>


<script>
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
	}
</script>

</body>
</html>