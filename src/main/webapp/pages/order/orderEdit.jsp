<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	String rootPath = request.getContextPath();%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../mainIndex.jsp"%>
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
				<li><a href=""
					class="hidden-phone visible-tablet visible-desktop">设置</a></li>
				<li id="user-menu" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="glyphicon glyphicon-user"></i> ${userBean.userName} <i
						class="glyphicon glyphicon-triangle-bottom"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="<%=rootPath%>/userBean/getOneUser">个人中心</a></li>
						<li><a href="<%=rootPath%>/login/loginOut">退出</a></li>
					</ul></li>
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

				<c:forEach items="${resources }" var="resource">
					<%-- <a href="#${resource.idName }" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>${resource.name}</a> --%>
					<ul id="${resource.idName }" class="nav nav-tabs nav-stacked">
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
							<li class="active">订单修改</li>
						</ul>
					</div>	
				</div>

				<div class="container-fluid">
					<div class="row-fluid">
						<!-- well嵌入的效果 -->
						<div class="">
							<form action="<%=rootPath%>/orders/updateOrder" method="post"
								class="form-horizontal" role="form">
								<div class="form-group">
									<input type="hidden" name="id" value="${order.id }">
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="personNumid">人数</label>
									<div class="col-sm-10">
										<input type="text" id="personNumid" name="personNum"
											class="form-control" value="${order.personNum }" />
									</div>
								</div>
								<div class="form-group">
									<!-- 下拉列表 -->
									<label class="col-sm-2 control-label" for="tableIdid">客桌</label>
									<div class="col-sm-10">
										<select id="tableIdid" name="tableId" class="form-control">
											<c:forEach items="${tables }" var="table">
												<c:if test="${order.tableId == table.id }">
													<option value="${table.id }" selected="selected">第${table.id
														}桌，可容纳${table.personNum }人</option>
												</c:if>
												<c:if test="${order.tableId != table.id }">
													<option value="${table.id }">第${table.id
														}桌，可容纳${table.personNum }人</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 多选下拉 -->
									<label class="col-sm-2 control-label" for="menusid">菜单</label>
									<div class="col-sm-10">
										<select multiple="multiple" id="menusid" name="menuIds"
											class="form-control">

											<c:forEach items="${menus }" var="menu">
												<%-- <c:forEach items="${order.orderDetails }" var="orderitem">
													<c:if test="${orderitem.menuId == menu.id }">
														<option value="${menu.id }" selected="selected">${menu.name
															}</option>
													</c:if>
													<c:if test="${orderitem.menuId != menu.id }">
														<option value="${menu.id }">${menu.name }</option>
													</c:if>
												</c:forEach> --%>
												<option value="${menu.id }">${menu.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!-- 用bootstrap的date控件  引入文件-->
									<label class="col-sm-2 control-label" for="dtp_input1">下单时间</label>
									<div
										class="col-md-8 col-md-offset-3 input-group date form_datetime"
										data-date="1979-09-16T05:25:07Z"
										data-date-format="yyyy-mm-dd HH:mm:ss"
										data-link-field="dtp_input1">
										<input type="text" id="orderTimeid" name="orderTime"
											class="form-control" size="16" readonly="readonly" value="${order.orderTime }"/> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-remove"></span></span> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-time"></span></span>
									</div>
									<span style="position: relative; z-index: 9999;"> <input
										type="hidden" id="dtp_input1" value="">
									</span>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="remarkId">描述</label>
									<div class="col-sm-10">
										<input type="text" id="remarkId" name="remark"
											class="form-control" value="${order.remark }" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="idpayid">是否结账</label>
									<div class="col-sm-10">
										<input id="idpayid" type="text" name="idpay"
											class="form-control" value="${order.idpay }" />
											<span class="help-block">"0表示未结账，1表示已结账"</span>
									</div>
								</div>
								
								<div class=" col-md-12">
									<div class="col-md-offset-4">

										<button type="submit" class="btn btn-primary">保 存</button>
										<a href="<%=rootPath%>/orders/getOrders"> <span
											class="btn btn-info">返回</span>
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
		$(".form_datetime").datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		//子午线？!!!!!!!!!!写在body里  写在head里不起作用！！！！！！！！！！！！！！！！！操蛋
		});
	</script>

</body>
</html>