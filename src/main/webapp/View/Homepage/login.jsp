<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Đăng nhập</title>
		<style>
			.card-login {
				width: 600px;
				background-color: #d869367a;
				margin: auto;
				padding: 1rem;
				margin-top: 4rem;
				border-radius: 12px;
			}

			.title {
				text-align: center;
			}

			form.login-form {
				margin: auto;
				width: 80%;
			}

			.form-group {
				width: 100%;
				margin-bottom: 1rem;
			}

			.form-group label {
				display: block;
				margin-bottom: 0.5rem;
			}

			.form-group input {
				width: 100%;
				display: block;
				width: 100%;
				padding: .375rem .75rem;
				font-size: 1rem;
				font-weight: 400;
				line-height: 1.5;
				color: black;
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				background-color: white;
				background-clip: padding-box;
				border: 1px solid #e5e5e5;
				border-radius: 6px;
				transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
			}

			.button-login {
				display: block;
				padding: .575rem .75rem;
				font-size: 14px;
				font-weight: 700;
				line-height: 1;
				color: white;
				text-align: center;
				text-decoration: none;
				cursor: pointer;
				-webkit-user-select: none;
				-moz-user-select: none;
				user-select: none;
				border: 1px solid #db4f0d;
				border-radius: 8px;
				background-color: #db4f0d;
				transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
				margin: auto;
			}
		</style>
	</head>

	<body>
		<div class="card-login">
			<h1 class="title">Đăng nhập</h1>

			<form class="login-form" action="./Login" method="POST">
				<%
			        String message = (String) request.getSession().getAttribute("message");
			        if (message != null) {
			    %>
			    	<div class="form-group">
			        	<p style="color:red;"><%= message %></p>
					</div>
			    <%
			        }
			    %>
			    
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" name="email" id="email" required>
				</div>

				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" name="password" id="password" required>
				</div>

				<div class="form-group">
					<button type="submit" class="button-login">Đăng nhập</button>
				</div>
			</form>
		</div>
	</body>

	</html>