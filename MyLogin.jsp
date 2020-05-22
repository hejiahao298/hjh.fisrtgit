<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>



<%
	String Eusername = request.getParameter("username");
if (Eusername == null)
	Eusername = "";
String Epassword = request.getParameter("password");
if (Epassword == null)
	Epassword = "";

Cookie[] cookies = request.getCookies();
String musername = "";
String mpassword = "";
String mlastvisit = "";
if (cookies != null) {
	for (Cookie cookie : cookies) {

		if (cookie.getName() == "username")
	musername = cookie.getValue();
		if (cookie.getName() == "password")
	mpassword = cookie.getValue();
		if (cookie.getName() == "lastvisit")
	mlastvisit = cookie.getValue();
	}
}

String finalusername = Eusername.equals("") ? musername : Eusername;
String finalpassword = Epassword.equals("") ? mpassword : Epassword;
%>

<form action="LoginCookie" method="post">

	<center>
		<table border="1">
			<font color="red">
				<h2><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%><h2>
			</font>

			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username"
					value="<%=finalusername%>"></td>
			</tr>

			<tr>
				<td>密&nbsp;&nbsp;&nbsp;码</td>
				<td><input type="password" name="password"
					value="<%=finalpassword%>"></td>
			</tr>

			<tr>
				<td>上次登入</td>
				<td><%=mlastvisit%></td>
			</tr>

			<tr>
				<td>验证码:</td>
				<td><input type="text" name="vctext" id="vctext"> <img
					name="vcimage" id="vcimage" src="vcimage"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="登录">
					<input type="reset" value="重置"></td>
			</tr>

		</table>
</form>
</center>
</body>
</html>