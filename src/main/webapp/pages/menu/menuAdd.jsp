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
			<div class="col-md-2">
				<form class="form-group" style="padding-top: 10px;">
					<input type="text" placeholder="Search..." class="form-control">
				</form>	
				
				<c:forEach items="${resources }" var="resource" >
					<%-- <a href="#${resource.idName }" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>${resource.name}</a> --%>
					<ul id="${resource.idName }" class="nav nav-list" >	
						<li><a href="<%=rootPath%>${resource.url }">${resource.name }</a></li>
					</ul>
				</c:forEach>	
			</div>
			
			<div class="content col-md-10 ">
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
					<div class="col-md-12"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">菜谱添加</li>
						</ul>
					</div>	
				</div>
				
				<div class="container-fluid">
					<div class="row-fluid">
						<!-- well嵌入的效果 -->
						<div class="col-md-12">
							<form action="<%=rootPath%>/menus/addMenu" method="post" class="form-horizontal" enctype="multipart/form-data">
								<div class="row-fluid">
									<div class="col-md-12">
										
										<div class="form-group">
											<label class="col-sm-2 control-label" for="name">菜名</label>
											<div class="col-sm-10">
												<input type="text" name="name" class="form-control" id="name" >
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="price">价格</label>
											<div class="col-sm-10">
												<input type="text" name="price" class="form-control" id="price" >
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="menutype">类型</label>
											<div class="col-sm-10">
												<select id="menutype" name="mtid" class="form-control">
													<c:forEach items="${menutypelist}" var="mtt">
															<option  value="${mtt.id}">${mtt.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										
									<!-- 	<input type="hidden" name="id"> -->
										<div class="form-group">
											<label class="col-sm-2 control-label" for="remark">备注</label>
											<div class="col-sm-10">
												<textarea rows="4" cols="20" name="remark" class="form-control" id="remark" ></textarea>
											</div>
										</div>
										<div class="form-group ">
										<label class="col-sm-2 control-label" for="photo">图片</label>
											<div class="col-sm-10">
												<input type="file" name="photo" id="photo" class="form-control">
											</div>										
										</div>
									</div>
									<%-- <div class="col-md-5">
											<div class="thumbnail" style="width:220px;height:170px">
												<input type="hidden" name="imgName" value="${menu.imgName }">
												<img alt="yyy" src="<%=rootPath%>/images/${menu.imgName }">
											</div>
											
											<div class="form-group">
												<div class="btn btn-default">
													<input type="file" name="photo" id="photo">
												</div>										
											</div>
											<!-- <span class="btn btn-file" >
												<span class="glyphicon glyphicon-open-file">上传图片</span>
												<span class="glyphicon glyphicon-edit">更改</span>
											</span>
											<a href="#" class="glyphicon glyphicon-remove" data-dismiss>删除</a> -->
											
										</div> --%>
									</div>
								
								<div class="col-md-12">
									<div class="col-md-offset-4">
										<button type="submit" class="btn btn-primary">提交</button>
										<a href="<%=rootPath%>/menus/getMenus">
											<span class="btn btn-info">返回</span>
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
			<script type="text/javascript">
			
			</script>
			
		</body>
</html>