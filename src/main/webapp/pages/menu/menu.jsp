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
		<body >
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
					<ul id="${resource.idName }" class="nav nav-tabs  nav-stacked" >	
						<li><a href="<%=rootPath%>${resource.url }">${resource.name }</a></li>
					</ul>
				</c:forEach>	
			</div>
			
			<div class="content col-md-10 " >
				<div id="myModal" class="modal hide fade" >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"aria-hidden="true">&times;</button>
						<h3>警号</h3>
					</div>
					<div class="modal-body">
						<p>确定删除吗？</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">关闭</a>
						<a href="#" id="delbtn2" class="btn btn-primary">确认</a>
					</div>
				</div>
				
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-11"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">订单</li>
						</ul>
					</div>	
					<div class="col-md-offset-11">
						<div class="col-md-1 ">
							<div class="btn-toolbar">
								<a href="<%=rootPath%>/menus/getOneMenuAdd" role="button" class="btn btn-primary" data-toggle="modal">
									<i class="glyphicon glyphicon-plus"></i> 添加
								</a>
								<!-- <div class="btn-group"></div> -->
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row-fluid">
						<%-- <div class="row-fluid">
							<div class="btn-toolbar col-md-12 well">
								<a href="<%=rootPath%>/menus/getOneMenuAdd" role="button" class="btn btn-primary" >
									<i class="glyphicon glyphicon-plus"></i> 添加
								</a>
								<!-- <div class="btn-group"></div> -->
							</div>
							<c:if test="">
								<div class="alert alert-info col-md-6">
									<button type="button" class="close" data-dismiss="alert">x</button>
									<strong>小提示：</strong> 添加成功！
								</div>
							</c:if>
						</div> --%>
						<!-- well嵌入的效果 -->
						<div >
							<ul class="thumbnails col-md-12">
								<!-- 能不能把div的class放入ul里 -->
								<div class="row-fluid">
									<c:forEach var="menu" items="${menus }" begin="0" end="3">
										<li class="thumbnail col-md-3">
											<div >
												<img alt="yyy" src="<%=basePath %>images/${menu.imgName }" width="220" height="170">
												<h3>${menu.name }</h3>
												<!-- nowpage没加 -->
												<a href="<%=rootPath%>/menus/getPreMenu?id=${menu.id }" class="btn btn-primary">预览</a>
												<a class="btn btn-info" href="<%=rootPath%>/menus/getOneMenu?id=${menu.id }">
													<i class="glyphicon glyphicon-pencil"></i> 修改
												</a>
												<a onclick="del(this)" class="btn btn-warning" delid="${menu.id }" pNow="${nowpage }">
													<i class="glyphicon glyphicon-remove"></i> 删除
												</a>
											</div>
										</li>
									</c:forEach>
								</div>
								
								<div class="row-fluid">
									<c:forEach var="menu" items="${menus }" begin="4" end="7">
										<li class="thumbnail col-md-3">
											<div>
												<img alt="yyy" src="<%=basePath %>images/${menu.imgName }" width="220" height="170">
												<h3>${menu.name }</h3>
												<a href="<%=rootPath%>/menus/getPreMenu?id=${menu.id }" class="btn btn-primary">预览</a>
												<a class="btn btn-info" href="<%=rootPath%>/menus/getOneMenu?id=${menu.id }">
													<i class="glyphicon glyphicon-pencil"></i> 修改
												</a>
												<a onclick="del(this)" class="btn btn-warning" delid="${menu.id }" pNow="${nowpage }">
													<i class="glyphicon glyphicon-remove"></i> 删除
												</a>
											</div>
										</li>
									</c:forEach>
								</div>
							</ul>
						</div>
						
						<!-- 分页 -->
						<div class="col-md-12">
							<div class="col-md-offset-4">
							<ul class="pagination">
								<c:if test="${hasPre == true}">
									<li><a href="<%=rootPath%>/menus/getMenus?nowpage=${nowpage-1 }">上一页</a></li>
								</c:if>
								<c:if test="${nowpage > 3 }">
									<c:if test="${totalPage-nowpage < 3 }">
										<c:forEach var="i" begin="${nowpage-3 }" end="${totalPage }">
											<li>
												<a href="<%=rootPath%>/menus/getMenus?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${totalPage-nowpage >= 3 }">
										<c:forEach var="i" begin="${nowpage-3 }" end="${nowpage+3 }">
											<li>
												<a href="<%=rootPath%>/menus/getMenus?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${nowpage <= 3 }">
									<c:if test="${totalPage-nowpage < 3 }">
										<c:forEach var="i" begin="1" end="${totalPage }">
											<li>
												<a href="<%=rootPath%>/menus/getMenus?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${totalPage-nowpage >= 3 }">
										<c:forEach var="i" begin="1" end="${nowpage+3 }">
											<li>
												<a href="<%=rootPath%>/menus/getMenus?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${hasNext == true }">
									<li><a href="<%=rootPath%>/menus/getMenus?nowpage=${nowpage+1 }">下一页</a></li>
								</c:if>
							</ul>
							</div>
						</div>
					</div>
				
				</div>
				
			</div>
			</div>
			</div>
			<script type="text/javascript">
				function del(e){
					
					var delid = $(e).attr("delid");
					//var pNow = $(e).attr("pNow");
					if(confirm("确定删除？")){
						$.ajax({
							url:"<%=rootPath%>/menus/deleteMenu?id="+delid,
							dataType:"json",
							type:"get",
							success:function(result){
								if(result){
									document.forms[0].action = "<%=rootPath%>/menus/getMenus";
									document.forms[0].submit();
									//window.location.href ajax异步的失效
								}
							}
						});
					}
				}
			
			</script>
			
		</body>
</html>