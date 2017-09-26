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
			
			<div class="content col-md-10 " >
				<div class="row-fluid col-md-12 " style="padding-top: 10px;">
					<div class="col-md-12"> 
						<!-- <div class="header">
							<h3 class="page-title">订单</h3>
						</div> -->
						<ul class="breadcrumb">
							<li><a href="#">主页</a></li>
							<li class="active">个人中心</li>
						</ul>
					</div>	
				</div>
				<div class="container-fluid">
					<div class="row-fluid">
						
							
							<div class="well col-md-12">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
									<li><a href="#passwordedit" data-toggle="tab">密码修改</a></li>
								</ul>
							</div>
							<c:if test="${edituser=='success' }">
								<div class="alert alert-info">
									<button type="button" class="close" data-dismiss="alert">x</button>
									<strong>小提示：</strong> 修改成功！
								</div>
							</c:if>
							<div id="myTabContent" class="tab-content">
								
									<div id="home" class="tab-pane active in">
									<div class="col-md-8">
										<form id="tab" action="<%=rootPath%>/userBean/updateUserBean" class="form-horizontal" method="post">
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="uidid">用户id</label>
									            <div class="col-sm-10">
									              <input type="text" class="form-control" id="uidid" name="id" value="${user.id }">
									            </div>
									        </div>
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="unameid">用户名</label>
									            <div class="col-sm-10">
									              <input type="text" class="form-control" id="unameid" name="userName" value="${user.userName }">
									            </div>
									        </div>
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="nameid">真实姓名</label>
									            <div class="col-sm-10">
									              <input type="text" class="form-control" id="nameid" name="name" value="${user.name }">
									            </div>
									        </div>
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="genderid">性别</label>
									            <div class="col-sm-2 control-label">
									              <input type="text" class="form-control" id="genderid" name="gender" value="${user.gender }">
									            </div>
									        </div>
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="permissionid">权限</label>
									            <div class="col-sm-10">
									              <input type="text" class="form-control" id="permissionid" name="permission" value="${user.permission }">
									            </div>
									        </div>
											<div class="form-group">
									            <label class="col-sm-2 control-label" for="remarkid">备注</label>
									            <div class="col-sm-10">
									              <input type="text" class="form-control" id="remarkid" name="remark" value="${user.remark }">
									            </div>
									        </div>
											<%-- <label for="uidid">用户id</label>
									        <input id="uidid" name="id" type="text" value="${user.id}" class="input-xlarge uneditable-input">
									        <label for="unameid">用户名</label>
									        <input id="unameid" name="userName"  type="text" value="${user.userName}" class="input-xlarge">
									        <label for="nameid">真实姓名</label>
									        <input id="nameid"  name="name"  type="text" value="${user.name}" class="input-xlarge">
									        <label for="genderid">性别</label>
									        <input id="genderid" name="gender"  type="text" value="${user.gender}" class="input-xlarge">
									        <label for="permissionid">权限</label>
									        <input id="permissionid" name="permission"  type="text" value="${user.permission}" class="input-xlarge">
									        <label for="remarkid">备注</label>
									        <input id="remarkid" name="remark"  type="text" value="${user.remark}" class="input-xlarge"> --%>
											<div class="btn-toolbar col-md-12">
												<div class="col-md-offset-4">
													<button class="btn btn-primary col-md-4 "><i class="icon-save"></i> 保存</button>
												</div>
											</div>
										</form>
										</div>
									</div>
									
								<div id="passwordedit" class="tab-pane fade">
									<form id="tab2" action="<%=rootPath%>/userBean/updateUserBean" method="post" class="form-horizontal">
										<input type="hidden" name="id" value="${user.id }"/>
										<div class="form-group">
											<label for="password" class="col-sm-2 btn btn-default">新密码</label>
											<div class="col-sm-10">
											<input type="password" id="passowrd" name="passWord" class="form-control ">
											</div>
										</div>
										<div class="btn-toolbar col-md-12" >
											<div class="col-md-offset-4">
												<button class="btn btn-primary col-md-4">更改</button>
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
			
		</body>
</html>