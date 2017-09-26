<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	String rootPath = request.getContextPath();%>
<%@ include file="mainIndex.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>用户登陆</title>
		<script type="text/javascript">
			function getimageload(){
				$("#getimage").attr("src","<%=rootPath%>/validate/getimage?Math.random();");
			}
			
		
		
		
		</script>
		
	</head>
	
	<body id="divback">
		<div >
		<div class="navbar">
			<div class="navbar-inner">
				<ul class="nav pull-right">
					
				</ul>
				<a class="brand" href="index.html"><span class="first"></span></a>
			</div>
			
		
		</div>
		<div class="container" style="margin-top:200px">
			<form class="form-signin" action="<%=rootPath%>/login/getLoginUser" method="post">
				<div class="page-header">
					<h2>后台管理</h2>
				</div>
			<input type="text" class="input-block-level" placeholder="用户名" name="userName"/>
			<input type="password" class="input-block-level" placeholder="密码" name="passWord"/>
			<input type="text" id="validatecss" name="validate" placeholder="验证码">&nbsp;&nbsp;&nbsp;&nbsp;
			<img id="getimage" alt="yyy" src="<%=rootPath%>/validate/getimage" onclick="this.src='<%=rootPath%>/validate/getimage?'+Math.random();" class="img-rounded">
			<p id="validate"></p>
			<p style="color: red;font-size: 12px">${msg }</p>
			<!-- 验证码 -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn  btn-primary" type="submit">登陆</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn  btn-inverse" type="reset">重新输入</button>
			</form>
		</div>
		</div>
	</body>
</html>