<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String rootPath = request.getContextPath();%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../mainIndex.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
		<body class="">
			<div class="daohangbackgc">
			<div class="navbar-header col-md-12  navbar-inverse" role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="" class="hidden-phone visible-tablet visible-desktop">设置</a></li>
						<li id="user-menu" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> ${userBean.userName} 
								<i class="glyphicon glyphicon-triangle-bottom"></i>
							</a>
							<ul class="dropdown-menu">
								<li><a href="<%=rootPath%>/userBean/getOneUser">个人中心</a></li>
								<li><a href="<%=rootPath%>/login/loginOut">退出</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-left">
						<li><a href="<%=rootPath%>/login/getMainView">xinbase</a></li>
					</ul>
				</div>
			</div>
			
			<div class="container-fluid contentheight well">
			<div class="row-fluid">
			<div class="col-md-2 " >
				<form class="form-group" style="padding-top: 10px;">
					<input type="text" placeholder="Search..." class="form-control">
				</form>	
				
				<c:forEach items="${resources }" var="resource" >
					<%-- <a href="#${resource.idName }" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>${resource.name}</a> --%>
					<ul id="${resource.idName }" class="nav nav-tabs nav-stacked" >	
						<li><a href="<%=rootPath%>${resource.url }">${resource.name }</a></li>
					</ul>
				</c:forEach>	
			</div>
			
			<div class="content col-md-10">
				
				
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-12"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">餐桌修改</li>
						</ul>
					</div>	
				</div>
				
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="row-fluid">
							<c:if test="${tableEdit==true }">
								<div class="alert alert-info col-md-12">
									<button type="button" class="close" data-dismiss="alert">X</button>
									<strong>小提示：</strong> 保存成功！
								</div>
							</c:if>
						</div>
						
						<div class="col-md-12">
							<div class="row-fluid sortable">
								<div class="box span12">
										<form action="<%=rootPath%>/tables/updateTable" class="form-horizontal" method="post">
												<div class="form-group">
													<div class="">
													 	<input name="id" type="hidden" value="${table.id}">
													</div>
												  </div>
												
												  <div class="form-group">
													<label class="col-sm-2 control-label" for="orderid">订 单 号</label>
													<div class=col-sm-10>
													  <input name="orderNo" class="form-control" id="orderid" type="text" value="${table.orderNo}">
													</div>
												  </div>
												  <div class="form-group">
													<label class="col-sm-2 control-label" for="num">人  数</label>
													<div class="col-sm-10">
													  <input name="personNum" class="form-control" id="num" type="text" value="${table.personNum}">
													</div>
												  </div>
												  <div class="form-group">
													<label class="col-sm-2 control-label" for="desc">描  述</label>
													<div class="col-sm-10">
													  <input name="discription" class="form-control" id="desc" type="text" value="${table.discription}">
													</div>
												  </div>
												  <div class="form-group">
													<label class="col-sm-2 control-label" for="tflag">餐桌状态</label>
													<div class="col-sm-10">
													  <input name="tableState" class="form-control" id="tflag" type="text" value="${table.tableState}">
													  <span class="help-block">"1"表示空闲 , "0"表示满座</span>
													</div>
												  </div>						
												<div class=" col-md-12">
													<div class="col-md-offset-4">
														
															<button type="submit" class="btn btn-primary">保  存</button>
															<a href="<%=rootPath%>/tables/getTables">
																<span class="btn btn-info" >返回</span>
															</a>
														
													</div>
												</div>										
										</form>
								</div>
							</div>
						</div>
						</div>
					</div>
				
				</div>
				</div>
			</div>
			
		</body>
</html>