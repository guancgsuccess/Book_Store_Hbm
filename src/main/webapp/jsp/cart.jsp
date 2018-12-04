<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>我的购物车</title>
<link type="text/css" rel="stylesheet"
	href="${path}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/animate.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/cart.css" />

</head>

<body onload="changeNum()">
	<%@ include file="common/navbar.jsp"%>
	<!--购物车 begin-->
	<!--外层div-->
	<div class="container">
		<!--左边-->
		<div class="col-md-8 col-sm-12">
			<!--左边-->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的宝贝</a></li>
			</ol>

			<!--购物车表格 begin-->
			<div class="table-responsive" id="imgDiv">
				<table class="table table-hover table-striped"
					style="vertical-align: middle;">
					<thead>
						<tr>
							<td colspan="8"><label class="text-primary">显示条数:</label> <select
								id="cartSzie" class="form-control" style="display: inline"
								onchange="displaySize(this)">
									<option value="2">2</option>
									<option value="4">4</option>
									<option value="6" selected>6</option>
									<option value="8">8</option>
							</select></td>
						</tr>
						<tr class="text-success success">
							<th><input type="checkbox" id="selectAll"
								onclick="selectAll(this)"></th>
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
						<c:if test="${empty bookAndItem}">
							<tr>
								<td><span>没有数据</span></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
						<c:forEach items="${bookAndItem}" var="tag" varStatus="status">

							<tr>
								<td><input type="checkbox" name="cks"></td>
								<td>${status.count+1000}</td>
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
							<td colspan="5"></td>
							<td class="text-success">总价:</td>
							<td class="text-success" id="ttprice"><fmt:formatNumber
									value="${tot}" pattern="#,#00.0#" />元</td>
						</tr>
						<tr style="background-color: white;">
							<td><a href="${path}/book/index" class="btn btn-info">&lt;&lt;继续购买</a>
							</td>
							<td><button class="btn btn-danger" data-toggle="modal"
									data-target="#myModal" onclick="del()">删除商品</button></td>
							<td colspan="4"></td>
							<td><a href="javascript:settle()" class="btn btn-warning">结算商品</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!--购物车 end-->

			<!--删除提示模态框 begin-->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<!--如果没有选中任何一个商品的时候,出现-->
				<div id="first_del" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title text-warning" id="myModalLabel">抱歉!请您先选择商品!</h4>
							</div>
							<div class="modal-body">请选进行勾选!再执行删除删除!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
				</div>
				<!--first_del  end-->

				<!--如果选中了一个商品的时候,出现-->
				<div id="two_del" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title text-warning" id="myModalLabel">删除商品,慎重操作!</h4>
							</div>
							<div class="modal-body">此操作一旦进行,数据将不可恢复!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-danger"
									onclick="delRows(this)">确定删除</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
				</div>
				<!--two_del  end-->
			</div>
			<!--删除提示模态框 end-->
		</div>

		<!--右边-->
		<%@include file="common/sidebar.jsp"%>
	</div>

	<%@include file="common/footer.jsp"%>
	<!--end-->

	<!--引入js文件-->
	<script src="${path}/dist/js/jquery.min.js"></script>
	<script src="${path}/js/wow.js"></script>
	<script src="${path}/js/carousel.js" type="text/javascript"></script>
	<script src="${path}/dist/js/bootstrap.min.js"></script>
	<script src="${path}/js/details.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${path}/js/cart.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>

	<script type="text/javascript">
		function modifyCount(bookid1, n, tt) {
			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var carttag = document.getElementById("carttag");
					var ttprice = document.getElementById("ttprice");
					var text = xmlhttp.responseText;
					var arr = text.split(":");
					carttag.innerHTML = "<li><a href='${path}/permission/cart/showcart' class='text-success '>"
							+ "<span class='glyphicon glyphicon-shopping-cart '></span>我的购物车</a></li>"
							+ "<li><a href='# '>"
							+ arr[0]
							+ "个商品</a></li>"
							+ "<li><a href='# '>总价￥" + arr[1] + "元</a></li>";

					tt.innerHTML = arr[2] + "元";

					ttprice.innerHTML = arr[1] + "元";
				}
			};

			xmlhttp.open("get",
					"${path}/permission/cart/modifyCartAjax?bookid1=" + bookid1
							+ "&newnum=" + n, true);
			xmlhttp.send();
		}

		function delItems(ids) {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var carttag = document.getElementById("carttag");
					var ttprice = document.getElementById("ttprice");
					var text = xmlhttp.responseText;
					var arr = text.split(":");
					carttag.innerHTML = "<li><a href='${path}/permission/cart/showcart' class='text-success '>"
							+ "<span class='glyphicon glyphicon-shopping-cart '></span>我的购物车</a></li>"
							+ "<li><a href='# '>"
							+ arr[0]
							+ "个商品</a></li>"
							+ "<li><a href='# '>总价￥" + arr[1] + "元</a></li>";

					ttprice.innerHTML = arr[1] + "元";
				}
			};

			xmlhttp
					.open("post", "${path}/permission/cart/removeCartAjax",
							true);

			xmlhttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("ids=" + ids);
		}
	</script>

	<script type="text/javascript">
		function settle() {
			var cks = document.getElementsByName("cks");
			var ids = "";
			var count = 0;
			for (var i = cks.length - 1; i >= 0; i--) {
				if (cks[i].checked) {
					count++;
					ids += cks[i].parentNode.parentNode.nextElementSibling.value
							+ ":";
				}
			}
			if (cks.length == 0) {
				var alarm = document.getElementById("alarm");
				alarm.innerText = "购物车为空！";
				$('#alarmModal').modal('show');
				return;
			}
			if (count == 0) {
				ids = "all";
			}

			window.location.href = "${path}/permission/order/comfirm?ids="
					+ ids;
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