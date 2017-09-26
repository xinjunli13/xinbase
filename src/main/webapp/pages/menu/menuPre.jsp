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
			<div class="container-fluid">
			<div class="row-fluid">
			<div class="col-md-2 ">
				<form class="form-group" style="padding-top: 10px;">
					<input type="text" placeholder="Search..." class="form-control">
				</form>		
				
				<c:forEach items="${resources }" var="resource" >
					<%-- <a href="#${resource.idName }" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>${resource.name}</a> --%>
					<ul id="${resource.idName }" class="nav nav-list" >	
						<li><a href="<%=rootPath%>${resource.url }" class="">${resource.name }</a></li>
					</ul>
				</c:forEach>	
			</div>
			
			<div class="content col-md-10 ">
				
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-12"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">菜谱预览</li>
						</ul>
					</div>	
				</div>
				
				<div class="container-fluid"  style="padding-top: 50px;">
					<div class="row-fluid">
						<!-- well嵌入的效果 -->
						<div class=" container-fluid ">
								<div class="row-fluid">
								<div class="col-md-12">
									<div class="col-md-5" >
										<h1>${menu.name }</h1>
										<img alt="yyy" src="<%=rootPath%>/images/${menu.imgName} " style="height: 170px;width: 200px;">
									</div>
								
									<div class="col-md-6">
										<h2>
											<span class="label alert-info col-md-3"> 价 格 : </span> 
											<span class="label label-success col-md-offset-3" >${menu.price}</span>
											</h2>
											<h2>
											<span class="label alert-info col-md-3"> 类 型 : </span>
											</h2>
											
											<select id="mySelect" name="menutype"  class="form-control col-md-6"  data-size="4"  disabled>
												<c:forEach items="${menutypelist}" var="mtt">
													<c:if test="${menu.mtid==mtt.id}">
														<option  value="${mtt.id}"  selected="selected">${mtt.name}</option>
													</c:if>
							  						<c:if test="${menu.mtid!=mtt.id}">
													<option  value="${mtt.id}"  >${mtt.name}</option>
													</c:if>
						  						</c:forEach>
											</select>
											<h2>
											<span class="label alert-info col-md-3"> 备 注 : </span> 
										</h2> 
										<p class="text-success col-md-12">${menu.remark}</p>
				
									</div>
									</div>
								</div>
								<div class="col-md-12" style="padding-top: 10px;">
									<div class="col-md-offset-4">
										<a href="<%=rootPath%>/menus/getMenus">
											<button class="btn btn-info">返回</button>
										</a>
									</div>
								</div>
						</div>
						
					</div>
				
				</div>
				
			</div>
			</div>
			</div>
			<script type="text/javascript">
			
			</script>
			
		</body>
</html>