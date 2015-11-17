<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<tr>
			<th align="left">Select a UOM type :</th>
			<td><select>
					<option value="none">---</option>
					<option value="cou">Count</option>
					<option value="wei">Weight</option>
					<option value="len">Length</option>
					<option value="are">Area</option>
					<option value="vol">Volume</option>
					<option value="tim">Time</option>
			</select></td>
		</tr>
		<tr>
			<th align="left">Name UOM :</th>
			<td><input type="text"></td>
		</tr>
		<tr>
			<th align="left">Select Abbreviation :</th>
			<td><input type="text"></td>
		</tr>
		<tr>
			<th align="left">UOM Description :</th>
			<td><textarea rows="" cols=""></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">Submit</button>
			</td>
		</tr>
	</table>
</body>
</html>