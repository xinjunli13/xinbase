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
		<script type="text/javascript">
			$(function(argument){
				$('[type="checkbox"]').bootstrapSwitch();
				
			});	
		</script>
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
			<div class="col-md-2 " style="height: 600px;">
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
			
			<div class="content  col-md-10">
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
				
				<div class="modal  fade" id="addModal" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h3>添加新餐桌</h3>
							</div>
							<form action="<%=rootPath%>/tables/addTables" method="post" class="form-horizontal">
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="personNumid">容纳人数</label>
										<div class="col-sm-10">
											<input type="text" id="personNumid" name="personNum" class="form-control"/>	
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="personNumid">描述</label>
										<div class="col-sm-10">
											<input type="text" name="discription" class="form-control"/>
										</div>	
									</div>
									<div class="form-group">
											<input type="hidden" name="tableState" value="0"/>	
									</div>
								</div>
								<div class="modal-footer">
									<a href="#" class="btn btn-warning" data-dismiss="modal" aria-hidden="true">取消</a>
									<button type="submit" class="btn btn-primary">添加</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-11"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">餐桌</li>
						</ul>
					</div>	
					<div class="col-md-offset-11">
						<div class="col-md-1 ">
							<div class="btn-toolbar">
								<a href="#addModal" role="button" class="btn btn-primary" data-toggle="modal">
									<i class="glyphicon glyphicon-plus"></i> 添加
								</a>
								<!-- <div class="btn-group"></div> -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="container-fluid"  style="padding-top: 50px;">
					<div class="row-fluid">
						
						<div class="well">
							<table class="table table-striped table-bordered bootstrap-datatable datatable">
								<thead>
									<tr>
										  <th>桌号</th>
								          <th>订单号</th>
								          <th>人数</th>
								          <th>描述</th>
								          <th>餐桌状态</th>
								          <th>操作</th>
								          <th style="width: 26px;"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="table" items="${tables }">
										<tr>
											<td>${table.id }</td>
											<td>${table.orderNo }</td>
											<td>${table.personNum }</td>
											<td>${table.discription }</td>
											<td>
											<!-- bootstrap switch.css -->
												<c:if test="${table.tableState == 1 }">
													<div >
														<input type="checkbox" checked="checked"  data-on-text="空闲" data-off-text="满座" readonly="readonly">
													</div>
												</c:if>
												<c:if test="${table.tableState == 0 }">
													<div  >
														<input type="checkbox" data-on-text="空闲" data-off-text="满座" readonly="readonly">
													</div>
												</c:if>
											</td>
											<td>
												<a class="btn btn-info" href="<%=rootPath%>/tables/getUpdateTable?id=${table.id }"><i class="glyphicon glyphicon-pencil"></i> 修改</a>
												<button onclick="" class="btn btn-warning"><i class="glyphicon glyphicon-remove"></i> 删除</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 分页 -->
						<div class="col-md-12">
							<div class="col-md-offset-4">
							<ul class="pagination">
								<c:if test="${hasPre == true}">
									<li><a href="<%=rootPath%>/tables/getTables?nowpage=${nowpage-1 }">上一页</a></li>
								</c:if>
								<c:if test="${nowpage > 3 }">
									<c:if test="${totalPage-nowpage < 3 }">
										<c:forEach var="i" begin="${nowpage-3 }" end="${totalPage }">
											<li>
												<a href="<%=rootPath%>/tables/getTables?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${totalPage-nowpage >= 3 }">
										<c:forEach var="i" begin="${nowpage-3 }" end="${nowpage+3 }">
											<li>
												<a href="<%=rootPath%>/tables/getTables?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${nowpage <= 3 }">
									<c:if test="${totalPage-nowpage < 3 }">
										<c:forEach var="i" begin="1" end="${totalPage }">
											<li>
												<a href="<%=rootPath%>/tables/getTables?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
									<c:if test="${totalPage-nowpage >= 3 }">
										<c:forEach var="i" begin="1" end="${nowpage+3 }">
											<li>
												<a href="<%=rootPath%>/tables/getTables?nowpage=${i }">${i }</a>
											</li>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${hasNext == true }">
									<li><a href="<%=rootPath%>/tables/getTables?nowpage=${nowpage+1 }">下一页</a></li>
								</c:if>
							</ul>
						</div>
						</div>
					</div>
				
				</div>
				
			</div>
			</div>
			</div>
		</body>
</html>