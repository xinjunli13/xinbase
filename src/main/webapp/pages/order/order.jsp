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
			
		</script>
	</head>
		<body class="">
			<div class="daohangbackgc">
			<div class="navbar-header col-md-12  navbar-inverse" role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="hidden-phone visible-tablet visible-desktop">设置</a></li>
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
								<h3>添加新订单</h3>
							</div>
							<form action="<%=rootPath%>/orders/addOrder" method="post" class="form-horizontal" role="form" >
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-2 control-label" for="personNumid">人数</label>
										<div class="col-sm-10">
											<input type="text" id="personNumid" name="personNum" class="form-control"/>
										</div>	
									</div>
									<div class="form-group"><!-- 下拉列表 -->
										<label class="col-sm-2 control-label" for="tableIdid">客桌</label>
										<div class="col-sm-10">
											<select  id="tableIdid" name="tableId" class="form-control">
												<c:forEach items="${tables }" var="table">
													<option value="${table.id }">第${table.id }桌，可容纳${table.personNum }人</option>
												</c:forEach>
											</select>	
										</div>
									</div>
									<div class="form-group"><!-- 多选下拉 -->
										<label class="col-sm-2 control-label" for="menusid">菜单</label>
										<div class="col-sm-10">
											<select multiple="multiple" id="menusid" name="menuIds" class="form-control">
												<c:forEach items="${menus }" var="menu">
													<option value="${menu.id }">${menu.name }</option>
												</c:forEach>
											</select>
										</div>	
									</div>
									<div class="form-group"><!-- 用bootstrap的date控件  引入文件-->
										<label class="col-sm-2 control-label" for="dtp_input1">下单时间</label>
										<div class="col-md-8 col-md-offset-3 input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-dd HH:mm:ss" data-link-field="dtp_input1">
											<input type="text" id="orderTimeid" name="orderTime" class="form-control" size="16" readonly="readonly"/>
											<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
										</div>
										<span style="position: relative;z-index: 9999;">
										<input type="hidden" id="dtp_input1" value="">	
										</span>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="remarkId">描述</label>
										<div class="col-sm-10">
											<input type="text" id="remarkId" name="remark" class="form-control"/>
										</div>	
									</div>
									<div class="form-group"><!-- 结账隐藏  -->
											<input type="hidden" name="idpay" value="0"/>	
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
							<li class="active">订单</li>
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
				<!-- <ul class="breadcrumb">
					<li><a href="#">主页</a></li>
					<li class="active">订单</li>
				</ul> -->
				
				<div class="container-fluid"  style="padding-top: 50px;">
					<div class="row-fluid">
						<%-- <div class="row-fluid">
							<div class="btn-toolbar">
								<a href="#addModal" role="button" class="btn btn-primary" data-toggle="modal">
									<i class="glyphicon glyphicon-plus"></i> 添加
								</a>
								<!-- <div class="btn-group"></div> -->
							</div>
							<c:if test="">
								<div class="alert alert-info">
									<button type="button" class="close" data-dismiss="alert">X</button>
									<strong>小提示：</strong> 添加成功！
								</div>
							</c:if>
						</div> --%>
						<!-- well嵌入的效果 -->
						<div class="well">
							 <table class="table table-striped table-bordered bootstrap-datatable datatable">
							        <tr>
							          <th>订单编号</th>
							          <th>桌号</th>
							          <th>下单时间</th>
							          <th>总价</th>
							          <th>是否结账</th>
							          <th>描述</th>
							          <th>操作</th>
							          <th style="width: 26px;"></th>
							        </tr>
							      <c:forEach items="${orders}" var="tbl">
							        <tr>
							          <td>${tbl.id}</td>
							          <td>${tbl.tableId}</td>
							          <td>${tbl.orderTime}</td>
							          <td><!-- 怎么实现的？ -->
							              <c:set var="totalPrice" value="${0}"></c:set>      
										<c:forEach items="${tbl.orderDetails}"  var="od_list">       
							 			  <c:set var="totalPrice" value="${totalPrice+ (od_list.menus.price*od_list.num)}"/>
										</c:forEach>
											${totalPrice}
							          </td>
							          <td>
							          		<c:if test="${tbl.idpay==1}">
							            	<div >
							            	 <input  type="checkbox" checked data-on-text="已结账" data-off-text="未结账" readonly="readonly">
							          		 </div>
							             	</c:if>
							             	<c:if test="${tbl.idpay==0}">
							            	<div >
							             	<input type="checkbox" data-on-text="已结账" data-off-text="未结账" readonly="readonly" >
							           		</div>
							            	 </c:if>
							          </td>
							          <td>${tbl.remark }</td>
							          <td>
							           <a href="<%=rootPath%>/orders/getOneUpdateOrder?id=${tbl.id}" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i> 修改</a>
							              <button  onclick="del(this)"  delid="${tbl.id}" pNow="${nowpage}" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> 删除</button>
							       </td>
							        </tr>
							        </c:forEach>
							    </table>
						</div>
						
						<!-- 分页 -->
						<div class="col-md-12">
							<div class="col-md-offset-4">
								<ul class="pagination">
									<c:if test="${hasPre == true}">
										<li><a href="<%=rootPath%>/orders/getOrders?nowpage=${nowpage-1 }">上一页</a></li>
									</c:if>
									<c:if test="${nowpage > 3 }">
										<c:if test="${totalPage-nowpage < 3 }">
											<c:forEach var="i" begin="${nowpage-3 }" end="${totalPage }">
												<li>
													<a href="<%=rootPath%>/orders/getOrders?nowpage=${i }">${i }</a>
												</li>
											</c:forEach>
										</c:if>
										<c:if test="${totalPage-nowpage >= 3 }">
											<c:forEach var="i" begin="${nowpage-3 }" end="${nowpage+3 }">
												<li>
													<a href="<%=rootPath%>/orders/getOrders?nowpage=${i }">${i }</a>
												</li>
											</c:forEach>
										</c:if>
									</c:if>
									<c:if test="${nowpage <= 3 }">
										<c:if test="${totalPage-nowpage < 3 }">
											<c:forEach var="i" begin="1" end="${totalPage }">
												<li>
													<a href="<%=rootPath%>/orders/getOrders?nowpage=${i }">${i }</a>
												</li>
											</c:forEach>
										</c:if>
										<c:if test="${totalPage-nowpage >= 3 }">
											<c:forEach var="i" begin="1" end="${nowpage+3 }">
												<li>
													<a href="<%=rootPath%>/orders/getOrders?nowpage=${i }">${i }</a>
												</li>
											</c:forEach>
										</c:if>
									</c:if>
									<c:if test="${hasNext == true }">
										<li><a href="<%=rootPath%>/orders/getOrders?nowpage=${nowpage+1 }">下一页</a></li>
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
				$(function(argument){
					$('[type="checkbox"]').bootstrapSwitch();
					
				});	
				
				$(".form_datetime").datetimepicker({
					language:'zh-CN',
					weekStart:1,
					todayBtn:1,
					autoclose:1,
					todayHighlight:1,
					startView:2,
					forceParse:0,
					showMeridian:1   //子午线？!!!!!!!!!!写在body里  写在head里不起作用！！！！！！！！！！！！！！！！！操蛋----加载顺序？
				});
			
			
			
			</script>
			
		</body>
</html>