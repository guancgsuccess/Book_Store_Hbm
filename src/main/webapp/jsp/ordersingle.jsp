<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>订单详情</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/order_list.css" />
</head>

<body>
	<!--导航部分  begin-->
	<%@ include file="common/navbar.jsp"%>

	<!-- 删除模态框 -->
	<!--如果选中了一个商品的时候,出现-->
	<div id="two_del" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-warning" id="myModalLabel">删除!</h4>
				</div>
				<div class="modal-body">此操作一旦进行,数据将不可恢复!</div>
				<input type="hidden" id="hidstr">
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-danger" onclick="delconfirm()">确定删除</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	
			<!-- 清空order确认 -->
	<!--如果选中了一个商品的时候,出现-->
	<div id="clearoder" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-warning" id="clearModalLabel">删除!</h4>
				</div>
				<div class="modal-body">此操作一旦进行,数据将不可恢复!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-danger" onclick="clearoder()">确定删除</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>

	<!--订单begin-->
	<!--外层div-->
	<div class="container">
		<!--左边-->
		<div class="container pull-left">
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的订单</a></li>
			</ol>

			<!--订单查询导航 begin-->
			<div>
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<a class="navbar-brand" href="#">所有订单</a>
					</div>

					<form class="navbar-form navbar-left" role="search">
						<input type="text" class="form-control" id="searchnu"
							placeholder="输入订单号进行查询">
						<button type="button" class="btn btn-search" onclick="searchnum()">
							<span class="text-success">Search</span>&nbsp;&nbsp;<span
								class="glyphicon glyphicon-search"></span>
						</button>
					</form>
					<input type="hidden" id="status" value="${statusp}">
					<ul class="nav navbar-nav navbar-left">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> 交易状态 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:changestatus()">全部</a></li>
								<li class="divider"></li>
								<li><a href="javascript:changestatus(1)">已付款</a></li>
								<li class="divider"></li>
								<li><a href="javascript:changestatus(2)">未付款</a></li>
								<li class="divider"></li>
								<li><a href="javascript:changestatus(3)">交易成功</a></li>
								<li class="divider"></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-left">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> 订单排序 <b class="caret"></b>
						</a> <input type="hidden" id="flag" value="${flagp}">
							<ul class="dropdown-menu">
								<li><a href="javascript:changeflag(1)">订单日期降序</a></li>
								<li class="divider"></li>
								<li><a href="javascript:changeflag(2)">订单日期升序</a></li>
								<li class="divider"></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li style="padding-right: 15px;"><a data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo">更多筛选条件</a></li>
					</ul>

					<ul class="nav navbar-nav">
						<li><a href="javascript:delorder()">删除订单</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="#" data-toggle="modal" data-target="#clearoder">清空订单列表</a></li>
					</ul>
				</nav>
			</div>

			<!--订单查询导航 end-->
			<!--日期控件-->
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="form-group">
						<div>
							<form class="form-horizontal">
								<div class="form-group has-feedback">
									<div class="col-md-1" style="padding-top: 5px;">成交日期:</div>
									<div class="col-md-3">
										<input type="text" class="form-control" id="datetimepicker"
											placeholder="开始时间"> <span
											class="glyphicon glyphicon-time form-control-feedback"></span>
									</div>
									<div class="col-md-1"
										style="padding-top: 5px; text-align: center;">至</div>
									<div class="col-md-3">
										<input type="text" class="form-control" id="datetimepicker2"
											placeholder="结束日期"> <span
											class="glyphicon glyphicon-time form-control-feedback"></span>
									</div>
									<div class="col-md-3">
										<button type="button" onclick="sendParams2(1)"
											class="btn btn-default">
											查询&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--日期控件-->

			<!--内容展示 begin-->
			<div class="table-responsive">
				<c:if test="${empty page.list}">
					<h4>没有查询到此条订单</h4>
				</c:if>
				<c:if test="${!empty page.list}">
					<c:forEach items="${page.list}" var="order">
						<table class="table table-hover table-striped">
							<caption class="text-info">
								<div class="col-md-10" style="padding-left: 0px;">
									<input type="checkbox" name="cks" value="${order.orderId}">&nbsp;${order.createDate}
									订单号:${order.orderNum}单
								</div>

								<div class="col-md-2" style="text-align: right;">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse${order.orderId}">订单详情</a>
								</div>
							</caption>
							<thead>
								<tr id="collapse${order.orderId}"
									class="panel-collapse collapse">
									<td colspan="9">
										<div class="panel-body">
											<!--tab选项卡 begin-->
											<ul id="myTab" class="nav nav-tabs">
												<li class="active"><a href="#first${order.orderId}"
													data-toggle="tab"> 联系人信息 </a></li>
												<li><a href="#two${order.orderId}" data-toggle="tab">订单信息</a></li>
											</ul>
											<div id="myTabContent" class="tab-content">
												<div class="tab-pane fade in active"
													id="first${order.orderId}">
													<div class="row">
														<div>
															<ul class="nav navbar-collapse" style="line-height: 3;">
																<li class="text-info"><span class="text-success">姓名:</span><span
																	class="text-info">${order.address.reciver}</span></li>
																<li class="text-info"><span class="text-success">联系方式:</span>
																	${order.address.tel}</li>
																<li class="text-info"><span class="text-success">收货地址:</span>${order.address.area}${order.address.detailAddress}</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="tab-pane fade" id="two${order.orderId}">
													<div class="row">
														<div>
															<ul class="nav navbar-collapse" style="line-height: 3;">
																<li class="text-info"><span class="text-success">订单编号:</span><span
																	class="text-info">${order.orderNum}</span></li>
																<li class="text-info"><span class="text-success">交易时间:</span>${order.createDate}</li>
																<c:set var="total2" value="0.00"></c:set>
																<c:forEach items="${order.items}" var="it">
																	<c:set var="total2" value="${total2+it.allPrice}"></c:set>
																</c:forEach>
																<li class="text-info"><span class="text-success">订单总金额:</span>${total2}元</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div> <!--tab选项卡 end-->
									</td>
								</tr>
								<tr class="active">
									<th>序号</th>
									<th>图片</th>
									<th>图书名称</th>
									<th>单价(元)</th>
									<th>数量</th>
									<th>实付款(元)</th>
									<th>创建日期</th>
									<th>交易状态</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order.items}" var="item" varStatus="st">
									<tr class="warning">
										<td>${st.index+1000}</td>
										<td><img src="${path}/images/${map[item.book_isbn]}"></td>
										<td>${item.book_name}</td>
										<td>${item.price}</td>
										<td>${item.count}</td>
										<td>${item.allPrice}</td>
										<td>${order.createDate}</td>
										<td>${order.orderStatus}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</c:forEach>
				</c:if>

			</div>
			<!--内容展示end-->
		</div>
	</div>
	<div class="container">
		<hr>
		<!--首页底部信息 begin-->
		<%@include file="common/footer.jsp"%>
	</div>
	<!--end-->
	<script src="${path}/dist/js/jquery.min.js"></script>
	<script src="${path}/dist/js/bootstrap.min.js"></script>
	<script src="${path}/js/moment.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${path}/js/bootstrap-datetimepicker.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$('#datetimepicker').datetimepicker({
			format : 'YYYY-MM-DD',
		});
		$('#datetimepicker2').datetimepicker({
			format : 'YYYY-MM-DD',
		});
	</script>
	<script type="text/javascript">
		function changestatus(s) {
			var status = document.getElementById("status");
			status.value = s;
			sendParams2(1);
		}
		function changeflag(f) {
			var flag = document.getElementById("flag");
			flag.value = f;
			sendParams2(1);
		}
		function sendParams2(now) {
			var status = document.getElementById("status");
			var flag = document.getElementById("flag");
			var start = document.getElementById("datetimepicker");
			var end = document.getElementById("datetimepicker2");
			window.location.href = "${path}/permission/order/orderlist?status="
					+ status.value + "&flag=" + flag.value + "&now=" + now
					+ "&start=" + start.value + "&end=" + end.value;
		}

		function searchnum() {
			var searchnum = document.getElementById("searchnu");
			window.location.href = "${path}/permission/order/ordersingle?searchnum="
					+ searchnum.value;
		}

		function delorder() {
			var cks = document.getElementsByName("cks");
			var str = "";
			var count = 0;
			for (var i = 0; i < cks.length; i++) {
				if (cks[i].checked) {
					str += cks[i].value + ":";
					count++;
				}
			}
			if (count == 0) {
				var alarm = document.getElementById("alarm");
				alarm.innerText = "请至少选择一个！";
				$('#alarmModal').modal('show');
				return;
			}
			$('#hidstr').val(str);
			$('#two_del').modal('show');
		}

		function delconfirm() {
			var hidstr = document.getElementById("hidstr");
			window.location.href = "${path}/permission/order/del?ids="
					+ hidstr.value;
		}

		datecontrol();
		function datecontrol() {
			var datetimepicker = document.getElementById("datetimepicker");
			var datetimepicker2 = document.getElementById("datetimepicker2");
			datetimepicker.onblur = function() {
				if (datetimepicker2.value != null
						&& this.value > datetimepicker2.value) {
					alert("起止日期必须有先后");
					this.value = null;
					return;
				}
			};
			datetimepicker2.onblur = function() {
				if (datetimepicker.value != null
						&& this.value < datetimepicker.value) {
					alert("起止日期必须有先后");
					this.value = null;
					return;
				}
			};
		}
	</script>
	<script type="text/javascript">
		cover();
		function cover() {
			var navbarrr = document.getElementById("navbarrr");
			var lis = navbarrr.children;
			lis[4].className = "active";
		}
	</script>
	<script type="text/javascript">
		function clearoder() {
			window.location.href="${path}/permission/order/clear";
		}
	</script>
</body>
</html>