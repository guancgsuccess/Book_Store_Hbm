<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/cart.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />

<style type="text/css">
.form-control {
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="common/navbar.jsp"%>
	<!--购物车 begin-->
	<!--外层div-->
	<div class="container">
		<!--左边-->
		<div class="col-md-8 col-sm-12">
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;送货地址</a></li>
			</ol>

			<!--送货地址  begin-->
			<div style="margin-bottom: 5px;" id="addrDiv">
				<ul class="list-group" id="address">
					<c:if test="${empty addresss}">
						<a href="javascript:void(0)" class="text-success"
							data-toggle="modal" data-target="#addrModal"><span>收货地址未设置，点击添加</span></a>
					</c:if>
					<c:forEach items="${addresss}" var="address" varStatus="status">
						<c:if test="${address.isDefault=='Y'}">
							<li class="list-group-item"><input type="hidden"
								value="${address.addressId}"><input type="radio" checked
								name="addr">&nbsp;${address.area}&nbsp;${address.detailAddress}&nbsp;<span
								class="text-success">默认地址</span></li>
						</c:if>
					</c:forEach>
					<c:forEach items="${addresss}" var="address" varStatus="status">
						<c:if test="${address.isDefault!='Y'}">
							<c:if test="${status.index<4}">
								<li class="list-group-item"><input type="hidden"
									value="${address.addressId}"><input type="radio"
									name="addr">&nbsp;${address.area}&nbsp;${address.detailAddress}</li>
							</c:if>
							<c:if test="${status.index>=4}">
								<li class="list-group-item hidden"><input type="hidden"
									value="${address.addressId}"><input type="radio"
									name="addr">&nbsp;${address.area}&nbsp;${address.detailAddress}</li>
							</c:if>
						</c:if>
					</c:forEach>


				</ul>
				<a href="#" class="text-info" onclick="dispalyMoreAddr(this)">更多地址↓&nbsp;&nbsp;</a>
				<a href="javascript:void(0)" id="addAddr" class="text-success"
					data-toggle="modal" data-target="#addrModal">添加新地址</a>
			</div>
			<hr>


			<!--添加新地址模态框 begin-->
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="addrModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">
								<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;添加新收货地址
							</h4>
						</div>
						<div class="modal-body">
							<!--登录的form表单-->
							<form action="" class="form-horizontal" role="form">
								<div class="form-group">
									<label class="col-md-2 control-label"
										style="margin-right: 2.9%;">所在地区:</label>

									<div data-toggle="distpicker">
										<div class="form-group col-sm-12 col-md-3">
											<label class="sr-only" for="province1">Province</label> <select
												class="form-control" id="province1"></select>
										</div>
										<div class="form-group col-sm-12 col-md-3">
											<label class="sr-only" for="city1">City</label> <select
												class="form-control" id="city1"></select>
										</div>
										<div class="form-group col-sm-12 col-md-3">
											<label class="sr-only" for="district1">District</label> <select
												class="form-control" id="district1"></select>
										</div>
									</div>
								</div>
								<div class="form-group has-feedback" style="clear: both">
									<label for="deatails" class="col-sm-2 control-label">详细地址:</label>
									<div class="col-sm-5">
										<textarea class="form-control" id="deatailsc"></textarea>
									</div>
									<label class="col-sm-5 control-label"></label>

								</div>
								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">邮政编码</label>
									<div class="col-md-5">
										<input type="text" class="form-control" id="mailcodec"
											placeholder="邮政编码"> <span
											class="glyphicon glyphicon-hand-left form-control-feedback"></span>
									</div>
									<label class="col-sm-5 control-label"></label>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="usernamec"
											placeholder="收货人姓名"> <span
											class="glyphicon glyphicon-user form-control-feedback"></span>
									</div>
									<label class="col-sm-5 control-label"></label>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">电话</label>
									<div class="col-sm-5">
										<input type="tel" class="form-control" id="telc"
											placeholder="合法手机格式"> <span
											class="glyphicon glyphicon-phone form-control-feedback"></span>
									</div>
									<label class="col-sm-5 control-label"></label>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="checkbox">
											<label> <input type="checkbox" id="setDefaultAddr"><span
												class="text-success">设置默认地址</span>
											</label>
										</div>
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<input type="button" class="btn btn-primary" value="提交地址"
										onclick="doAdd('p')">
								</div>
							</form>
							<!--form结束-->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!--左边-->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;结算清单</a></li>
			</ol>

			<!--购物车表格 begin-->
			<div class="table-responsive" id="imgDiv">
				<table class="table table-hover table-striped"
					style="vertical-align: middle;">
					<thead>
						<tr class="text-success success">
							<th id="sequence">序号</th>
							<th>图片</th>
							<th>书名</th>
							<th>单价</th>
							<th>数量</th>
							<th>合计</th>
						</tr>
					</thead>
					<tbody id="tby">
						<c:set var="tot" value="0.00"></c:set>
						<c:forEach items="${bookAndItemTmp}" var="tag" varStatus="status">
							<tr>
								<td>${status.index+1000}</td>
								<td><img src="${path}/images/${tag.key.images[0].url}"></td>
								<td>${tag.value.book_name}</td>
								<td>${tag.value.price}元</td>
								<td>${tag.value.count}</td>
								<td><fmt:formatNumber value="${tag.value.allPrice}"
										pattern="#,#00.0#" />元</td>
							</tr>
							<input type="hidden" value="${tag.key.bookId}">
							<c:set var="tot" value="${tot+tag.value.allPrice}"></c:set>
						</c:forEach>

					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"></td>
							<td class="text-success">总价:</td>
							<td class="text-success" id="ttprice"><fmt:formatNumber
									value="${tot}" pattern="#,#00.0#" />元</td>
						</tr>
						<tr style="background-color: white;">
							<td><a href="${path}/book/index" class="btn btn-info">&lt;&lt;继续购买</a>
							</td>
							<td colspan="4"></td>
							<td><a href="javascript:submitorder()"
								class="btn btn-warning">提交订单</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!--购物车 end-->

		</div>
		<!--右边-->
		<%@include file="common/sidebar.jsp"%>
	</div>

	<%@include file="common/footer.jsp"%>
	<!--end-->
	<script src="${path}/dist/js/jquery.min.js"></script>
	<script src="${path}/js/wow.js"></script>
	<script src="${path}/js/carousel.js" type="text/javascript"></script>
	<script src="${path}/dist/js/bootstrap.min.js"></script>
	<script src="${path}/dist/js/distpicker.data.min.js"></script>
	<script src="${path}/dist/js/distpicker.min.js"></script>
	<script src="${path}/js/details.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${path}/js/cart.js" type="text/javascript" charset="utf-8"></script>
	<script src="${path}/js/confirm_order.js"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>
	<script type="text/javascript">
		doAdd();
		var flag = false;
		function doAdd(param) {
			var deatails = document.getElementById("deatailsc");
			checkAddr(deatails, "不能为空", function(val) {
				if (val.trim().length > 0) {
					flag = true;
					return true;
				} else {
					flag = false;
					return false;
				}
			}, param);

			var mailcode = document.getElementById("mailcodec");
			checkAddr(mailcode, "邮编格式不正确", function(val) {
				var reg = /^[1-9][0-9]{5}$/;
				if (reg.test(val)) {
					flag = true;
					return true;
				} else {
					flag = false;
					return false;
				}
			}, param);

			var username = document.getElementById("usernamec");
			checkAddr(username, "不能为空", function(val) {
				if (val.trim().length > 0) {
					flag = true;
					return true;
				} else {
					flag = false;
					return false;
				}
			}, param);

			var tel = document.getElementById("telc");
			checkAddr(tel, "手机格式不正确", function(val) {
				var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
				if (reg.test(val)) {
					flag = true;
					return true;
				} else {
					flag = false;
					return false;
				}
			}, param);

			if (flag) {
				var province1 = document.getElementById("province1");
				var city1 = document.getElementById("city1");
				var district1 = document.getElementById("district1");
				var setDefaultAddr = document.getElementById("setDefaultAddr");
				var cb = "N";
				if (setDefaultAddr.checked) {
					cb = "Y";
				}
				var xmlhttp = new XMLHttpRequest();

				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						var address = document.getElementById("address");
						var addrs = JSON.parse(xmlhttp.responseText);
						var str = "";
						var count = 0;

						for ( var o in addrs) {
							if (addrs[o].isDefault == "Y") {
								count++;
								str += "<li class='list-group-item'><input type='hidden' value='"+addrs[o].addressId+"'><input type='radio' checked name='addr'>&nbsp;"
										+ addrs[o].area
										+ "&nbsp;"
										+ addrs[o].detailAddress
										+ "&nbsp;<span class='text-success'>默认地址</span></li>";
							}
						}
						for ( var o in addrs) {
							if (addrs[o].isDefault == "N") {
								count++;
								if (count <= 5) {
									str += "<li class='list-group-item'><input type='hidden' value='"+addrs[o].addressId+"'><input type='radio' name='addr'>&nbsp;"
											+ addrs[o].area
											+ "&nbsp;"
											+ addrs[o].detailAddress + "</li>";
								} else {
									str += "<li class='list-group-item hidden'><input type='hidden' value='"+addrs[o].addressId+"'><input type='radio' name='addr'>&nbsp;"
											+ addrs[o].area
											+ "&nbsp;"
											+ addrs[o].detailAddress + "</li>";
								}

							}
						}
						address.innerHTML = str;

						var alarm = document.getElementById("alarm");
						alarm.innerText = "地址添加成功";
						$('#addrModal').modal('hide');
						$('#alarmModal').modal('show');
					}

				};
				xmlhttp.open("post", "${path}/permission/order/addaddr", true);
				xmlhttp.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");

				xmlhttp.send("area=" + province1.value + city1.value
						+ district1.value + "&deatails=" + deatails.value
						+ "&mailcode=" + mailcode.value + "&username="
						+ username.value + "&tel=" + tel.value + "&isdefault="
						+ cb);
			}
		}
		function checkAddr(obj, info, fun, param) {
			var label = obj.parentNode.nextElementSibling;
			obj.onfocus = function() {
				label.className = "text-primary";
				obj.parentNode.className = "col-sm-5";
			};
			obj.onblur = function() {
				if (fun(obj.value)) {
					flag = true;
					label.className = "text-success";
					label.innerText = "√";
					obj.parentNode.className = "col-sm-5 has-success";

				} else {
					flag = false;
					label.className = "text-danger";
					label.innerText = info;
					obj.parentNode.className = "col-sm-5 has-error";

				}
			};
			if (param == "p") {
				obj.onblur();
			}

		}
	</script>
	<script type="text/javascript">
		function submitorder() {
			var address = document.getElementById("address");
			var lis = address.children;
			var addrid = "";
			var count = 0;
			for (var i = 0; i < lis.length; i++) {
				if (lis[i].children[1].checked) {
					count++;
					addrid = lis[i].children[0].value;
				}
			}
			if (count == 0) {
				var alarm = document.getElementById("alarm");
				alarm.innerText = "地址未选择！";
				$('#alarmModal').modal('show');
				return;
			}
			var tbody = document.getElementById("tby");
			var inps = tbody.getElementsByTagName("input");
			var bids = "";
			if (inps.length == 0) {
				var alarm = document.getElementById("alarm");
				alarm.innerText = "没有任何商品！";
				$('#alarmModal').modal('show');
				return;
			}
			for (var i = 0; i < inps.length; i++) {
				bids += inps[i].value + ":";
			}
			window.location.href = "${path}/permission/order/submitorder?addrid="
					+ addrid + "&bids=" + bids;

		}
	</script>
		<script type="text/javascript">
		cover();
		function cover() {
			var navbarrr = document.getElementById("navbarrr");
			var lis = navbarrr.children;
			lis[5].className = "active";
		}
	</script>
</body>
</html>
