<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String rootPath = request.getContextPath();%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ include file="../mainIndex.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
	</head>
		<body >
			<div class="daohangbackgc">
				<div class="navbar-header col-md-12  navbar-inverse " role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="hidden-phone visible-tablet visible-desktop">设置</a></li>
						<li id="user-menu" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> ${userBean.userName} 
								<i class="glyphicon glyphicon-triangle-bottom"></i>
							</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="<%=rootPath%>/userBean/getOneUser">个人中心</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="<%=rootPath%>/login/loginOut">退出</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-left">
						<li><a href="<%=rootPath%>/login/getMainView">xinbase</a></li>
					</ul>
				</div>
			</div>
			<!-- <div class="container"> -->
			<div class="container-fluid contentheight">
			<div class="row-fluid">
			<div class="col-md-2 ">
				<form class="form-group" style="padding-top: 10px;">
					<input type="text" placeholder="Search..." class="form-control">
				</form>	
				
				<c:forEach items="${resources }" var="resource" >
					<%-- <a href="#${resource.idName }" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>${resource.name}</a> --%>
					<ul id="${resource.idName }" class="nav nav-tabs nav-stacked" >	
						<li><a href="<%=rootPath%>${resource.url }">${resource.name }</a></li>
					</ul>
				</c:forEach>
				<!-- <div class="panel panel-info">
					<div class="panel-heading">aaaa</div>
					<div class="panel-body">aaaaa</div>
				</div>	 -->
			</div>
			
			</div>
			
			<div class="col-md-10">
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-12"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">报表</li>
						</ul>
					</div>	
				</div>
			
			
				<div class="container-fiuid">
					
						<div class="row-fluid">
							<div class="col-md-offset-1">
								<div class="alert alert-info col-md-10">
									<button type="button" class="close" data-dismiss="alert">x</button>
									<strong>提示：</strong>还有x没结账！
								</div>
							</div>
						</div>
						
						<div class="row-fluid col-md-12" >
							<div class="col-md-6">
								<div class="panel panel-info ">
									<div class="panel-heading">
										<a href="#tablewidget"  data-toggle="collapse">昨日</a>
									</div>
									<div id="tablewidget" class=" collapse in">
										<table class="table">
											<tr>
												<th>经营支出</th>
												<th>经营收入</th>
											</tr>
											<c:forEach var="ayesterdayturnover" items="${yesterdayturnover }" begin="0" end="3">
												<tr>
													<td>${ayesterdayturnover.reportName }</td>
													<td>${ayesterdayturnover.reportInfo }</td>
												</tr>
											</c:forEach>
										</table>									
											<p><a href="#">更多...</a></p>
									</div>
								</div>
							</div>
								<div class="col-md-6">
									<div class="panel panel-info">
										<div class="panel-heading">
											<a href="#tablewidget2" data-toggle="collapse">今日</a>
										</div>
										<div id="tablewidget2" class=" collapse in">
											<table class="table">
												<tr>
													<th>经营支出</th>
													<th>经营收入</th>
												</tr>
												<c:forEach var="atodayturnover" items="${todayturnover }" begin="0" end="3">
													<tr>
														<td>${atodayturnover.reportName }</td>
														<td>${atodayturnover.reportInfo }</td>
													</tr>
												</c:forEach>
											</table>
											<p><a href="#">更多...</a></p>
										</div>
									</div>
								</div>
							</div>
							<div class="row-fluid col-md-12">
							<div class=" col-md-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<a href="#tablewidget3" data-toggle="collapse">本月</a>
								</div>
								<div id="tablewidget3" class=" collapse in">
									<table class="table">
										<tr>
											<th>经营支出</th>
											<th>经营收入</th>
										</tr>
										<c:forEach var="amonthturnover" items="${monthturnover }" begin="0" end="3">
											<tr>
												<td>${amonthturnover.reportName }</td>
												<td>${amonthturnover.reportInfo }</td>
											</tr>
										</c:forEach>
									</table>
									<p><a href="#">更多...</a></p>
								</div>
								</div>
							</div>
							<div class=" col-md-6">
								<div class="panel panel-info">
									<div class="panel-heading">
										<a href="#tablewidget4" data-toggle="collapse">人流量</a>
									</div>
									<div id="tablewidget4" class="collapse in">
										<table class="table">
											<tr>
												<th>经营支出</th>
												<th>经营收入</th>
											</tr>
											<c:forEach var="atodaycustomer" items="${todaycustomer }" begin="0" end="3">
												<tr>
													<td>${atodaycustomer.reportName }</td>
													<td>${atodaycustomer.reportInfo }</td>
												</tr>
											</c:forEach>
										</table>
										<p><a href="#">更多...</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			
			<!-- </div> -->
			</div>
		</body>
</html>